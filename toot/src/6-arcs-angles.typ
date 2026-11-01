#import "SETUP.typ": *
#set document(title: [Arcs et angles])
#show: toot-page

#title[VI. Arcs et angles]

Ces deux éléments prennent *deux angles* : celui de départ et celui
d'arrivée. On va de l'un à l'autre dans le sens direct si l'angle d'arrivée
est le plus grand, dans le sens indirect sinon.

= Les arcs

`tc-arc(de, à, nom)` épaissit l'arc du cercle qui va de l'angle `de` à
l'angle `à`. Le nom est écrit au milieu de l'arc, à l'extérieur du cercle.

#signature("tc-arc(
  de,                // int | float | angle
  à,                 // int | float | angle
  nom,               // facultatif : content | none
  color: color,
  thickness: length,
  arrow: bool,
)")

#parametre("color", ("color",), `red`)[
  La couleur de l'arc et de son nom.
]

#parametre("thickness", ("length",), `2pt`)[
  L'épaisseur de l'arc.
]

#parametre("arrow", ("bool",), `false`)[
  Avec `true`, l'arc se termine par une flèche, qui montre le sens de
  parcours.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  tc-arc(0, 60, $cal(C)_1$),
  tc-arc(180, 90, $cal(C)_2$, color: blue, arrow: true),
  tc-arc(-30, -150, color: green, thickness: 4pt),
)
```)

#tip(title: "Plus d'un tour")[
  L'arc peut faire plus d'un tour : `tc-arc(0, 400, arrow: true)` fait un
  tour complet, puis continue jusqu'à 40°.
]

= Les angles au centre

`tc-angle(de, à, nom)` marque l'angle au centre qui va de l'angle `de` à
l'angle `à`, par un petit arc fléché autour de O. Le nom est écrit au milieu
de ce petit arc.

#signature("tc-angle(
  de,                // int | float | angle
  à,                 // int | float | angle
  nom,               // facultatif : content | none
  color: color,
  radius: int | float,
  fill: color | none,
)")

#parametre("color", ("color",), `purple`)[
  La couleur du petit arc et du nom.
]

#parametre("radius", ("int", "float"), `0.4`)[
  Le rayon du petit arc, *en rayons du cercle* : avec `0.4`, il mesure 40 %
  du rayon du cercle.
]

#parametre("fill", ("color", "none"), `none`)[
  La couleur du secteur angulaire, sous le petit arc. Avec `none`, le
  secteur n'est pas coloré.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  tc-ray(0),
  tc-ray(50),
  tc-ray(-120),
  tc-angle(0, 50, $alpha$),
  tc-angle(0, -120, $beta$, color: blue, radius: 0.25, fill: blue.lighten(80%)),
)
```)
