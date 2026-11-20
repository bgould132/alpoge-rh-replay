# Volunteer worker benchmark and queue snapshot

These files accompany the two worker options in [replay PR #19](https://github.com/rohanarun/alpoge-rh-replay/pull/19). The packaging experiment reuses the Linux artifacts from Jan Metzger’s reviewed P0012 submission. The queue experiment uses the ledger and active claims captured at 16:54:40 UTC on November 20, 2026. [P0012 submission](https://github.com/rohanarun/alpoge-rh-replay/issues/1) · [Reviewed receipt](https://github.com/rohanarun/alpoge-rh-replay/blob/9e5923b56645414c5e6df70bfc788751028fe1ee/evidence/volunteers/P0012.json) · [Exact target bundle](https://github.com/JanSimeonMetzger/alpoge-rh-replay/releases/download/replay-P0012-44771372230/targets.tar.gz)

## Run the bundle comparison

Use Git and Python 3.12 or later on Linux. In the commands below, `evidence` is this directory and `prepared/lean` is the original extracted Lean project containing `src/` and `lean-toolchain`. The upstream contributor guide describes preparing the project. A source-only checkout also works if the 16 selected source files match the tracker hashes. [Preparation instructions](https://github.com/rohanarun/alpoge-rh-replay/blob/9e5923b56645414c5e6df70bfc788751028fe1ee/CONTRIBUTING.md#build-a-task)

```sh
git clone https://github.com/rohanarun/alpoge-rh-replay.git tracker-repo
git -C tracker-repo fetch origin refs/pull/19/head
git -C tracker-repo checkout --detach 00ef2a53c69454b15a1a8150cb9a9ac9cbbfcdf5
curl -fL --retry 3 -o P0012.tar.gz https://github.com/JanSimeonMetzger/alpoge-rh-replay/releases/download/replay-P0012-44771372230/targets.tar.gz
mkdir -p benchmark-work
python3 evidence/benchmark_bundles.py --tracker tracker-repo --lean-project prepared/lean \
  --bundle P0012.tar.gz --work-dir benchmark-work --output my-timing.json
```

The harness verifies the archive and reviewed receipt digests, takes every fourth target in the recorded Lake command, and checks the original source and published object digests. It exercises the actual task selection, switches, packaging and receipt code on these 16 targets. The full index is scanned once outside timing and each CLI invocation receives the sample rows. The compiler identity, Mathlib revision probe and Lake build are stubbed to isolate packaging. No network requests occur in the timed calls. The harness checks each generated archive digest and all 128 members’ paths and contents. It also exercises the existing no-bundle mode and removes its temporary project and receipts on exit.

The reference implementation comes from Git revision `9e5923b5`. Its tracker script has SHA-256 `16d1417060d86e45773c05b6a9181f4c279a9861eec9ab112be989e4ec39e36c`. The PR’s measured tracker has SHA-256 `c13da57ad02eb5a088886f7c191c347c4d1635bf80288f9b5b43f0e603591c1d`. [Reference source](https://github.com/rohanarun/alpoge-rh-replay/blob/9e5923b56645414c5e6df70bfc788751028fe1ee/tracker/tasks.py) · [Candidate source](https://github.com/bgould132/alpoge-rh-replay/blob/00ef2a53c69454b15a1a8150cb9a9ac9cbbfcdf5/tracker/tasks.py)

## Measured packaging tradeoff

[integrated-timing.json](integrated-timing.json) records the original timed run on a single WSL2 worker using an NTFS volume and warm files. The sample had 105,005,650 input bytes. Each mode ran three times after a warm-up, in the order default, fast, fast, default, fast, default.

| Measure | Existing bundle | Fast bundle |
| --- | ---: | ---: |
| Median packaging and receipt time | 3.498 s | 1.9511 s |
| Archive size | 5,213,130 bytes | 5,968,410 bytes |

In this sample the fast option saved 1.55 seconds and added 755,280 bytes. One sequential upload would break even at about 3.9 Mbit/s if the transfer sustained a constant rate. That estimate divides the extra bits by the measured worker time saved. Network transfer and Lean compilation were outside the benchmark. [portable-timing.json](portable-timing.json) records a second run using the portable script above.

## Reproduce the historical queue result

```sh
python3 evidence/reproduce_queue.py tracker-repo
```

The script reads two files directly from the local Git history at `9096bbcd`, verifies both digests, and replays the seven captured claim references. It compares six counts and the five highest-ranked results with [queue-snapshot.json](queue-snapshot.json). At the recorded time, 4,575 eligible modules with no project imports were located in 86 partly occupied packets. The live claim queue can differ. [Versioned tracker inputs](https://github.com/rohanarun/alpoge-rh-replay/tree/9096bbcd23e2248d05d5a3f927e8745a744dc59a/tracker)
