#import "template.typ": *

#show: project.with(
  title: "テスト文章",
  authors: ("SnO2WMaN",),
)

= はじめに <sect:intro>

@gore_valentinis_2012

@sect:preliminaries で準備する．

= 準備 <sect:preliminaries>

#definition[
  #lorem(20)
  #struct[
    1. #lorem(20)
    2. #lorem(10)
    3. #lorem(15)
    4. #lorem(7)
  ]
]

#theorem([$LogicGL$の不動点定理])[
  #lorem(20)
]<thm:GL_fixpoint>

#lemma[
  #lorem(20)
]

それでは @thm:GL_fixpoint を証明する．

#proof([@thm:GL_fixpoint])[]

#code[
  ```lean
  lemma IsProperPrefix.trichnomy {s₁ s₂ t₁ t₂ : List α} (he : s₁ ++ t₁ = s₂ ++ t₂) : s₁ = s₂ ∨ s₁ <+:: s₂ ∨ s₂ <+:: s₁ := by
    wlog h : s₁ <+: s₂
    · rcases IsPrefix.dilemma he with (h | h)
      · contradiction
      · simpa [eq_comm, or_comm] using this he.symm h
    rcases eq_or_lt_of_le (IsPrefix.length_le h) with (e | e)
    · left; exact append_inj_left he e
    · right; left
      exact isProperPrefix_iff.mpr ⟨h, e⟩
  ```
]


#proof([@thm:GL_fixpoint, Sambinによる])[]

#proof([@thm:GL_fixpoint, Sambinによる])[]

#proposition[
  #lorem(20)
]

@thm:GL_fixpoint から直ちに次の系が従う．

#corollary[
  #lorem(20)
]

#remark[
  #lorem(50)
]

#example[
  #lorem(50)
]

