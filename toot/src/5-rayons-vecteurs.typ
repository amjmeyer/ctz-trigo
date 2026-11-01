#import "SETUP.typ": *
#set document(title: [Rayons et vecteurs])
#show: toot-page

#title[V. Rayons et vecteurs]

Deux éléments tracent des segments : `tc-ray` part toujours du centre O,
alors que `tc-vector` se place n'importe où.

= Les rayons

`tc-ray(angle, nom)` trace le rayon qui va du centre O au point du cercle
d'angle donné. Le nom est écrit au bout du rayon, à l'extérieur du cercle.

#signature(
  "tc-ray(
  angle,             // int | float | angle
  nom,               // facultatif : content | none
  color: color,
  thickness: auto | length,
  arrow: bool,
  label: content | none,
  copy: (x, y) | none,
  copy-name: content | none,
)",
)

#parametre("color", ("color",), `black`)[
  La couleur du rayon et de ses noms.
]

#parametre("thickness", ("auto", "length"), `auto`)[
  L'épaisseur du rayon. Avec `auto`, c'est celle du cercle (réglage
  `thickness` de `trig-circle`, 1pt par défaut).
]

#parametre("arrow", ("bool",), `false`)[
  Avec `true`, le rayon se termine par une flèche : c'est un vecteur.
]

#parametre("label", ("content", "none"), `none`)[
  Un texte écrit au milieu du rayon, du côté des aiguilles d'une montre (sous
  un rayon horizontal). Pratique pour indiquer une longueur.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  tc-ray(0, $I$, label: $1$),
  tc-ray(70, $M$, color: blue, thickness: 2pt),
  tc-ray(160, $arrow(u)$, color: red, arrow: true),
)
```)

#parametre("copy", ("(x, y)", "none"), `none`)[
  Dessine en plus un autre représentant du même vecteur, d'origine le point
  $(x ; y)$. Les coordonnées sont données *en rayons* : `(0, -1)` est le point
  le plus bas du cercle, quel que soit le rayon.
]

#parametre("copy-name", ("content", "none"), `none`)[
  Le nom de ce représentant, écrit à sa gauche (dans le sens de la flèche).
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  tc-ray(
    60,
    $M$,
    arrow: true,
    color: blue,
    copy: (0.2, -0.9),
    copy-name: $arrow(u)$,
  ),
)
```)

#idea(title: "Repérer un angle orienté de vecteurs")[
  En combinant rayons, vecteurs et angles au centre
  (#i-link("6-arcs-angles.typ")[partie VI]), on illustre l'angle orienté
  $(arrow(u), arrow(v))$ :
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  show-direction: true,
  tc-arc(20, 140),
  tc-ray(
    20, $U$, 
    color: green, 
    arrow: true,
    copy: (0.5,-0.5), 
    copy-name: $arrow(u)$,
  ),
  tc-ray(
    140, $V$, 
    color: orange, 
    arrow: true,
    copy: (-0.5,-0.8), 
    copy-name: $arrow(v)$,
  ),
  tc-angle(140, 20, $(arrow(v), arrow(u))$),
)
```)

= Les vecteurs

`tc-vector(angle, nom)` trace un vecteur dont la direction est donnée par
l'angle, et qu'on place où l'on veut avec `from`. Le nom est écrit au milieu
du vecteur, à sa gauche (dans le sens de la flèche).

#signature(
  "tc-vector(
  angle,             // int | float | angle
  nom,               // facultatif : content | none
  from: (x, y) | int | float | angle,
  length: int | float,
  color: color,
  thickness: auto | length,
)",
)

#parametre("from", ("(x, y)", "int", "float", "angle"), `(0, 0)`)[
  L'origine du vecteur. Elle peut s'écrire :
  - comme un point `(x, y)`, en rayons : `(0, 0)` est le centre O,
    `(0.5, 0)` le milieu de $[O I]$ ;
  - comme un angle : l'origine est alors le point du cercle d'angle donné.
]

#parametre("length", ("int", "float"), `1`)[
  La longueur du vecteur, en rayons : avec `1` (par défaut), le vecteur est
  unitaire, de la même longueur que le rayon du cercle.
]

#parametre("color", ("color",), `black`)[
  La couleur du vecteur et de son nom.
]

#parametre("thickness", ("auto", "length"), `auto`)[
  L'épaisseur du vecteur. Avec `auto`, c'est celle du cercle.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  tc-point(90, $A$),
  tc-vector(0, $arrow(u)$, from: 90, color: blue),
  tc-vector(-90, $arrow(v)$, from: (-0.8, 0.4), length: 0.5, color: red),
)
```)


