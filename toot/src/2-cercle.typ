#import "SETUP.typ": *
#set document(title: [Le cercle])
#show: toot-page

#title[II. Le cercle]

Le cercle s'écrit `#trig-circle(…)`. Entre les parenthèses, on met les
réglages du cercle, et les éléments à ajouter dessus (voir la
#i-link("1-demarrer.typ")[partie I]). Cette partie détaille les réglages de
ce qui est affiché et de l'allure du cercle ; ceux du repère sont dans la
#i-link("3-repere.typ")[partie III].

#signature("trig-circle(
  ..éléments,
  // ce qui est affiché (cette partie)
  remarkable: bool,
  show-values: bool,
  show-angles: bool,
  show-lines: bool,
  show-points: auto | bool,
  minus-pi: bool,
  show-tan: bool,
  // l'allure (cette partie)
  radius: int | float,
  thickness: length,
  margin: int | float,
  circle-color: color,
  background: color,
  values-size: length,
  angles-size: length,
  names-size: length,
  angles-offset: length,
  // le repère (partie III)
  show-axes: bool,
  show-origin: bool,
  show-ticks: bool,
  show-vectors: bool,
  show-direction: bool,
  show-real-line: auto | bool,
  real-line-label: content,
) -> content")

= Ce qui est affiché

Par défaut, `trig-circle()` dessine le cercle de ProfLycee : les valeurs
remarquables du cosinus et du sinus sur les axes, les angles remarquables
autour du cercle, et les traits de construction en pointillés qui les
relient.

#parametre("remarkable", ("bool",), `true`)[
  Ce paramètre est un interrupteur général. Réglé sur `false`, il retire d'un
  coup les valeurs, les angles et les traits de construction : il reste un
  cercle nu, avec ses axes, sur lequel on ajoute ce qu'on veut. \
  C'est le point de départ de la plupart des exemples de cette
  documentation.
]

#example(```typ
// SETUP
// START
#trig-circle(radius: 1.5, remarkable: false)
```)

#info(title: "Comment fonctionne cet interrupteur ?")[
  Avec `remarkable: false`, les trois paramètres `show-values`, `show-angles`
  et `show-lines` ci-dessous sont ignorés. Pour n'en afficher que certains,
  on laisse `remarkable` sur `true` et on désactive les autres un par un.
]

#parametre("show-values", ("bool",), `true`)[
  Affiche les valeurs remarquables du cosinus (sur l'axe des abscisses) et du
  sinus (sur l'axe des ordonnées) : $1/2$, $sqrt(2)/2$, $sqrt(3)/2$ et leurs
  opposés.
]

#parametre("show-angles", ("bool",), `true`)[
  Affiche les angles remarquables autour du cercle : $pi/6$, $pi/4$,
  $pi/3$, $pi/2$, etc.
]

#parametre("show-lines", ("bool",), `true`)[
  Affiche les traits de construction en pointillés : les rayons vers les
  points remarquables et les rectangles qui relient ces points aux valeurs
  sur les axes.
]

Ci-dessous, on a gardé les valeurs et les angles, mais retiré les traits :

#example(```typ
// SETUP
// START
#trig-circle(radius: 2.5, show-lines: false)
```)

#parametre("show-points", ("auto", "bool"), `auto`)[
  Marque d'un très petit point noir les points du cercle associés aux angles
  remarquables. \
  Avec `auto`, ces points sont affichés seulement quand les angles *et* les
  traits le sont. On peut forcer leur affichage avec `true`, même sur un
  cercle nu.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  show-points: true,
)
```)

#idea(title: "Un gabarit pour les élèves")[
  Un cercle nu avec ses seuls points remarquables fait un bon support
  d'exercice : les élèves y placent eux-mêmes les angles et les valeurs.
]

#parametre("minus-pi", ("bool",), `true`)[
  Choisit l'intervalle dans lequel sont écrits les angles remarquables. \
  Par défaut (`true`), ils sont donnés dans $]-pi ; pi]$, c'est-à-dire par
  leur mesure principale. Avec `false`, ils sont donnés dans $[0 ; 2pi[$.
]

#example(```typ
// SETUP
// START
#trig-circle(radius: 2.5, minus-pi: false, show-lines: false)
```)

#parametre("show-tan", ("bool",), `false`)[
  Ajoute la tangente au cercle au point $I(1 ; 0)$, avec les valeurs
  remarquables de la tangente ($sqrt(3)/3$, $1$, $sqrt(3)$ et leurs opposés)
  et les traits qui les relient au centre.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  show-tan: true,
  show-lines: false,
)
```)

= L'allure du cercle

#parametre("radius", ("int", "float"), `3`)[
  Le rayon du cercle, en centimètres. Il doit être strictement positif. \
  Les valeurs et les angles remarquables gardent la même taille quel que soit
  le rayon : sur un petit cercle, ils se chevauchent vite. En dessous d'un
  rayon de 2, mieux vaut n'afficher qu'une partie des informations, comme
  le montre ce cercle de rayon 1,5.
]

#example(```typ
// SETUP
// START
#trig-circle(radius: 1.5)
```)

#parametre("thickness", ("length",), `1pt`)[
  L'épaisseur du cercle et des axes. C'est aussi l'épaisseur par défaut des
  rayons et des vecteurs (#i-link("5-rayons-vecteurs.typ")[partie V]).
]

#parametre("margin", ("int", "float"), `0.25`)[
  La longueur, en centimètres, dont les axes dépassent du cercle.
]

#parametre("circle-color", ("color",), `black`)[
  La couleur du cercle (les axes restent noirs).
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  thickness: 2pt,
  margin: 0.6,
  circle-color: blue,
)
```)

#parametre("background", ("color",), `white`)[
  La couleur du fond placé derrière les valeurs et les angles remarquables
  (pour qu'ils restent lisibles par-dessus les traits), et à l'intérieur des
  marques creuses des points (#i-link("4-points.typ")[partie IV]). \
  À changer si la page n'est pas blanche, pour que ces fonds ne se voient
  pas.
]

#example(```typ
// SETUP
// START
#block(fill: yellow.lighten(70%), inset: 8pt,
  trig-circle(radius: 2, background: yellow.lighten(70%)),
)
```)

#parametre("values-size", ("length",), `7pt`)[
  La taille du texte des valeurs remarquables (cosinus, sinus, tangente).
]

#parametre("angles-size", ("length",), `8pt`)[
  La taille du texte des angles remarquables.
]

#parametre("angles-offset", ("length",), `10pt`)[
  La distance entre le cercle et les angles remarquables écrits autour.
]

#parametre("names-size", ("length",), `9pt`)[
  La taille des noms des éléments ajoutés (points, rayons, arcs…), pour un
  rayon jusqu'à 1 cm. Au-delà, elle grandit avec le cercle (voir la
  #i-link("1-demarrer.typ")[partie I]).
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2.5,
  show-lines: false,
  values-size: 9pt,
  angles-size: 11pt,
  angles-offset: 16pt,
)
```)
