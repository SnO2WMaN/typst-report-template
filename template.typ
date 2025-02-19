#import "@preview/ctheorems:1.1.3": *
#import "@preview/codelst:2.0.2": sourcecode
#import "@preview/equate:0.2.1": equate

#let project(
  title: "",
  authors: (),
  date: (datetime.today().year(), datetime.today().month(), datetime.today().day()),
  meta: (url: "", licenseInfo: (key: "cc-by-4.0", name: "Creative Commons Attribution 4.0 International")),
  body,
) = {
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)

  set heading(numbering: "1.")
  show heading: set text(size: 14pt, font: "Shippori Antique B1")

  set text(size: 10pt, font: "Shippori Mincho B1")
  show raw: set text(font: "JuliaMono", size: 7pt)

  show: thmrules.with(qed-symbol: [❏])
  show: equate.with(breakable: true, sub-numbering: true, number-mode: "label")

  set math.equation(numbering: "(1.I)", supplement: "式")

  grid(
    columns: (1fr, auto),
    align: (left + horizon, center + horizon, right + horizon),
    rect(stroke: none)[
      #block(text(font: "Shippori Antique B1", weight: 700, 1.75em, title))
      #pad(
        top: .5em,
        grid(
          gutter: .6em,
          ..authors.map(author => text(font: "Shippori Antique B1", author)),
        ),
      )
    ],
    link(meta.url)[
      #rect(
        width: 12.5em,
        fill: black,
        stroke: none,
        inset: 1.25em,
        text(
          font: "JuliaMono",
          fill: white,
          size: 8pt,
        )[
          #align(center)[#text(meta.licenseInfo.name)]
          #align(center)[#date.at(0)/#date.at(1)/#date.at(2)]
        ],
      )
    ],
  )

  set par(justify: true)

  set bibliography(title: "参考文献")

  outline(title: "目次")


  body

  bibliography("references.bib")
}

#let thmplain = thmbox.with(
  breakable: true,
  radius: 0pt,
  inset: (left: 1.5em, right: 1.25em, top: 1.5em, bottom: 1.5em),
  base_level: 1,
  /*
  namefmt: name => [
    #text(font: "Shippori Antique B1")[(#name)]
  ],
  */
  titlefmt: body => [
    #text(font: "Shippori Antique B1")[#body]
  ],
  namefmt: name => [
    #text(font: "Shippori Antique B1")[(#name)]
  ],
  separator: [
    #h(0.1em)
    #text(font: "Shippori Antique B1")[:]
    #h(0.2em)
  ],
)

#let definition = thmplain(
  "theorem",
  "定義",
  fill: luma(250),
  stroke: (left: (thickness: 0.5em, paint: black)),
)

#let theorem = thmplain(
  "theorem",
  "定理",
  fill: luma(250),
  stroke: (left: (thickness: 0.5em, paint: black)),
)

#let proposition = thmplain(
  "theorem",
  "命題",
  fill: luma(250),
  stroke: (left: (thickness: 0.5em, paint: luma(190))),
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
  stroke: (left: (thickness: 0.5em, paint: luma(190))),
)

#let remark = thmplain(
  "theorem",
  "注意",
  stroke: (left: (thickness: 1pt, paint: luma(230))),
)

#let example = thmplain(
  "theorem",
  "例",
  stroke: (left: (thickness: 1pt, paint: luma(230))),
)

#let notation = thmplain(
  "theorem",
  "記法",
  stroke: (left: (thickness: 1pt, paint: luma(230))),
)

#let proof = thmproof(
  "proof",
  "証明",
  breakable: true,
  titlefmt: body => [
    #text(font: "Shippori Antique B1")[#body]
  ],
  namefmt: name => [
    #text(font: "Shippori Antique B1")[(#name)]
  ],
  separator: [
    #h(0.1em)
    #text(font: "Shippori Antique B1")[:]
    #h(0.2em)
  ],
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
#let Vdash = $tack.double$

#let Pr(T) = $upright("Pr")_#T$
#let Con(T) = $upright("Con")_#T$

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
