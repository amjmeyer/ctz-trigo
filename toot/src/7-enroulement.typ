#import "SETUP.typ": *
#set document(title: [L'enroulement])
#show: toot-page

#title[VII. L'enroulement de la droite réelle]

Pour définir le cercle trigonométrique, on enroule la droite réelle autour du
cercle : la droite est la tangente au cercle au point $I(1 ; 0)$, et chaque
réel $x$ de la droite vient se poser sur un point du cercle, son _image_.
Deux éléments illustrent cette idée.

#warning(title: "Un réel, pas un angle")[
  Contrairement aux autres éléments, `tc-wind` et `tc-interval` prennent un
  *réel*, c'est-à-dire un point de la droite réelle (une longueur), pas un
  angle. Pour le réel $pi/2$, on écrit donc `calc.pi / 2`, et non `90` ni
  `90deg`.
]

#info(title: "La droite réelle s'affiche toute seule")[
  Dès que la figure contient un `tc-wind` ou un `tc-interval`, la droite
  réelle est dessinée, avec le point $I$. Son nom se règle avec
  `real-line-label` (voir la #i-link("3-repere.typ")[partie III]).
]

= Enrouler un réel

`tc-wind(x, nom)` dessine, pour un réel $x$ :
- le point $M$ d'abscisse $x$ sur la droite réelle, et le segment qui le relie
  à $I$ ;
- l'image de $x$ sur le cercle, et l'arc qui la relie à $I$ ;
- une spirale en pointillés, de $M$ vers son image, qui montre
  l'enroulement.

Le nom est écrit à droite de la droite réelle, à côté de $M$.

#signature("tc-wind(
  x,                 // int | float
  nom,               // facultatif : content | none
  color: color,
  segment: bool,
  arc: bool,
  mark: str | none,
  mark-size: auto | int | float,
)")

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  real-line-label: [axe réel],
  tc-wind(2, $M(2)$),
)
```)

#parametre("color", ("color",), `rgb("#228B22")`)[
  La couleur du segment, de l'arc, de la spirale, du point $M$ et du nom.
  L'image sur le cercle reste noire.
]

#parametre("segment", ("bool",), `true`)[
  Avec `false`, le segment de $I$ à $M$ n'est pas dessiné.
]

#parametre("arc", ("bool",), `true`)[
  Avec `false`, l'arc de $I$ à l'image n'est pas dessiné. \
  L'arc dessiné ne fait jamais plus d'un tour : pour $x = 8$, seul le dernier
  morceau, au-delà d'un tour complet, est tracé.
]

#parametre("mark", ("str", "none"), `"*"`)[
  La forme de la marque des deux points : $M$ sur la droite réelle, et son
  image sur le cercle. Ce sont les mêmes marques que pour `tc-point` (voir la
  #i-link("4-points.typ")[partie IV]).
]

#parametre("mark-size", ("auto", "int", "float"), `auto`)[
  La largeur de ces marques, comme pour `tc-point`.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  show-direction: true,
  real-line-label: [axe réel],
  tc-wind(9 * calc.pi / 8, $M((9pi)/8)$, mark: "x"),
  tc-wind(-1, $P(-1)$, color: blue, mark: "o", arc: false),
)
```)

= Marquer un segment de la droite réelle

`tc-interval(de, à)` épaissit le segment de la droite réelle qui va du réel
`de` au réel `à`. Il ne prend pas de nom.

#signature("tc-interval(
  de,                // int | float
  à,                 // int | float
  color: color,
  thickness: length,
)")

#parametre("color", ("color",), `red`)[
  La couleur du segment.
]

#parametre("thickness", ("length",), `2pt`)[
  L'épaisseur du segment.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  real-line-label: [axe réel],
  tc-interval(0, calc.pi / 2),
  tc-arc(0, 90),
)
```)

#idea(title: "Un intervalle et son image")[
  Comme ci-dessus, on associe un `tc-interval` sur la droite réelle à un
  `tc-arc` sur le cercle, pour montrer que l'intervalle $[0 ; pi/2]$
  s'enroule sur un quart de cercle.
]
