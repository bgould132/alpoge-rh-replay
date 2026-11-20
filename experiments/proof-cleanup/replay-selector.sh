#!/usr/bin/env bash
# Supply the prepared Linux project directory and optionally --sources-only.
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd -P)
project=$(cd "${1:?Pass the path to the prepared lean project}" && pwd -P)
if [[ $# -gt 2 || ( $# -eq 2 && "$2" != "--sources-only" ) ]]; then
  echo "Usage: bash replay-selector.sh PROJECT [--sources-only]" >&2
  exit 2
fi
prefix=Development/AutomorphicArithmetic/IntegralCasts/CapelliIdentities
module=$prefix/SelectionLemmas
source_file=src/$module.lean
expected=403c7963e5064fe2d3bc0cbcd26d67dbd394c8c66f5e74298842d4f4b955b27b
candidate=a7c72bc94dea49203d583f842fdfb27590d1d775b9550239faf5a1ed63453077
check_digest() { printf '%s  %s\n' "$1" "$2" | sha256sum -c -; }
check_digest "$expected" "$project/$source_file"
check_digest 21254bdf1536a4c5b11d7e24564c45473673a9259f7efda300c4b3bb43d54d24 "$here/AuditAll.lean"
check_digest 00ec918353f1fd6c28ef9f9f1e422c8f4f1f847834b3e9be7dbca7abe7a7cfe7 "$here/cleanup.patch"
scratch=$(mktemp -d "${TMPDIR:-/tmp}/rh-selector.XXXXXXXX")
trap 'rm -rf -- "$scratch"' EXIT
mkdir -p "$scratch/src/$prefix"
cp "$project/$source_file" "$scratch/$source_file"
(cd "$scratch" && git apply --include="$source_file" "$here/cleanup.patch")
check_digest "$candidate" "$scratch/$source_file"
python3 - "$project/$source_file" "$scratch/$source_file" "$scratch/src/PublishedSelector.lean" <<'PY'
from pathlib import Path
import sys
old, new, output = map(Path, sys.argv[1:])
header, body = old.read_bytes().split(b'\n', 1)
assert header == b'import Mathlib'
imports = [line for line in new.read_bytes().splitlines() if line.startswith(b'import ')]
output.write_bytes(b'\n'.join(imports) + b'\n' +
    body.replace(b'UpperTheory.Reformulated.B.SelectionLemmas', b'PublishedSelector'))
PY
check_digest 2df4509e290e01ff23bdd86be9d4adc86859573021155031b1ae8bb2536dd9d2 "$scratch/src/PublishedSelector.lean"
if [[ "${2:-}" == "--sources-only" ]]; then exit 0; fi
cp "$here/AuditAll.lean" "$scratch/src/"
cd "$project"
pin=leanprover/lean4:v4.33.1
[[ "$(cat lean-toolchain)" == "$pin" ]]
[[ "$(git -C .lake/packages/mathlib rev-parse HEAD)" == 0df444a360eaa60ab8c11dca51a86af692955474 ]]
# Use the prepared project's Lake search path and put the isolated outputs first.
elan run "$pin" lake env bash -eu -o pipefail -c '
  src=$1; module=$2; pin=$3
  export LEAN_PATH="$src:${LEAN_PATH:?Lake search path missing}"
  flags=(-j1 --root="$src" --tstack=400000 -DautoImplicit=false -DrelaxedAutoImplicit=false
         -DmaxSynthPendingDepth=3 -Dpp.unicode.fun=true -DmaxHeartbeats=4000000)
  elan run "$pin" lean --version
  for m in PublishedSelector "$module"; do
    elan run "$pin" lean "${flags[@]}" -o "$src/$m.olean" "$src/$m.lean"
  done
  elan run "$pin" lean "${flags[@]}" "$src/AuditAll.lean"
' _ "$scratch/src" "$module" "$pin"
