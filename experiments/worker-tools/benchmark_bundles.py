"""Compare the tracker bundle options using the reviewed P0012 Linux build products."""
import argparse
import contextlib
import gzip
import hashlib
import io
import json
import shutil
import subprocess
import sys
import tarfile
import tempfile
import time
import types
from pathlib import Path
from unittest.mock import patch

BASE = "9e5923b56645414c5e6df70bfc788751028fe1ee"
ARCHIVE_SHA = "c0924a1458a958d8d04209816f5d68f0b730046a154b18521787b6a141298ee4"
RECEIPT_SHA = "a5bed4f359cb435a322fb79edb47753916473088ca91bc6e6f87f561aede3b50"


def digest(path):
    with path.open("rb") as file:
        return hashlib.file_digest(file, "sha256").hexdigest()


def load_tracker(repo, revision=None):
    """Load the base Git blob or the candidate checkout without writing bytecode."""
    path = repo / "tracker/tasks.py"
    source = (subprocess.check_output(["git", "-C", repo, "show", f"{revision}:tracker/tasks.py"])
              if revision else path.read_bytes())
    module = types.ModuleType("replay_tracker")
    module.__file__ = str(path)
    exec(compile(source, str(path), "exec"), module.__dict__)
    return module


def prepare(repo, source, bundle, receipt, project):
    assert digest(bundle) == receipt["bundle_sha256"] == ARCHIVE_SHA
    assert receipt["packet"] == "P0012" and receipt["command"][:2] == ["lake", "build"]
    requested = receipt["command"][2:]
    assert len(requested) == len(receipt["tasks"]) == 64
    assert all(arg.startswith("+") and arg.endswith(":olean") for arg in requested)
    sample = list(zip(receipt["tasks"], (arg[1:-6] for arg in requested), strict=True))[::4]
    names = dict(sample)
    index = {}
    with gzip.open(repo / "tracker/modules.jsonl.gz", "rt") as file:
        for line in file:
            row = json.loads(line)
            if row["id"] in names:
                assert names[row["id"]] == row["module"] and row["packet"] == "P0012"
                index[row["id"]] = row
    rows = [index[task] for task in names]
    assert len(rows) == 16
    stems = {name.replace(".", "/") for name in names.values()}
    build = project / ".lake/build"
    build.mkdir(parents=True)
    expected = {}
    size = 0
    with tarfile.open(bundle, "r:gz") as archive:
        for member in archive:
            path = member.name
            if not path.startswith(("lib/lean/", "ir/")):
                continue
            stem = path.removeprefix("lib/lean/").removeprefix("ir/").split(".")[0]
            if stem in stems:
                assert member.isfile() and path not in expected
                archive.extract(member, build, filter="data")
                expected[path] = digest(build / path)
                size += member.size
    assert len(expected) == 128 and size == 105005650
    for row in rows:
        stem = row["module"].replace(".", "/")
        assert expected["lib/lean/" + stem + ".olean"] == receipt["objects"][row["id"]]
        dest = project / "src" / (stem + ".lean")
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source / "src" / (stem + ".lean"), dest)
        assert digest(dest) == row["source_sha256"]
    shutil.copyfile(source / "lean-toolchain", project / "lean-toolchain")
    return rows, expected, size


