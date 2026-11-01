#import "SETUP.typ": *
#set document(title: [Cosinus et sinus])
#show: toot-page

#title[VIII. Cosinus et sinus]

= Le cosinus et le sinus d'un angle

`tc-cos-sin(θ, nom)` dessine, pour un angle $theta$ :
- le point $M(cos theta ; sin theta)$ du cercle et le rayon $[O M]$ ;
- l'angle $theta$, marqué autour de O ;
- les projections de $M$ sur les axes, en pointillés ;
- le cosinus (en bleu) sur l'axe des abscisses et le sinus (en rouge) sur
  l'axe des ordonnées, avec leur nom $cos(theta)$ et $sin(theta)$.

#signature("tc-cos-sin(
  angle,             // int | float | angle
  nom,               // facultatif : content | none
  angle-name: content,
)")

Le nom du point est $M$ si on n'en donne pas.

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  tc-cos-sin(130deg),
)
```)

#parametre("angle-name", ("content",), `$theta$`)[
  Le nom de l'angle, repris dans $cos(theta)$ et $sin(theta)$.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  tc-cos-sin(-50, $P$, angle-name: $x$),
)
```)

= Les équations $cos x = cos alpha$ et $sin x = sin alpha$

`tc-cos-eq(α)` dessine les deux points du cercle dont le cosinus vaut
$cos alpha$ (ils sont symétriques par rapport à l'axe des abscisses), reliés
par un segment vertical. `tc-sin-eq(α)` fait de même pour le sinus (points
symétriques par rapport à l'axe des ordonnées, segment horizontal). Ces deux
éléments ne prennent pas de nom.

#signature("tc-cos-eq(
  angle,             // int | float | angle
  color: color,
  lines: bool,
)")

#parametre("color", ("color",), `blue`)[
  La couleur des points, du segment et des rayons.
]

#parametre("lines", ("bool",), `true`)[
  Trace en tirets les rayons qui mènent aux deux solutions.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2.5,
  show-angles: false,
  show-lines: false,
  tc-cos-eq(60),
)
```)

`tc-sin-eq` prend les mêmes paramètres :

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2.5,
  minus-pi: false,
  show-lines: false,
  tc-sin-eq(-30, color: red, lines: false),
)
```)

#idea(title: "Résoudre une équation au tableau")[
  Sur le cercle complet, les valeurs remarquables permettent de lire
  directement $cos alpha$ sur l'axe, et les angles remarquables les deux
  solutions.
]
