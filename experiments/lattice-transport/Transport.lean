import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.GroupTheory.Index
import Mathlib.Tactic.Abel
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Mathlib.GroupTheory.Perm.Cycle.Type
import Mathlib.Analysis.Analytic.Linear
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.Analysis.SpecialFunctions.Complex.Log

noncomputable section
open scoped BigOperators ComplexConjugate

namespace Formalism.L2.Th1.H

abbrev Sesq (V : Type*) [AddCommGroup V] [Module ℂ V] := V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ

section General

variable {V : Type*} [AddCommGroup V] [Module ℂ V]

def IsHerm (H : Sesq V) : Prop := ∀ x y, H y x = conj (H x y)

def IsPosDef (H : Sesq V) : Prop := ∀ x, x ≠ 0 → 0 < (H x x).re

def altE (H : Sesq V) (x y : V) : ℝ := (H x y).im

def opU (H : Sesq V) (x : V) (F : V → ℂ) (z : V) : ℂ :=
  F (z + x) * Complex.exp (-(Real.pi : ℂ) * H z x - (Real.pi : ℂ) * H x x / 2)

def dualLat (H : Sesq V) (Λ : AddSubgroup V) : AddSubgroup V where
  carrier := {x | ∀ y ∈ Λ, ∃ m : ℤ, altE H x y = (m : ℝ)}
  zero_mem' := fun y _ => ⟨0, by simp [altE]⟩
  add_mem' := by
    intro a b ha hb y hy
    obtain ⟨m, hm⟩ := ha y hy
    obtain ⟨k, hk⟩ := hb y hy
    exact ⟨m + k, by simp only [altE] at hm hk ⊢; simp [hm, hk]⟩
  neg_mem' := by
    intro a ha y hy
    obtain ⟨m, hm⟩ := ha y hy
    exact ⟨-m, by simp only [altE] at hm ⊢; simp [hm]⟩

def IsSelfDual (H : Sesq V) (Λ : AddSubgroup V) : Prop := dualLat H Λ = Λ

def IsSemiChar (H : Sesq V) (Λ : AddSubgroup V) (α : V → ℂ) : Prop :=
  (∀ x ∈ Λ, α x = 1 ∨ α x = -1) ∧
  ∀ x ∈ Λ, ∀ y ∈ Λ, α (x + y) = α x * α y * Complex.exp ((Real.pi : ℂ) * Complex.I * (altE H x y : ℂ))

def fixedBy (H : Sesq V) (α : V → ℂ) (Λ : AddSubgroup V) : Submodule ℂ (V → ℂ) where
  carrier := {F | ∀ x ∈ Λ, ∀ z, α x * opU H x F z = F z}
  zero_mem' := by intro x _ z; simp [opU]
  add_mem' := by
    intro F G hF hG x hx z
    have h1 := hF x hx z
    have h2 := hG x hx z
    simp only [opU, Pi.add_apply] at h1 h2 ⊢
    rw [← h1, ← h2]; ring
  smul_mem' := by
    intro c F hF x hx z
    have h1 := hF x hx z
    simp only [opU, Pi.smul_apply, smul_eq_mul] at h1 ⊢
    rw [← h1]; ring

def sumU (H : Sesq V) (α : V → ℂ) (S : Finset V) (F : V → ℂ) (z : V) : ℂ := ∑ x ∈ S, α x * opU H x F z

def IsReps (Λ₁ Λ₂ : AddSubgroup V) (S : Finset V) : Prop :=
  (∀ x ∈ S, x ∈ Λ₂) ∧ (∀ x ∈ S, ∀ y ∈ S, x - y ∈ Λ₁ → x = y) ∧ ∀ y ∈ Λ₂, ∃ x ∈ S, y - x ∈ Λ₁

def relIdx (Λ₁ Λ₂ : AddSubgroup V) : ℕ := Λ₁.relIndex Λ₂

def inter (H : Sesq V) (α : V → ℂ) (Λ₁ Λ₂ : AddSubgroup V) (F : V → ℂ) (z : V) : ℂ :=
  ((Real.sqrt (relIdx Λ₁ Λ₂) : ℝ) : ℂ)⁻¹ *
    ∑ᶠ c : Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂, α ((Quotient.out c : Λ₂) : V) * opU H ((Quotient.out c : Λ₂) : V) F z

end General

section Analytic

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V]

def Th (H : Sesq V) (α : V → ℂ) (Λ : AddSubgroup V) : Submodule ℂ (V → ℂ) where
  carrier := {F | AnalyticOnNhd ℂ F Set.univ ∧ F ∈ fixedBy H α Λ}
  zero_mem' := ⟨fun _ _ => analyticAt_const, (fixedBy H α Λ).zero_mem⟩
  add_mem' := fun hF hG => ⟨hF.1.add hG.1, (fixedBy H α Λ).add_mem hF.2 hG.2⟩
  smul_mem' := fun c _ hF => ⟨fun z hz => analyticAt_const.smul (hF.1 z hz), (fixedBy H α Λ).smul_mem c hF.2⟩

end Analytic

def OpUMul : Prop :=
  ∀ (V : Type) [AddCommGroup V] [Module ℂ V] (H : Sesq V), IsHerm H → ∀ (x y : V) (F : V → ℂ) (z : V),
    opU H x (opU H y F) z
      = Complex.exp (-(Real.pi : ℂ) * Complex.I * (altE H x y : ℂ)) * opU H (x + y) F z

def SemiCharBasic : Prop :=
  ∀ (V : Type) [AddCommGroup V] [Module ℂ V] (H : Sesq V), IsHerm H → ∀ (Λ : AddSubgroup V) (α : V → ℂ),
    IsSemiChar H Λ α → α 0 = 1 ∧ (∀ x ∈ Λ, α (-x) = α x) ∧ Λ ≤ dualLat H Λ

