import New.Determinant.Chain.Moduli
import Lean.Elab.Command

/-!
# Focused kernel check for the determinant quotient pair

From `grh/`, run `lake lean scripts/RecheckQuotientPair.lean` after building the
readable edition. The check stops at the first kernel error. It rechecks the
private proofs named for `New.Data.quotientPair` and the public definition.
The ordinary import environment supplies their dependencies. Omitting the
`module` header is intentional so the kernel can see the imported definitions.

The check specializes the per-declaration replay used to diagnose
[upstream issue #7560](https://github.com/leanprover-community/riemann-hypothesis/issues/7560#issuecomment-7198168985).
The whole-proof comparator separately exports the headline theorems and
checks their dependency closure in a fresh environment.
-/

open Lean Elab Command

run_cmd liftTermElabM do
  let env ← getEnv
  let mainDecl := `New.Data.quotientPair
  let some (.defnInfo parent) := env.find? mainDecl
    | throwError "missing definition {mainDecl}"
  let maxHb := (Core.getMaxHeartbeats (← getOptions)).toUSize
  let depth := defaultMaxRecDepth.toUSize
  let mut checked : Nat := 0
  let mut sawModule := false
  for i in [0:env.header.moduleData.size] do
    if env.header.moduleNames[i]! == `New.Determinant.Chain.Moduli then
      sawModule := true
      for n in env.header.moduleData[i]!.constNames do
        unless isPrivateName n && mainDecl.isPrefixOf (privateToUserName n) do continue
        let some (.thmInfo thm) := env.find? n | continue
        let probe := Declaration.thmDecl { thm with name := `RecheckProbe ++ n }
        match env.addDeclCore maxHb depth probe none with
        | .ok _ => checked := checked + 1
        | .error err => throwError "kernel rejected {n}\n{err.toMessageData {}}"
  unless sawModule && (checked != 0) do
    throwError "expected private proof declarations for {mainDecl} in the determinant module"
  let newName := `RecheckProbe ++ mainDecl
  let probe := Declaration.defnDecl { parent with name := newName, all := [newName] }
  match env.addDeclCore maxHb depth probe none with
  | .ok _ => logInfo m!"kernel accepted {mainDecl} and {checked} associated proof declarations"
  | .error err => throwError "kernel rejected {mainDecl}\n{err.toMessageData {}}"
