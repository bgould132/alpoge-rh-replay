# Shortening the local Gram determinant argument

This experiment compares the published archive with a source cleanup. The selected module is tracker task **M115707**, in packet **P0056**. Its public theorem bounds the valuation of a local Gram determinant. The matrix pairing, dual lattice and Gram matrices can all be written with existing Mathlib operations. For example, the 1,055-line definition of the pairing becomes a six-line definition using `Matrix.toLinearMapₛₗ₂'`. The statement of the determinant bound drops from 331 lines to ten. Its proof body is byte-for-byte identical.

| Measure | Published | Revised |
| --- | ---: | ---: |
| Source lines | 3,547 | 386 |
| Source bytes | 252,719 | 20,117 |
| Lean elaboration heartbeats across 23 public declarations | 26,436 | 20,086 |
| Compiled module bytes | 1,145,016 | 1,121,824 |
| Two serial compile times, seconds | 9.53, 10.17 | 8.48, 7.95 |

The compiler was Lean 4.33.1 on ARM64 macOS, with Mathlib pinned to `0df444a360eaa60ab8c11dca51a86af692955474`. Both versions used the same five Mathlib imports for the controlled comparisons. The original used `import Mathlib` in the release. The deterministic heartbeat comparison excludes imports and private helpers. Compiled size and timings concern the complete module. Two timing runs per version give a small sample.

[The Lean audit](AuditAll.lean) imports both versions in a single process and checks every public declaration with `rfl`. Each definition must compute the same value. Theorem comparisons check agreement of their propositions through proof irrelevance. The audit also compares argument names, order, binder visibility and universe parameters. The determinant theorem reported only `propext`, `Classical.choice` and `Quot.sound`. The [audit receipt](receipts/all-declarations.json) and [benchmark receipt](receipts/controlled-comparison.json) record the inputs, compiler flags and results.

## Reproduce the selector comparison

Prepare the original Linux project using the replay repository's contributor guide. From this experiment directory, with elan, Bash, Python, Git and sha256sum available, run the following. Use the same `ELAN_HOME` and `XDG_CACHE_HOME` as your prepared project's `verify.sh` run.

```sh
volume=/path/to/prepared/replay-volume
ELAN_HOME="$volume/elan" XDG_CACHE_HOME="$volume/cache" bash ./replay-selector.sh "$volume/lean"
```

The script stages only the selector in a temporary directory, verifies the original, revised and reference-file hashes, compiles both versions, then runs the equality and argument checks. Append `--sources-only` to reproduce the file hashes without compiling. The Linux wrapper’s source preparation was tested separately. The recorded Lean runs were performed on macOS. Volunteers can use the ordinary unmodified archive workflow for coordinator receipts.

## Other changes in the patch

The [cumulative patch](cleanup.patch) applies at the root of the original `lean/` directory. On the [published mirror](https://github.com/TomasOrtega/RH/tree/a6ac91a412dcbaab31801355ec5707024a71bf65/extracted/lean), applying it to the Git index produces tree `c874c0837c99720b30f80f803bbb406ef6f452cf`. The patch also shares six copies of finite-index averaging (14,987 to 5,540 elaboration heartbeats across the old proofs versus the shared proof plus its six uses), shares the Euler-factor argument for primitive characters, and isolates the conditional deduction of ordinary RH from Dirichlet half-plane nonvanishing. That deduction imports three project modules totaling 46 lines, excluding Mathlib. The unconditional theorem still depends on the arithmetic proof.

The complete modified `Main` and a fresh kernel replay of it remain unverified. This comparison supplies independent evidence about the listed changes. The public volunteer ledger tracks builds of the published archive.
