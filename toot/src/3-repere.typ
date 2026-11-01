#import "SETUP.typ": *
#set document(title: [Le repère])
#show: toot-page

#title[III. Le repère]

Ces réglages de `#trig-circle(…)` concernent le repère orthonormé dans
lequel le cercle est tracé. À part les axes, rien n'est affiché par défaut.
Pour bien les voir, les exemples partent d'un cercle nu
(`remarkable: false`, voir la #i-link("2-cercle.typ")[partie II]).

#parametre("show-axes", ("bool",), `true`)[
  Affiche les deux axes, terminés par une flèche.
]

#example(```typ
// SETUP
// START
#trig-circle(radius: 1.5, remarkable: false, show-axes: false)
```)

#parametre("show-origin", ("bool",), `false`)[
  Écrit le nom $O$ de l'origine du repère, en bas à gauche du centre.
]

#warning(title: "Avec les valeurs remarquables")[
  Quand les valeurs remarquables sont affichées (`show-values: true`, le
  réglage par défaut), le centre porte déjà la valeur $0$ : le nom $O$ n'est
  alors pas écrit, même avec `show-origin: true`.
]

#parametre("show-ticks", ("bool",), `false`)[
  Ajoute une graduation aux points d'abscisse $plus.minus 1$ et d'ordonnée
  $plus.minus 1$, avec leur valeur : sous l'axe des abscisses, à gauche de
  l'axe des ordonnées.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  show-origin: true,
  show-ticks: true,
)
```)

#parametre("show-vectors", ("bool",), `false`)[
  Dessine les vecteurs $arrow(i)$ et $arrow(j)$ du repère. \
  Les axes perdent alors leur flèche, pour que le sens de chaque axe ne soit
  indiqué qu'une seule fois.
]

#parametre("show-direction", ("bool",), `false`)[
  Ajoute une flèche rouge, marquée $+$, qui indique le sens direct (le sens
  inverse des aiguilles d'une montre).
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  show-origin: true,
  show-vectors: true,
  show-direction: true,
)
```)

#parametre("show-real-line", ("auto", "bool"), `auto`)[
  Affiche la droite réelle : la tangente au cercle au point $I(1 ; 0)$,
  orientée vers le haut, sur laquelle on lit les réels qu'on enroule sur le
  cercle. \
  Avec `auto`, elle n'apparaît que si la figure contient un `tc-wind` ou un
  `tc-interval` (voir la #i-link("7-enroulement.typ")[partie VII]).
]

#parametre("real-line-label", ("content",), `[real line]`)[
  Le nom écrit en haut de la droite réelle. Par défaut, il est en anglais,
  comme le reste du paquet : on le remplace en général par `[axe réel]` ou
  `[droite des réels]`.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  show-real-line: true,
  real-line-label: [axe réel],
)
```)