def run(module, label, flags, project, receipt, rows, expected):
    output = project.parent / label
    sha_read = []
    production_digest = module.digest

    def timed_digest(path):
        start = time.monotonic()
        value = production_digest(path)
        if path.name == "targets.tar.gz":
            sha_read.append(time.monotonic() - start)
        return value

    versions = [receipt["toolchain"], receipt["mathlib"]]
    argv = ["tasks.py", "build", "P0012", str(project), str(output), *flags]
    with (patch.object(module, "load", return_value=rows),
          patch.object(sys, "argv", argv),
          patch.object(module, "digest", side_effect=timed_digest),
          patch.object(subprocess, "check_output", side_effect=versions) as probes,
          patch.object(subprocess, "run", return_value=subprocess.CompletedProcess([], 0)) as lake,
          contextlib.redirect_stdout(io.StringIO())):
        start = time.monotonic()
        assert module.main() == 0
        elapsed = time.monotonic() - start
    assert probes.call_count == 2 and lake.call_count == 1
    args = ["lake", "build", *["+" + row["module"] + ":olean" for row in rows]]
    assert lake.call_args.args[0] == ["elan", "run", "leanprover/lean4:v4.33.1", *args]
    generated = json.loads((output / "receipt.json").read_text())
    ids = [row["id"] for row in rows]
    assert generated["tasks"] == ids and generated["command"] == args
    assert generated["objects"] == {key: receipt["objects"][key] for key in ids}
    artifact = output / "targets.tar.gz"
    if not flags:
        assert "bundle_sha256" not in generated and not artifact.exists()
        return
    assert len(sha_read) == 1 and generated["bundle_sha256"] == digest(artifact)
    with tarfile.open(artifact, "r:gz") as archive:
        members = archive.getmembers()
        assert len(members) == len(expected) and {m.name for m in members} == expected.keys()
        for member in members:
            assert member.isfile()
            with archive.extractfile(member) as data:
                assert hashlib.file_digest(data, "sha256").hexdigest() == expected[member.name]
    archive_size = artifact.stat().st_size
    artifact.unlink()
    return {"variant": label, "flags": flags, "elapsed_seconds": round(elapsed, 4),
            "digest_readback_seconds": round(sha_read[0], 4), "bytes": archive_size}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--tracker", required=True, type=Path, help="checkout containing the PR and its base commit")
    parser.add_argument("--lean-project", required=True, type=Path, help="original prepared project with src/ and lean-toolchain")
    parser.add_argument("--bundle", required=True, type=Path, help="P0012 targets.tar.gz from the reviewed release")
    parser.add_argument("--receipt", type=Path, help="checked-in reviewed receipt (defaults to evidence/volunteers/P0012.json)")
    parser.add_argument("--work-dir", type=Path, help="existing directory on the disk to benchmark")
    parser.add_argument("--output", type=Path, help="write the report here (default: standard output)")
    args = parser.parse_args()
    if not __debug__:
        parser.error("Run without -O to enable the integrity checks.")
    repo = args.tracker.resolve()
    receipt_path = args.receipt or repo / "evidence/volunteers/P0012.json"
    assert digest(receipt_path) == RECEIPT_SHA
    receipt = json.loads(receipt_path.read_text())
    old, new = load_tracker(repo, BASE), load_tracker(repo)
    with tempfile.TemporaryDirectory(prefix="replay-bundle-", dir=args.work_dir) as tmp:
        project = Path(tmp) / "project"
        rows, expected, size = prepare(repo, args.lean_project, args.bundle, receipt, project)
        run(new, "no-bundle", [], project, receipt, rows, expected)
        results = [run(new, "warm-default", ["--bundle"], project, receipt, rows, expected)]
        for n, mode in enumerate(("baseline", "fast", "fast", "baseline", "fast", "baseline"), 1):
            module, flag = (old, "--bundle") if mode == "baseline" else (new, "--fast-bundle")
            results.append(run(module, f"{n}-{mode}", [flag], project, receipt, rows, expected))
    report = {"tracker_base": BASE, "candidate_tracker_sha256": digest(repo / "tracker/tasks.py"),
              "archive_sha256": ARCHIVE_SHA, "receipt_sha256": RECEIPT_SHA, "ids": [r["id"] for r in rows],
              "member_count": len(expected), "input_bytes": size, "python": sys.version, "results": results}
    result = json.dumps(report, indent=2) + "\n"
    if args.output:
        args.output.write_text(result)
    else:
        print(result, end="")


if __name__ == "__main__":
    main()
