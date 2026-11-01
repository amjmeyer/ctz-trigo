#import "SETUP.typ": *
#set document(title: [Les points])
#show: toot-page

#title[IV. Les points]

Un point du cercle s'écrit `tc-point(angle, nom)`, à l'intérieur de
`#trig-circle(…)`. Le point est placé sur le cercle, à l'angle donné, et son
nom (facultatif) est écrit à l'extérieur du cercle. Pour écrire l'angle et le
nom, voir la #i-link("1-demarrer.typ")[partie I].

#signature("tc-point(
  angle,             // int | float | angle
  nom,               // facultatif : content | none
  color: color,
  anchor: auto | str,
  mark: str | none,
  mark-size: auto | int | float,
)")

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  tc-point(30, $A$),
  tc-point(2 * calc.pi / 3 * 1rad, $B$),
  tc-point(-100, $C$),
)
```)

#parametre("color", ("color",), `black`)[
  La couleur du point et de son nom.
]

#parametre("anchor", ("auto", "str"), `auto`)[
  La position du nom par rapport au point. \
  Avec `auto`, le nom est placé à l'extérieur du cercle, dans la direction
  du point, sans jamais chevaucher un axe. Pour le placer autrement, on donne
  une ancre de CeTZ : `"north"`, `"south-east"`, `"west"`… L'ancre désigne le
  côté *du nom* qui touche le point : avec `"north"`, le haut du nom touche le
  point, donc le nom est en dessous.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  tc-point(60, $A$),
  tc-point(120, $B$, anchor: "north-west", color: blue),
)
```)

= Les marques

#parametre("mark", ("str", "none"), `"*"`)[
  La forme de la marque du point. Les noms sont ceux de pgfplots (LaTeX) :
  - `"*"` (disque plein, par défaut) et `"o"` (cercle creux) ;
  - `"square"`, `"triangle"`, `"diamond"`, `"star"` : formes creuses, qu'une
    `*` finale remplit (`"square*"`, `"star*"`…) ;
  - `"+"` et `"x"` : des croix ;
  - `"|"` et `"-"` : un petit trait, *radial* (dans la direction du centre)
    pour `"|"`, *tangent* au cercle pour `"-"`.

  Avec `none`, le point n'est pas marqué : seul son nom est écrit.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  tc-point(90, $A$, mark: "o"),
  tc-point(135, $B$, mark: "square*", color: blue),
  tc-point(180, $C$, mark: "triangle"),
  tc-point(225, $D$, mark: "diamond*", color: orange),
  tc-point(270, $E$, mark: "star*", color: red),
  tc-point(315, $F$, mark: "x"),
  tc-point(0, $G$, mark: "|"),
  tc-point(45, $H$, mark: "-"),
)
```)

#info(title: "Les marques creuses")[
  L'intérieur des marques creuses (`"o"`, `"square"`…) est rempli avec la
  couleur de fond `background` (blanc par défaut, voir la
  #i-link("2-cercle.typ")[partie II]) : le cercle ne les traverse pas.
]

#parametre("mark-size", ("auto", "int", "float"), `auto`)[
  La largeur de la marque, en centimètres, pour un rayon jusqu'à 1 cm (au-delà,
  elle grandit avec le cercle). \
  Avec `auto`, elle vaut 0,1 pour le disque plein `"*"` et 0,15 pour les
  autres marques, moins lisibles en petit.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  tc-point(45, $A$),
  tc-point(135, $B$, mark-size: 0.3),
  tc-point(-135, $C$, mark: "star", mark-size: 0.4),
)
```)
