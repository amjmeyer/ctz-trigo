#import "SETUP.typ": *
#set document(title: [Dans son propre canvas])
#show: toot-page

#title[IX. Dans son propre canvas]

`trig-circle` dessine une figure complète, fermée : on ne peut rien y ajouter
d'autre que les éléments `tc-*`. Pour aller plus loin, et dessiner soi-même
autour du cercle avec CeTZ, on utilise `trig-circle-draw`.

= Le principe

`trig-circle-draw(…)` prend *exactement les mêmes arguments* que
`trig-circle` (réglages et éléments), mais ne crée pas de dessin : il donne
les seuls éléments CeTZ du cercle, à placer dans son propre
`cetz.canvas`. On ajoute ensuite ce qu'on veut avec les fonctions de
`cetz.draw`.

#warning(title: "Importer CeTZ")[
  Il faut alors importer CeTZ, en plus du paquet :
  ```typ
  #import "@preview/cetz:0.5.2"
  ```
]

#example(```typ
// SETUP
// START
#cetz.canvas({
  trig-circle-draw(
    radius: 1.5,
    remarkable: false,
    tc-point(50, $M$),
  )
  // le point M(cos 50° ; sin 50°), pour un rayon de 1,5
  let (x, y) = (1.5 * calc.cos(50deg), 1.5 * calc.sin(50deg))
  cetz.draw.line((x, y), (2.5, 1.8), stroke: blue, mark: (end: ">"))
  cetz.draw.content((2.5, 1.8), [le point $M$], anchor: "south-west")
})
```)

= Les coordonnées

Dans le canvas, le centre du cercle est l'origine $(0, 0)$ et les unités sont
celles du canvas : le point du cercle d'angle $theta$ a pour coordonnées
$("radius" times cos theta, "radius" times sin theta)$. \
`trig-circle` utilise une unité de 1 cm ; dans son propre canvas, on choisit
l'unité avec `length`. Ci-dessous, avec un rayon de 1 et une unité de
1,5 cm, les coordonnées sont celles du repère du cercle, et la droite réelle
a pour équation $x = 1$.

#example(```typ
// SETUP
// START
#cetz.canvas(length: 1.5cm, {
  let (x, y) = (70deg.rad(), 120deg.rad())
  trig-circle-draw(
    radius: 1,
    remarkable: false,
    show-origin: true,
    tc-arc(70deg, 120deg),
    tc-ray(70deg, $U$, color: green),
    tc-ray(120deg, $V$, color: orange),
    tc-wind(x, $x$, segment: false, arc: false),
    tc-wind(y, $y$, color: orange, segment: false, arc: false),
  )
  // le segment [x ; y] de la droite réelle
  cetz.draw.line((1, x), (1, y), stroke: red + 2pt)
})
```)

#info(title: "Les points restent au-dessus")[
  Les points marqués du cercle sont dessinés sur une couche à part : ils
  restent au-dessus de tout ce qu'on dessine ensuite dans le canvas. Dans
  l'exemple ci-dessus, la barre rouge passe sous les marques des points.
]