def SemiHom : Prop :=
  ∀ (V : Type) [AddCommGroup V] [Module ℂ V] (H : Sesq V), IsHerm H → ∀ (Λ : AddSubgroup V) (α : V → ℂ),
    IsSemiChar H Λ α → ∀ x ∈ Λ, ∀ y ∈ Λ, ∀ (F : V → ℂ) (z : V),
      α x * opU H x (fun v => α y * opU H y F v) z = α (x + y) * opU H (x + y) F z

def InterClass : Prop :=
  ∀ (V : Type) [AddCommGroup V] [Module ℂ V] (H : Sesq V), IsHerm H → ∀ (Λ₁ Λ₂ : AddSubgroup V) (α : V → ℂ),
    IsSemiChar H Λ₂ α → ∀ F ∈ fixedBy H α Λ₁, ∀ x ∈ Λ₂, ∀ y ∈ Λ₂, y ∈ Λ₁ → ∀ z,
      α (x + y) * opU H (x + y) F z = α x * opU H x F z

def RepsExist : Prop :=
  ∀ (V : Type) [AddCommGroup V] [Module ℂ V] (Λ₁ Λ₂ : AddSubgroup V), relIdx Λ₁ Λ₂ ≠ 0 →
    (∃ S : Finset V, IsReps Λ₁ Λ₂ S) ∧ ∀ S : Finset V, IsReps Λ₁ Λ₂ S → S.card = relIdx Λ₁ Λ₂

def InterReps : Prop :=
  ∀ (V : Type) [AddCommGroup V] [Module ℂ V] (H : Sesq V), IsHerm H → ∀ (Λ₁ Λ₂ : AddSubgroup V) (α : V → ℂ),
    IsSemiChar H Λ₂ α → ∀ F ∈ fixedBy H α Λ₁, ∀ S : Finset V, IsReps Λ₁ Λ₂ S → ∀ z,
      inter H α Λ₁ Λ₂ F z = ((Real.sqrt (relIdx Λ₁ Λ₂) : ℝ) : ℂ)⁻¹ * sumU H α S F z

section SlopeTestRemainingChoices

variable {V : Type*} [AddCommGroup V] [Module ℂ V]

theorem herm_sub_swap (H : Sesq V) (hH : IsHerm H) (x y : V) :
    H x y - H y x = 2 * Complex.I * (altE H x y : ℂ) := by
  rw [hH x y, Complex.sub_conj, altE]
  push_cast
  ring

theorem altE_swap (H : Sesq V) (hH : IsHerm H) (x y : V) : altE H y x = -altE H x y := by
  simp only [altE, hH x y, Complex.conj_im]

end SlopeTestRemainingChoices

theorem heisenbergMul : OpUMul := by
  intro V _ _ H hH x y F z
  have hs := herm_sub_swap H hH x y
  simp only [opU]
  rw [mul_assoc, ← Complex.exp_add, mul_left_comm, ← Complex.exp_add, add_assoc z x y]
  congr 2
  simp only [map_add, LinearMap.add_apply]
  linear_combination (-(Real.pi : ℂ) / 2) * hs

