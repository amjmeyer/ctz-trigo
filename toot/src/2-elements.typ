#import "SETUP.typ": *
#set document(title: [Les éléments])
#show: toot-page

#title[II. Les éléments]

Chaque élément prend son ou ses angles, un nom facultatif, puis des clés.
Ils sont dessinés sorte par sorte, les points en dernier (au-dessus).

= Points et marques

`tc-point(angle, nom)`, clés `color`, `anchor`, `mark` et `mark-size`
(largeur en cm, `auto`). Les marques sont celles de pgfplots : `"*"` (par
défaut), `"o"`, `"square"`, `"triangle"`, `"diamond"`, `"star"` (une `*`
finale les remplit), `"+"`, `"x"`, `"|"` (radial), `"-"` (tangent), ou
`none`.

#example(columns: 2, ```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  tc-point(90, $A$, mark: "o"),
  tc-point(150, $B$, mark: "square*", color: blue),
  tc-point(210, $C$, mark: "triangle"),
  tc-point(270, $D$, mark: "star*", color: red),
  tc-point(330, $E$, mark: "x"),
  tc-point(30, $F$, mark: "|"),
)
```)

= Rayons et vecteurs

`tc-ray(angle, nom)` va de O au cercle (`arrow: true` pour un vecteur).
`tc-vector(angle, nom)` trace un vecteur de cette direction n'importe où :
`from` est son origine, un point `(x, y)` en rayons ou un angle (le point du
cercle) ; `length` est sa longueur en rayons (1 par défaut).

#example(columns: 2, ```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  show-direction: true,
  tc-arc(20, 140),
  tc-ray(20, $U$, color: green),
  tc-ray(140, $V$, color: orange),
  tc-vector(20, $arrow(u)$, from: (0.15, -0.85), color: green),
  tc-vector(140, $arrow(v)$, from: (-0.7, -0.3), color: orange),
  tc-angle(20, 140, $(arrow(u), arrow(v))$),
)
```)

= Arcs et angles

`tc-arc(de, à, nom)` : un arc du cercle, clés `color` (rouge), `thickness`,
`arrow`. `tc-angle(de, à, nom)` : un angle au centre, clés `color`,
`radius` (en rayons), `fill` (couleur du secteur).

= Enroulement de la droite réelle

`tc-wind(x, nom)` enroule le réel `x` sur le cercle ; clés `color`,
`segment`, `arc`, `mark`, `mark-size` (la marque vaut pour ses deux
points). `tc-interval(de, à)` marque un segment de la droite réelle.

#example(columns: 2, ```typ
// SETUP
// START
#trig-circle(
  radius: 1.2,
  remarkable: false,
  real-line-label: [axe réel],
  tc-wind(2, $M(2)$),
  tc-wind(-1, $P(-1)$, color: blue, mark: "o"),
)
```)

= Cosinus, sinus, équations

`tc-cos-sin(θ, nom)` : le point M(cos θ ; sin θ) et ses projections
(`angle-name` renomme θ). `tc-cos-eq(α)` et `tc-sin-eq(α)` : les solutions
de $cos x = cos alpha$ et de $sin x = sin alpha$ (clés `color`, `lines`).

#example(columns: 2, ```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  tc-cos-sin(130deg),
)
```)

#example(columns: 2, ```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  show-angles: false,
  show-lines: false,
  tc-cos-eq(60),
)
```)

= Dans son propre canvas

`trig-circle-draw` prend les mêmes arguments et donne les seuls éléments
CeTZ, pour compléter la figure. Les points marqués restent au-dessus de ce
qu'on dessine ensuite (ici, la barre rouge).

#example(columns: 2, ```typ
// SETUP
// START
#cetz.canvas({
  trig-circle-draw(
    radius: 1, remarkable: false,
    tc-wind(1.2, $x$, segment: false),
  )
  cetz.draw.line((1, 0), (1, 1.2), stroke: red + 2pt)
})
```)

#tip[Il faut aussi importer CeTZ : `#import "@preview/cetz:0.5.2"`.]
