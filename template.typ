#import "@preview/ctheorems:1.1.3": *
#import "@preview/codelst:2.0.2": sourcecode

#let meta(json) = block[
  #show link: underline

  #list(
    [この文書のリポジトリは#link(json.url)です．誤植や訂正などはIssuesから連絡してください．],
    [この文書は#text(json.licenseInfo.name)でライセンスされています．],
  )
]

#let project(
  title: "",
  authors: (),
  date: (datetime.today().year(), datetime.today().month(), datetime.today().day()),
  body,
) = {
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)

  set heading(numbering: "1.")
  show heading: set text(size: 14pt, font: "Shippori Antique B1", lang: "ja")

  set text(size: 9.5pt, font: "Shippori Mincho B1", lang: "ja")
  show raw: set text(font: "JuliaMono", size: 7pt)

  show: thmrules.with(qed-symbol: [❏])

  align(center)[
    #block(text(1.75em, font: "Shippori Antique B1", title))
  ]

  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      align(center)[#date.at(0).#date.at(1).#date.at(2)],
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  set par(justify: true)

  set bibliography(title: "参考文献")

  heading(numbering: none)[メタ情報]
  meta(json("meta.json"))

  outline(title: "目次")


  body

  bibliography("references.bib", style: "springer-lecture-notes-in-computer-science")
}

#let thmplain = thmbox.with(
  breakable: false,
  radius: 0pt,
  inset: (left: 1.25em, right: 1.25em, top: 1.5em, bottom: 1.5em),
)

#let definition = thmplain(
  "theorem",
  "定義",
  breakable: true,
  fill: luma(250),
  stroke: (left: (thickness: 0.5em, paint: luma(100))),
)

#let theorem = thmplain(
  "theorem",
  "定理",
  fill: luma(250),
  stroke: (left: (thickness: 0.5em, paint: luma(100))),
)

#let proposition = thmplain(
  "theorem",
  "命題",
  fill: luma(250),
  stroke: (left: (thickness: 0.5em, paint: luma(100))),
)

#let lemma = thmplain(
  "theorem",
  "補題",
  fill: luma(250),
  stroke: (left: (thickness: 0.5em, paint: luma(190))),
)

#let corollary = thmplain(
  "theorem",
  "系",
  fill: luma(250),
  stroke: (left: (thickness: 0.5em, paint: luma(150))),
)

#let remark = thmplain(
  "theorem",
  "注意",
  breakable: true,
  stroke: (left: (thickness: 1pt, paint: luma(230))),
)

#let example = thmbox(
  "theorem",
  "例",
  breakable: true,
  inset: (left: 12pt, top: 5pt, bottom: 8pt),
)

#let notation = thmbox(
  "theorem",
  "記法",
  breakable: true,
  inset: (left: 12pt, top: 5pt, bottom: 8pt),
)

#let proof = thmproof(
  "proof",
  "証明",
  breakable: true,
  titlefmt: strong,
  namefmt: name => [(#name)],
)

#let struct(body) = block(
  width: 100%,
  breakable: true,
  stroke: (left: (thickness: 1pt, paint: luma(230))),
  inset: (left: 12pt, top: 5pt, bottom: 8pt),
)[#body]

#let code = sourcecode.with(
  gutter: 1em,
  frame: block.with(
    radius: 0pt,
    fill: luma(250),
    stroke: (left: 1pt + luma(20)),
    inset: (x: 1.5em, y: 1em),
  ),
)

#let box = $square.stroked$
#let dia = $diamond.stroked$

#let HilbertSystem = $frak("H")$

#let vdash = $tack.r$
#let nvdash = $tack.r.not$
#let vDash = $tack.r.double$
#let nvDash = $tack.r.double.not$

#let Thm = $upright("Thm")$
#let Bew = $bold(upright("Pr"))$
#let Con = $bold(upright("Con"))$

#let ulcorner = $⌈$
#let urcorner = $⌉$
#let GoedelNum(x) = $lr(ulcorner #x urcorner)$

#let Axiom(A) = $sans(upright(#A))$
#let AxiomK = $Axiom("K")$
#let AxiomT = $Axiom("T")$
#let Axiom4 = $Axiom("4")$
#let Axiom5 = $Axiom("5")$
#let AxiomB = $Axiom("B")$
#let AxiomD = $Axiom("D")$
#let AxiomP = $Axiom("P")$
#let AxiomL = $Axiom("L")$
#let AxiomM = $Axiom("M")$
#let AxiomDot2 = $Axiom(".2")$
#let AxiomDot3 = $Axiom(".3")$

#let Rule(R) = $upright("(" #R ")")$
#let RuleMP = $Rule("MP")$
#let RuleNec = $Rule("Nec")$
#let RuleLoeb = $Rule("Löb")$
#let RuleHenkin = $Rule("Henkin")$

#let Logic(L) = $bold(upright(#L))$
#let LogicK = $Logic("K")$
#let LogicKT = $Logic("KT")$
#let LogicS4 = $Logic("S4")$
#let LogicS4Dot2 = $Logic("S4.2")$
#let LogicS5 = $Logic("S5")$
#let LogicGL = $Logic("GL")$
#let LogicS = $Logic("S")$
#let LogicN = $Logic("N")$
#let LogicKT4B = $Logic("KT4B")$
#let LogicTriv = $Logic("Triv")$
#let LogicVer = $Logic("Ver")$
#let LogicGrz = $Logic("Grz")$

#let Lang = $cal(L)$

#let Model(M) = $frak(#M)$