theorem semicharacterBasic : SemiCharBasic := by
  intro V _ _ H hH Λ α hα
  obtain ⟨hpm, hmul⟩ := hα
  have hA0 : ∀ x, altE H x x = 0 := fun x => Complex.conj_eq_iff_im.mp (hH x x).symm
  have h0 : α 0 = 1 := by
    have h := hmul 0 Λ.zero_mem 0 Λ.zero_mem
    rw [add_zero, hA0, Complex.ofReal_zero, mul_zero, Complex.exp_zero, mul_one] at h
    rcases hpm 0 Λ.zero_mem with h' | h'
    · exact h'
    · rw [h'] at h; norm_num at h
  have hneg : ∀ x ∈ Λ, α (-x) = α x := by
    intro x hx
    have h := hmul x hx (-x) (Λ.neg_mem hx)
    have hA : altE H x (-x) = 0 := by
      have h' := hA0 x
      simp only [altE] at h' ⊢
      rw [map_neg, Complex.neg_im, h', neg_zero]
    rw [add_neg_cancel, h0, hA, Complex.ofReal_zero, mul_zero, Complex.exp_zero, mul_one] at h
    rcases hpm x hx with h1 | h1 <;> rcases hpm (-x) (Λ.neg_mem hx) with h2 | h2 <;>
      rw [h1, h2] at h ⊢ <;> try norm_num at h
  have hdual : Λ ≤ dualLat H Λ := by
    intro x hx
    show ∀ y ∈ Λ, ∃ m : ℤ, altE H x y = (m : ℝ)
    intro y hy
    have e1 := hmul x hx y hy
    have e2 := hmul y hy x hx
    rw [add_comm y x, altE_swap H hH] at e2
    have hxne : α x ≠ 0 := by rcases hpm x hx with h | h <;> rw [h] <;> norm_num
    have hyne : α y ≠ 0 := by rcases hpm y hy with h | h <;> rw [h] <;> norm_num
    have he : Complex.exp ((Real.pi : ℂ) * Complex.I * (altE H x y : ℂ)) =
        Complex.exp ((Real.pi : ℂ) * Complex.I * ((-altE H x y : ℝ) : ℂ)) := by
      have h := e1.symm.trans e2
      rw [mul_comm (α y) (α x)] at h
      exact mul_left_cancel₀ (mul_ne_zero hxne hyne) h
    rw [Complex.exp_eq_exp_iff_exists_int] at he
    obtain ⟨n, hn⟩ := he
    refine ⟨n, ?_⟩
    have hpi : (Real.pi : ℂ) * Complex.I ≠ 0 :=
      mul_ne_zero (by exact_mod_cast Real.pi_ne_zero) Complex.I_ne_zero
    push_cast at hn
    have h' : ((altE H x y : ℝ) : ℂ) = (n : ℂ) := by
      apply mul_left_cancel₀ (mul_ne_zero (two_ne_zero' ℂ) hpi)
      linear_combination hn
    exact_mod_cast h'
  exact ⟨h0, hneg, hdual⟩

theorem semicharacterHom : SemiHom := by
  intro V _ _ H hH Λ α hα x hx y hy F z
  have hU : opU H x (fun v => α y * opU H y F v) z = α y * opU H x (opU H y F) z := by
    simp only [opU]; ring
  have hd : x ∈ dualLat H Λ := (semicharacterBasic V H hH Λ α hα).2.2 hx
  obtain ⟨m, hm⟩ := (show ∀ y ∈ Λ, ∃ m : ℤ, altE H x y = (m : ℝ) from hd) y hy
  have hexp : Complex.exp (-(Real.pi : ℂ) * Complex.I * (altE H x y : ℂ)) =
      Complex.exp ((Real.pi : ℂ) * Complex.I * (altE H x y : ℂ)) := by
    rw [Complex.exp_eq_exp_iff_exists_int]
    refine ⟨-m, ?_⟩
    rw [hm]
    push_cast
    ring
  rw [hU, heisenbergMul V H hH x y F z, hα.2 x hx y hy, hexp]
  ring

theorem InterClass_of (h : SemiHom) : InterClass := by
  intro V _ _ H hH Λ₁ Λ₂ α hα F hF x hx y hy hy1 z
  have hF' : ∀ w ∈ Λ₁, ∀ v, α w * opU H w F v = F v := hF
  have hfun : (fun v => α y * opU H y F v) = F := funext fun v => hF' y hy1 v
  have e := h V H hH Λ₂ α hα x hx y hy F z
  exact e.symm.trans (congrArg (fun G => α x * opU H x G z) hfun)

section Reps

variable {V : Type} [AddCommGroup V] [Module ℂ V]

def repClass {Λ₁ Λ₂ : AddSubgroup V} {S : Finset V} (hS : IsReps Λ₁ Λ₂ S) (x : S) :
    Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂ :=
  QuotientAddGroup.mk (⟨x.1, hS.1 x.1 x.2⟩ : Λ₂)

private theorem quotient_addSubgroupOf_mk_eq_mk_iff_sub_mem {Λ₁ Λ₂ : AddSubgroup V} (a b : Λ₂) :
    (QuotientAddGroup.mk a : Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) = QuotientAddGroup.mk b ↔
      ((b : V) - (a : V)) ∈ Λ₁ := by
  rw [QuotientAddGroup.eq, AddSubgroup.mem_addSubgroupOf, AddSubgroup.coe_add,
    AddSubgroup.coe_neg, neg_add_eq_sub]

theorem repClass_bijective {Λ₁ Λ₂ : AddSubgroup V} {S : Finset V} (hS : IsReps Λ₁ Λ₂ S) :
    Function.Bijective (repClass hS) := by
  constructor
  · rintro ⟨a, ha⟩ ⟨b, hb⟩ hab
    have h := (quotient_addSubgroupOf_mk_eq_mk_iff_sub_mem (Λ₁ := Λ₁) (⟨a, hS.1 a ha⟩ : Λ₂) ⟨b, hS.1 b hb⟩).1 hab
    exact Subtype.ext (hS.2.1 b hb a ha h).symm
  · intro c
    obtain ⟨⟨y, hy⟩, rfl⟩ := QuotientAddGroup.mk_surjective c
    obtain ⟨x, hxS, hyx⟩ := hS.2.2 y hy
    exact ⟨⟨x, hxS⟩, (quotient_addSubgroupOf_mk_eq_mk_iff_sub_mem (Λ₁ := Λ₁) (⟨x, hS.1 x hxS⟩ : Λ₂) ⟨y, hy⟩).2 hyx⟩

private theorem quotient_addSubgroupOf_mk_out {Λ₁ Λ₂ : AddSubgroup V} (c : Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) :
    (QuotientAddGroup.mk (Quotient.out c) : Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) = c := by
  exact Quotient.out_eq c

private theorem sub_quotient_out_mem_of_mk_eq {Λ₁ Λ₂ : AddSubgroup V} (c : Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) (y : Λ₂)
    (hc : (QuotientAddGroup.mk y : Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) = c) :
    (y : V) - ((Quotient.out c : Λ₂) : V) ∈ Λ₁ := by
  have h1 : (QuotientAddGroup.mk (Quotient.out c) : Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) =
      QuotientAddGroup.mk y := by
    rw [hc]; exact quotient_addSubgroupOf_mk_out c
  exact (quotient_addSubgroupOf_mk_eq_mk_iff_sub_mem (Λ₁ := Λ₁) (Quotient.out c) y).1 h1

end Reps

theorem cosetRepsExist : RepsExist := by
  intro V _ _ Λ₁ Λ₂ hne
  classical
  have hQ : Finite (Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) := Nat.finite_of_card_ne_zero hne
  refine ⟨?_, fun S hS => ?_⟩
  · letI : Fintype (Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) := Fintype.ofFinite _
    refine ⟨Finset.univ.image (fun c : Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂ => ((Quotient.out c : Λ₂) : V)),
      ?_, ?_, ?_⟩
    · intro x hx
      obtain ⟨c, -, rfl⟩ := Finset.mem_image.1 hx
      exact (Quotient.out c).2
    · intro x hx y hy hxy
      obtain ⟨c, -, rfl⟩ := Finset.mem_image.1 hx
      obtain ⟨d, -, rfl⟩ := Finset.mem_image.1 hy
      have h1 := (quotient_addSubgroupOf_mk_eq_mk_iff_sub_mem (Λ₁ := Λ₁) (Quotient.out d) (Quotient.out c)).2 hxy
      rw [quotient_addSubgroupOf_mk_out, quotient_addSubgroupOf_mk_out] at h1
      rw [h1]
    · intro y hy
      refine ⟨((Quotient.out (QuotientAddGroup.mk ⟨y, hy⟩ : Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) : Λ₂) : V),
        Finset.mem_image.2 ⟨_, Finset.mem_univ _, rfl⟩, ?_⟩
      exact sub_quotient_out_mem_of_mk_eq _ ⟨y, hy⟩ rfl
  · have h1 := Nat.card_eq_of_bijective _ (repClass_bijective hS)
    have h2 : Nat.card S = S.card := by
      exact Nat.card_eq_finsetCard S
    rw [h2] at h1
    exact h1

theorem InterReps_of (h : SemiHom) : InterReps := by
  intro V _ _ H hH Λ₁ Λ₂ α hα F hF S hS z
  classical
  have hcl := InterClass_of h V H hH Λ₁ Λ₂ α hα F hF
  letI : Fintype (Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) := Fintype.ofBijective _ (repClass_bijective hS)
  unfold inter sumU
  congr 1
  rw [finsum_eq_sum_of_fintype, ← Finset.sum_coe_sort S]
  symm
  refine Fintype.sum_bijective (repClass hS) (repClass_bijective hS) _ _ ?_
  intro s
  show α (s : V) * opU H (s : V) F z = _
  have hmem := sub_quotient_out_mem_of_mk_eq (repClass hS s) ⟨s, hS.1 s s.2⟩ rfl
  have h2 := hcl ((Quotient.out (repClass hS s) : Λ₂) : V) (Quotient.out (repClass hS s)).2
    ((s : V) - ((Quotient.out (repClass hS s) : Λ₂) : V))
    (Λ₂.sub_mem (hS.1 s s.2) (Quotient.out (repClass hS s)).2) hmem z
  rw [show ∀ a b : V, a + (b - a) = b from fun a b => by abel] at h2
  exact h2

end Formalism.L2.Th1.H

namespace Formalism.L2.Ker.KS

open Formalism.L2.Th1.H

section Gen

variable {V W : Type} [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W] (e : V ≃ₗ[ℂ] W)

abbrev pb (Λ : AddSubgroup W) : AddSubgroup V := Λ.comap e.toLinearMap.toAddMonoidHom

theorem relIdx_pb (Λ₁ Λ₂ : AddSubgroup W) : relIdx (pb e Λ₁) (pb e Λ₂) = relIdx Λ₁ Λ₂ := by
  unfold relIdx
  rw [AddSubgroup.relIndex_comap, AddSubgroup.map_comap_eq_self_of_surjective]
  exact e.surjective

variable (H : Sesq V) (H' : Sesq W) (hH : ∀ x y, H x y = H' (e x) (e y))

include hH

theorem opU_pb (x z : V) (F : W → ℂ) : opU H x (fun v => F (e v)) z = opU H' (e x) F (e z) := by
  simp only [opU, map_add, hH]

theorem herm_pb (h : IsHerm H') : IsHerm H := fun x y => by rw [hH, hH]; exact h _ _

theorem semi_pb {Λ : AddSubgroup W} {α : V → ℂ} {α' : W → ℂ} (hα : ∀ x, e x ∈ Λ → α x = α' (e x))
    (h : IsSemiChar H' Λ α') : IsSemiChar H (pb e Λ) α := by
  refine ⟨fun x hx => by rw [hα x hx]; exact h.1 _ hx, fun x hx y hy => ?_⟩
  have hx' : e x ∈ Λ := hx
  have hy' : e y ∈ Λ := hy
  have hxy : e (x + y) ∈ Λ := by rw [map_add]; exact Λ.add_mem hx' hy'
  rw [hα _ hxy, hα x hx', hα y hy', map_add, h.2 _ hx' _ hy']
  simp only [altE, hH]

theorem fixed_pb {Λ : AddSubgroup W} {α : V → ℂ} {α' : W → ℂ} (hα : ∀ x, e x ∈ Λ → α x = α' (e x)) {F : W → ℂ}
    (h : F ∈ fixedBy H' α' Λ) : (fun v => F (e v)) ∈ fixedBy H α (pb e Λ) := by
  intro x hx z
  rw [hα x hx, opU_pb e H H' hH]
  exact h _ hx _

theorem selfDual_pb {Λ : AddSubgroup W} (h : IsSelfDual H' Λ) : IsSelfDual H (pb e Λ) := by
  unfold IsSelfDual at h ⊢
  ext x
  constructor
  · intro hx
    show e x ∈ Λ
    rw [← h]
    intro y hy
    obtain ⟨m, hm⟩ := hx (e.symm y) (by show e (e.symm y) ∈ Λ; rwa [e.apply_symm_apply])
    refine ⟨m, ?_⟩
    rw [← hm]
    simp only [altE, hH, e.apply_symm_apply]
  · intro hx y hy
    have hx' : e x ∈ dualLat H' Λ := by rw [h]; exact hx
    obtain ⟨m, hm⟩ := hx' (e y) hy
    refine ⟨m, ?_⟩
    rw [← hm]
    simp only [altE, hH]

theorem reps_pb {Λ₁ Λ₂ : AddSubgroup W} {S : Finset W} (hS : IsReps Λ₁ Λ₂ S) :
    IsReps (pb e Λ₁) (pb e Λ₂) (S.map e.symm.toEquiv.toEmbedding) := by
  refine ⟨?_, ?_, ?_⟩
  · intro x hx
    obtain ⟨y, hy, rfl⟩ := Finset.mem_map.1 hx
    show e (e.symm y) ∈ Λ₂
    rw [e.apply_symm_apply]
    exact hS.1 y hy
  · intro x hx y hy hxy
    obtain ⟨x', hx', rfl⟩ := Finset.mem_map.1 hx
    obtain ⟨y', hy', rfl⟩ := Finset.mem_map.1 hy
    have : e (e.symm x' - e.symm y') ∈ Λ₁ := hxy
    rw [map_sub, e.apply_symm_apply, e.apply_symm_apply] at this
    rw [hS.2.1 x' hx' y' hy' this]
  · intro y hy
    obtain ⟨x, hx, hxy⟩ := hS.2.2 (e y) hy
    refine ⟨e.symm x, Finset.mem_map.2 ⟨x, hx, rfl⟩, ?_⟩
    show e (y - e.symm x) ∈ Λ₁
    rwa [map_sub, e.apply_symm_apply]

theorem inter_pb (hH' : IsHerm H') (Λ₁ Λ₂ : AddSubgroup W) (α : V → ℂ) (α' : W → ℂ)
    (hα₁ : ∀ x, e x ∈ Λ₁ → α x = α' (e x)) (hα₂ : ∀ x, e x ∈ Λ₂ → α x = α' (e x))
    (hS : IsSemiChar H' Λ₂ α') (hidx : relIdx Λ₁ Λ₂ ≠ 0) (F : W → ℂ) (hF : F ∈ fixedBy H' α' Λ₁) :
    inter H α (pb e Λ₁) (pb e Λ₂) (fun v => F (e v)) = fun z => inter H' α' Λ₁ Λ₂ F (e z) := by
  funext z
  obtain ⟨⟨S, hSr⟩, -⟩ := cosetRepsExist W Λ₁ Λ₂ hidx
  rw [InterReps_of semicharacterHom W H' hH' Λ₁ Λ₂ α' hS F hF S hSr (e z),
    InterReps_of semicharacterHom V H (herm_pb e H H' hH hH') _ _ α (semi_pb e H H' hH hα₂ hS) _
      (fixed_pb e H H' hH hα₁ hF) _ (reps_pb e H H' hH hSr) z, relIdx_pb]
  congr 1
  simp only [sumU, Finset.sum_map]
  refine Finset.sum_congr rfl fun x hx => ?_
  have hx2 : e (e.symm x) ∈ Λ₂ := by rw [e.apply_symm_apply]; exact hSr.1 x hx
  show α (e.symm x) * opU H (e.symm x) (fun v => F (e v)) z = _
  rw [opU_pb e H H' hH, hα₂ _ hx2, e.apply_symm_apply]

end Gen

section GenTh

variable {V W : Type} [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V] [NormedAddCommGroup W] [NormedSpace ℂ W]
  (e : V ≃ₗ[ℂ] W) (H : Sesq V) (H' : Sesq W) (hH : ∀ x y, H x y = H' (e x) (e y))

include hH in
theorem th_pb {Λ : AddSubgroup W} {α : V → ℂ} {α' : W → ℂ} (hα : ∀ x, e x ∈ Λ → α x = α' (e x)) {F : W → ℂ}
    (h : F ∈ Th H' α' Λ) : (fun v => F (e v)) ∈ Th H α (pb e Λ) := by
  refine ⟨?_, fixed_pb e H H' hH hα h.2⟩
  have h1 : AnalyticOnNhd ℂ (LinearMap.toContinuousLinearMap e.toLinearMap) Set.univ :=
    (LinearMap.toContinuousLinearMap e.toLinearMap).analyticOnNhd _
  exact h.1.comp h1 (fun _ _ => Set.mem_univ _)

end GenTh

theorem not_dvd_relIdx {V : Type*} [AddCommGroup V] (Λ₁ Λ₂ : AddSubgroup V) (p s : ℕ) [Fact p.Prime] (hs : Nat.Coprime s p)
    (h0 : relIdx Λ₁ Λ₂ ≠ 0) (hk : ∀ x ∈ Λ₂, s • x ∈ Λ₁) : ¬ p ∣ relIdx Λ₁ Λ₂ := by
  intro hd
  have h0' : Nat.card (Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) ≠ 0 := h0
  have hd' : p ∣ Nat.card (Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) := hd
  have : Finite (Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) := Nat.finite_of_card_ne_zero h0'
  obtain ⟨q, hq⟩ := exists_prime_addOrderOf_dvd_card' p hd'
  have hsq : s • q = 0 := by
    induction q using QuotientAddGroup.induction_on with | H a => ?_
    rw [← QuotientAddGroup.mk_nsmul, QuotientAddGroup.eq_zero_iff, AddSubgroup.mem_addSubgroupOf, AddSubgroup.coe_nsmul]
    exact hk _ a.2
  have h1 : p ∣ s := hq ▸ addOrderOf_dvd_of_nsmul_eq_zero hsq
  have h2 : p ∣ Nat.gcd s p := Nat.dvd_gcd h1 dvd_rfl
  rw [hs] at h2
  exact (Fact.out : p.Prime).one_lt.ne' (Nat.dvd_one.1 h2)

end Formalism.L2.Ker.KS

namespace PublishedCdKS

open Formalism.L2.Th1.H

section Gen

variable {V W : Type} [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W] (e : V ≃ₗ[ℂ] W)

abbrev pb (Λ : AddSubgroup W) : AddSubgroup V := Λ.comap e.toLinearMap.toAddMonoidHom

theorem relIdx_pb (Λ₁ Λ₂ : AddSubgroup W) : relIdx (pb e Λ₁) (pb e Λ₂) = relIdx Λ₁ Λ₂ := by
  unfold relIdx
  rw [AddSubgroup.relIndex_comap, AddSubgroup.map_comap_eq_self_of_surjective]
  exact e.surjective

variable (H : Sesq V) (H' : Sesq W) (hH : ∀ x y, H x y = H' (e x) (e y))

include hH

theorem opU_pb (x z : V) (F : W → ℂ) : opU H x (fun v => F (e v)) z = opU H' (e x) F (e z) := by
  simp only [opU, map_add, hH]

theorem herm_pb (h : IsHerm H') : IsHerm H := fun x y => by rw [hH, hH]; exact h _ _

theorem semi_pb {Λ : AddSubgroup W} {α : V → ℂ} {α' : W → ℂ} (hα : ∀ x, e x ∈ Λ → α x = α' (e x))
    (h : IsSemiChar H' Λ α') : IsSemiChar H (pb e Λ) α := by
  refine ⟨fun x hx => by rw [hα x hx]; exact h.1 _ hx, fun x hx y hy => ?_⟩
  have hx' : e x ∈ Λ := hx
  have hy' : e y ∈ Λ := hy
  have hxy : e (x + y) ∈ Λ := by rw [map_add]; exact Λ.add_mem hx' hy'
  rw [hα _ hxy, hα x hx', hα y hy', map_add, h.2 _ hx' _ hy']
  simp only [altE, hH]

theorem fixed_pb {Λ : AddSubgroup W} {α : V → ℂ} {α' : W → ℂ} (hα : ∀ x, e x ∈ Λ → α x = α' (e x)) {F : W → ℂ}
    (h : F ∈ fixedBy H' α' Λ) : (fun v => F (e v)) ∈ fixedBy H α (pb e Λ) := by
  intro x hx z
  have hx' : e x ∈ Λ := hx
  rw [opU_pb e H H' hH, hα x hx']
  exact h _ hx' _

theorem selfDual_pb {Λ : AddSubgroup W} (h : IsSelfDual H' Λ) : IsSelfDual H (pb e Λ) := by
  unfold IsSelfDual at h ⊢
  ext x
  constructor
  · intro hx
    show e x ∈ Λ
    rw [← h]
    intro y' hy'
    obtain ⟨m, hm⟩ := hx (e.symm y') (show e (e.symm y') ∈ Λ by simpa using hy')
    refine ⟨m, ?_⟩
    simpa [altE, hH] using hm
  · intro hx
    have hx' : e x ∈ dualLat H' Λ := by
      rw [h]
      exact hx
    intro y hy
    obtain ⟨m, hm⟩ := hx' (e y) hy
    refine ⟨m, ?_⟩
    simpa [altE, hH] using hm

theorem reps_pb {Λ₁ Λ₂ : AddSubgroup W} {S : Finset W} (hS : IsReps Λ₁ Λ₂ S) :
    IsReps (pb e Λ₁) (pb e Λ₂) (S.map e.symm.toEquiv.toEmbedding) := by
  refine ⟨?_, ?_, ?_⟩
  · intro x hx
    obtain ⟨y, hy, rfl⟩ := Finset.mem_map.1 hx
    show e (e.symm y) ∈ Λ₂
    rw [e.apply_symm_apply]
    exact hS.1 y hy
  · intro x hx y hy hxy
    obtain ⟨x', hx', rfl⟩ := Finset.mem_map.1 hx
    obtain ⟨y', hy', rfl⟩ := Finset.mem_map.1 hy
    have : e (e.symm x' - e.symm y') ∈ Λ₁ := hxy
    rw [map_sub, e.apply_symm_apply, e.apply_symm_apply] at this
    rw [hS.2.1 x' hx' y' hy' this]
  · intro y hy
    obtain ⟨x, hx, hxy⟩ := hS.2.2 (e y) hy
    refine ⟨e.symm x, Finset.mem_map.2 ⟨x, hx, rfl⟩, ?_⟩
    show e (y - e.symm x) ∈ Λ₁
    rwa [map_sub, e.apply_symm_apply]

theorem inter_pb (hH' : IsHerm H') (Λ₁ Λ₂ : AddSubgroup W) (α : V → ℂ) (α' : W → ℂ)
    (hα₁ : ∀ x, e x ∈ Λ₁ → α x = α' (e x)) (hα₂ : ∀ x, e x ∈ Λ₂ → α x = α' (e x))
    (hS : IsSemiChar H' Λ₂ α') (hidx : relIdx Λ₁ Λ₂ ≠ 0) (F : W → ℂ) (hF : F ∈ fixedBy H' α' Λ₁) :
    inter H α (pb e Λ₁) (pb e Λ₂) (fun v => F (e v)) = fun z => inter H' α' Λ₁ Λ₂ F (e z) := by
  funext z
  obtain ⟨⟨S, hSr⟩, -⟩ := cosetRepsExist W Λ₁ Λ₂ hidx
  rw [InterReps_of semicharacterHom W H' hH' Λ₁ Λ₂ α' hS F hF S hSr (e z),
    InterReps_of semicharacterHom V H (herm_pb e H H' hH hH') _ _ α (semi_pb e H H' hH hα₂ hS) _
      (fixed_pb e H H' hH hα₁ hF) _ (reps_pb e H H' hH hSr) z, relIdx_pb]
  congr 1
  simp only [sumU, Finset.sum_map]
  refine Finset.sum_congr rfl fun x hx => ?_
  have hx2 : e (e.symm x) ∈ Λ₂ := by rw [e.apply_symm_apply]; exact hSr.1 x hx
  show α (e.symm x) * opU H (e.symm x) (fun v => F (e v)) z = _
  rw [opU_pb e H H' hH, hα₂ _ hx2, e.apply_symm_apply]

end Gen

section GenTh

variable {V W : Type} [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V] [NormedAddCommGroup W] [NormedSpace ℂ W]
  (e : V ≃ₗ[ℂ] W) (H : Sesq V) (H' : Sesq W) (hH : ∀ x y, H x y = H' (e x) (e y))

include hH in
theorem th_pb {Λ : AddSubgroup W} {α : V → ℂ} {α' : W → ℂ} (hα : ∀ x, e x ∈ Λ → α x = α' (e x)) {F : W → ℂ}
    (h : F ∈ Th H' α' Λ) : (fun v => F (e v)) ∈ Th H α (pb e Λ) := by
  refine ⟨?_, fixed_pb e H H' hH hα h.2⟩
  have h1 : AnalyticOnNhd ℂ (LinearMap.toContinuousLinearMap e.toLinearMap) Set.univ :=
    (LinearMap.toContinuousLinearMap e.toLinearMap).analyticOnNhd _
  exact h.1.comp h1 (fun _ _ => Set.mem_univ _)

end GenTh

theorem not_dvd_relIdx {V : Type*} [AddCommGroup V] (Λ₁ Λ₂ : AddSubgroup V) (p s : ℕ) [Fact p.Prime] (hs : Nat.Coprime s p)
    (h0 : relIdx Λ₁ Λ₂ ≠ 0) (hk : ∀ x ∈ Λ₂, s • x ∈ Λ₁) : ¬ p ∣ relIdx Λ₁ Λ₂ := by
  intro hd
  have h0' : Nat.card (Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) ≠ 0 := h0
  have hd' : p ∣ Nat.card (Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) := hd
  have : Finite (Λ₂ ⧸ Λ₁.addSubgroupOf Λ₂) := Nat.finite_of_card_ne_zero h0'
  obtain ⟨q, hq⟩ := exists_prime_addOrderOf_dvd_card' p hd'
  have hsq : s • q = 0 := by
    induction q using QuotientAddGroup.induction_on with | H a => ?_
    rw [← QuotientAddGroup.mk_nsmul, QuotientAddGroup.eq_zero_iff, AddSubgroup.mem_addSubgroupOf, AddSubgroup.coe_nsmul]
    exact hk _ a.2
  have h1 : p ∣ s := hq ▸ addOrderOf_dvd_of_nsmul_eq_zero hsq
  have h2 : p ∣ Nat.gcd s p := Nat.dvd_gcd h1 dvd_rfl
  rw [hs] at h2
  exact (Fact.out : p.Prime).one_lt.ne' (Nat.dvd_one.1 h2)

end PublishedCdKS

namespace Formalism.L2.Ker.Cd.KS

open Formalism.L2.Th1.H

section Gen

variable {V W : Type} [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W] (e : V ≃ₗ[ℂ] W)

abbrev pb (Λ : AddSubgroup W) : AddSubgroup V := Λ.comap e.toLinearMap.toAddMonoidHom

theorem relIdx_pb (Λ₁ Λ₂ : AddSubgroup W) : relIdx (pb e Λ₁) (pb e Λ₂) = relIdx Λ₁ Λ₂ :=
  Formalism.L2.Ker.KS.relIdx_pb e Λ₁ Λ₂

variable (H : Sesq V) (H' : Sesq W) (hH : ∀ x y, H x y = H' (e x) (e y))

include hH

theorem opU_pb (x z : V) (F : W → ℂ) : opU H x (fun v => F (e v)) z = opU H' (e x) F (e z) :=
  Formalism.L2.Ker.KS.opU_pb e H H' hH x z F

theorem herm_pb (h : IsHerm H') : IsHerm H :=
  Formalism.L2.Ker.KS.herm_pb e H H' hH h

theorem semi_pb {Λ : AddSubgroup W} {α : V → ℂ} {α' : W → ℂ} (hα : ∀ x, e x ∈ Λ → α x = α' (e x))
    (h : IsSemiChar H' Λ α') : IsSemiChar H (pb e Λ) α :=
  Formalism.L2.Ker.KS.semi_pb e H H' hH hα h

theorem fixed_pb {Λ : AddSubgroup W} {α : V → ℂ} {α' : W → ℂ} (hα : ∀ x, e x ∈ Λ → α x = α' (e x)) {F : W → ℂ}
    (h : F ∈ fixedBy H' α' Λ) : (fun v => F (e v)) ∈ fixedBy H α (pb e Λ) :=
  Formalism.L2.Ker.KS.fixed_pb e H H' hH hα h

theorem selfDual_pb {Λ : AddSubgroup W} (h : IsSelfDual H' Λ) : IsSelfDual H (pb e Λ) :=
  Formalism.L2.Ker.KS.selfDual_pb e H H' hH h

theorem reps_pb {Λ₁ Λ₂ : AddSubgroup W} {S : Finset W} (hS : IsReps Λ₁ Λ₂ S) :
    IsReps (pb e Λ₁) (pb e Λ₂) (S.map e.symm.toEquiv.toEmbedding) :=
  Formalism.L2.Ker.KS.reps_pb e H H' hH hS

theorem inter_pb (hH' : IsHerm H') (Λ₁ Λ₂ : AddSubgroup W) (α : V → ℂ) (α' : W → ℂ)
    (hα₁ : ∀ x, e x ∈ Λ₁ → α x = α' (e x)) (hα₂ : ∀ x, e x ∈ Λ₂ → α x = α' (e x))
    (hS : IsSemiChar H' Λ₂ α') (hidx : relIdx Λ₁ Λ₂ ≠ 0) (F : W → ℂ) (hF : F ∈ fixedBy H' α' Λ₁) :
    inter H α (pb e Λ₁) (pb e Λ₂) (fun v => F (e v)) = fun z => inter H' α' Λ₁ Λ₂ F (e z) :=
  Formalism.L2.Ker.KS.inter_pb e H H' hH hH' Λ₁ Λ₂ α α' hα₁ hα₂ hS hidx F hF

end Gen

section GenTh

variable {V W : Type} [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V] [NormedAddCommGroup W] [NormedSpace ℂ W]
  (e : V ≃ₗ[ℂ] W) (H : Sesq V) (H' : Sesq W) (hH : ∀ x y, H x y = H' (e x) (e y))

include hH in
theorem th_pb {Λ : AddSubgroup W} {α : V → ℂ} {α' : W → ℂ} (hα : ∀ x, e x ∈ Λ → α x = α' (e x)) {F : W → ℂ}
    (h : F ∈ Th H' α' Λ) : (fun v => F (e v)) ∈ Th H α (pb e Λ) :=
  Formalism.L2.Ker.KS.th_pb e H H' hH hα h

end GenTh

theorem not_dvd_relIdx {V : Type*} [AddCommGroup V] (Λ₁ Λ₂ : AddSubgroup V) (p s : ℕ) [Fact p.Prime] (hs : Nat.Coprime s p)
    (h0 : relIdx Λ₁ Λ₂ ≠ 0) (hk : ∀ x ∈ Λ₂, s • x ∈ Λ₁) : ¬ p ∣ relIdx Λ₁ Λ₂ :=
  Formalism.L2.Ker.KS.not_dvd_relIdx Λ₁ Λ₂ p s hs h0 hk

end Formalism.L2.Ker.Cd.KS

universe u

example : @PublishedCdKS.pb = @Formalism.L2.Ker.Cd.KS.pb := rfl
example : @PublishedCdKS.relIdx_pb = @Formalism.L2.Ker.Cd.KS.relIdx_pb := rfl
example : @PublishedCdKS.opU_pb = @Formalism.L2.Ker.Cd.KS.opU_pb := rfl
example : @PublishedCdKS.herm_pb = @Formalism.L2.Ker.Cd.KS.herm_pb := rfl
example : @PublishedCdKS.semi_pb = @Formalism.L2.Ker.Cd.KS.semi_pb := rfl
example : @PublishedCdKS.fixed_pb = @Formalism.L2.Ker.Cd.KS.fixed_pb := rfl
example : @PublishedCdKS.selfDual_pb = @Formalism.L2.Ker.Cd.KS.selfDual_pb := rfl
example : @PublishedCdKS.reps_pb = @Formalism.L2.Ker.Cd.KS.reps_pb := rfl
example : @PublishedCdKS.inter_pb = @Formalism.L2.Ker.Cd.KS.inter_pb := rfl
example : @PublishedCdKS.th_pb = @Formalism.L2.Ker.Cd.KS.th_pb := rfl
example : @PublishedCdKS.not_dvd_relIdx.{u} = @Formalism.L2.Ker.Cd.KS.not_dvd_relIdx.{u} := rfl

open Lean Elab Command in
run_cmd
  let env ← getEnv
  let rec binders : Expr → List (Name × BinderInfo)
    | .forallE n _ body bi => (n.eraseMacroScopes, bi) :: binders body
    | _ => []
  let pairs := [
    (``PublishedCdKS.pb, ``Formalism.L2.Ker.Cd.KS.pb),
    (``PublishedCdKS.relIdx_pb, ``Formalism.L2.Ker.Cd.KS.relIdx_pb),
    (``PublishedCdKS.opU_pb, ``Formalism.L2.Ker.Cd.KS.opU_pb),
    (``PublishedCdKS.herm_pb, ``Formalism.L2.Ker.Cd.KS.herm_pb),
    (``PublishedCdKS.semi_pb, ``Formalism.L2.Ker.Cd.KS.semi_pb),
    (``PublishedCdKS.fixed_pb, ``Formalism.L2.Ker.Cd.KS.fixed_pb),
    (``PublishedCdKS.selfDual_pb, ``Formalism.L2.Ker.Cd.KS.selfDual_pb),
    (``PublishedCdKS.reps_pb, ``Formalism.L2.Ker.Cd.KS.reps_pb),
    (``PublishedCdKS.inter_pb, ``Formalism.L2.Ker.Cd.KS.inter_pb),
    (``PublishedCdKS.th_pb, ``Formalism.L2.Ker.Cd.KS.th_pb),
    (``PublishedCdKS.not_dvd_relIdx, ``Formalism.L2.Ker.Cd.KS.not_dvd_relIdx)]
  for (p, q) in pairs do
    let some a := env.find? p | throwError "missing {p}"
    let some b := env.find? q | throwError "missing {q}"
    unless a.levelParams == b.levelParams && binders a.type == binders b.type do
      throwError "public parameters differ for {q}"
  logInfo m!"Matched {pairs.length} public signatures"

#print axioms Formalism.L2.Ker.Cd.KS.relIdx_pb
#print axioms Formalism.L2.Ker.Cd.KS.opU_pb
#print axioms Formalism.L2.Ker.Cd.KS.herm_pb
#print axioms Formalism.L2.Ker.Cd.KS.semi_pb
#print axioms Formalism.L2.Ker.Cd.KS.fixed_pb
#print axioms Formalism.L2.Ker.Cd.KS.selfDual_pb
#print axioms Formalism.L2.Ker.Cd.KS.reps_pb
#print axioms Formalism.L2.Ker.Cd.KS.inter_pb
#print axioms Formalism.L2.Ker.Cd.KS.th_pb
#print axioms Formalism.L2.Ker.Cd.KS.not_dvd_relIdx

end
