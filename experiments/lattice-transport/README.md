# Reusing ten proofs of lattice transport

The proofs describe which constructions survive a change of coordinates by a complex linear equivalence. They cover relative indices, Hermitian forms, semicharacters, fixed sections, self-dual lattices, coset representatives and theta functions. `RkVolChain` already imports a module proving these ten statements. [The proof patch](reuse-transport-proofs.patch) applies those theorems in place of the duplicate proofs, saving 67 lines and preserving their interfaces.

The [self-contained Lean comparison](Transport.lean) includes the actual statements, local definitions and helper proofs from seven published files. It compiles the imported theorems, the ten original proofs in a comparison namespace, and the ten replacements. On native x86-64 Linux, Lean 4.33.1 and Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` verified eleven `rfl` comparisons and the corresponding public arguments and universes. Ten checks are for the theorems and one is for the pullback definition. The ten theorems used only propositional extensionality, classical choice and quotient soundness. The seven source digests match the published mirror at `a6ac91a41`. [Linux receipt](receipts/native-transport.json) · [Source inventory](inputs.json)

| Synchronous elaboration | Published | Revised |
| --- | ---: | ---: |
| Ten already imported theorems | 10,868 | 10,868 |
| Ten declarations in the consumer | 10,822 | 4,109 |
| Total across those declarations | 21,690 | 14,977 |

The shared-inclusive total fell **30.95%**. Each of the ten replacements cost fewer heartbeats than the corresponding local proof. [Per-declaration measurements](receipts/transport-heartbeats.json)

## Reproduce the comparison

From the prepared release project, set `study` to the absolute path of this experiment directory. If the project was prepared with `verify.sh`, use its `ELAN_HOME` and `XDG_CACHE_HOME`.

```bash
pin=leanprover/lean4:v4.33.1
flags=(-j1 --tstack=400000 -DautoImplicit=false -DrelaxedAutoImplicit=false -DmaxSynthPendingDepth=3 -DmaxHeartbeats=4000000)
elan run "$pin" lake env lean "${flags[@]}" --root="$study" "$study/Transport.lean"
elan run "$pin" lake env lean "${flags[@]}" -DElab.async=false --root="$study" "$study/TransportHeartbeats.lean"
```

## Removing redundant imports

[A second patch](three-import-headers.patch) reduces the direct imports in each of `RkVolChain`, `RkVolLat` and `RkVolSeam` from 62 to five, saving another 171 lines. Each removed import is already loaded directly by an earlier retained import. Traversing the committed files in order produced identical dependency lists, respectively 1,629, 1,641 and 1,630 project modules, for both headers. A second comparison included external imports as opaque leaves. [Ordered import digests](published/closure-checks.json)

The two patches apply independently from the root of the [published mirror](https://github.com/TomasOrtega/RH/tree/a6ac91a412dcbaab31801355ec5707024a71bf65). Taken together they remove 238 net lines. The native replay covers the extracted proof sections. A full rebuild of the three production modules with their shortened import lists remains open.
