#import "SETUP.typ": *
#set document(title: [Démarrer])
#show: toot-page

#title[I. Démarrer]

= Importer le paquet

```typ
#import "@preview/ctz-trigo:0.1.0": *
```

*Dans la suite de la documentation, cette ligne est sous-entendue au début de
chaque exemple.*

Il n'est pas nécessaire d'importer CeTZ, sauf pour dessiner soi-même autour
du cercle (voir la #i-link("9-canvas.typ")[partie IX]).

= Le principe : un cercle et des éléments

#info(title: "Le principe")[
  Tout se fait avec `#trig-circle(…)`. Entre les parenthèses, on mélange
  deux sortes d'arguments :
  - des *réglages* (`radius: 2`, `show-tan: true`…), qui décident de ce qui
    est affiché et de l'allure du cercle ;
  - des *éléments* (`tc-point(…)`, `tc-ray(…)`…), qui sont des objets à
    ajouter sur le cercle : un point, un rayon, un arc, etc.

  L'ordre n'a pas d'importance : on peut écrire les réglages avant, après, ou
  entre les éléments.
]

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,              // un réglage
  remarkable: false,        // un réglage
  tc-point(60, $A$),        // un élément
  tc-ray(60, color: blue),  // un élément
)
```)

#info(title: "Comment lire un exemple dans cette documentation ?")[
  Tout le long de la documentation, un exemple a toujours la même structure :
  le code au-dessus, et le rendu en dessous.
]

= Les fonctions du paquet

Le paquet expose deux fonctions qui dessinent le cercle, et dix éléments à
ajouter dessus. Tous les éléments commencent par `tc-` (pour _trigonometric
circle_).

#table(
  columns: 2,
  table.header[*Fonction*][*Rôle*],
  `trig-circle`, [dessine le cercle et ses éléments (#i-link("2-cercle.typ")[partie II] et #i-link("3-repere.typ")[partie III])],
  `trig-circle-draw`, [même chose, mais à placer dans son propre dessin CeTZ (#i-link("9-canvas.typ")[partie IX])],
  `tc-point`, [un point du cercle (#i-link("4-points.typ")[partie IV])],
  `tc-ray`, [un rayon, ou un vecteur, partant du centre O (#i-link("5-rayons-vecteurs.typ")[partie V])],
  `tc-vector`, [un vecteur placé n'importe où (#i-link("5-rayons-vecteurs.typ")[partie V])],
  `tc-arc`, [un arc du cercle (#i-link("6-arcs-angles.typ")[partie VI])],
  `tc-angle`, [un angle au centre (#i-link("6-arcs-angles.typ")[partie VI])],
  `tc-wind`, [l'enroulement d'un réel sur le cercle (#i-link("7-enroulement.typ")[partie VII])],
  `tc-interval`, [un segment de la droite réelle (#i-link("7-enroulement.typ")[partie VII])],
  `tc-cos-sin`, [le point $M(cos theta ; sin theta)$ et ses projections (#i-link("8-cos-sin.typ")[partie VIII])],
  [`tc-cos-eq`, `tc-sin-eq`], [les solutions de $cos x = cos alpha$ et de $sin x = sin alpha$ (#i-link("8-cos-sin.typ")[partie VIII])],
)

#tip(title: "Les noms sont en anglais")[
  Les noms des fonctions et des réglages sont en anglais, car le paquet est
  publié sur Typst Universe. Pour qui connaît ProfLycee, les
  #i-link("annexes.typ")[annexes] donnent l'équivalent des clés de
  `\CercleTrigo`.
]

= Trois règles communes à tous les éléments

== Donner un angle

Un angle peut s'écrire de deux façons :
- par un *nombre*, compris comme un nombre de degrés : `45` ;
- par un *angle Typst*, en degrés ou en radians : `45deg`, `1rad`,
  `calc.pi / 4 * 1rad`.

Les trois cercles ci-dessous sont donc identiques.

#example(```typ
// SETUP
// START
#grid(
  columns: 3,
  column-gutter: 1cm,
  trig-circle(radius: 1, remarkable: false, tc-point(45, $A$)),
  trig-circle(radius: 1, remarkable: false, tc-point(45deg, $A$)),
  trig-circle(radius: 1, remarkable: false, tc-point(calc.pi / 4 * 1rad, $A$)),
)
```)

#warning(title: "Deux exceptions")[
  `tc-wind` et `tc-interval` ne prennent pas un angle, mais un *réel* : un
  point de la droite réelle qu'on enroule sur le cercle. Voir la
  #i-link("7-enroulement.typ")[partie VII].
]

== Nommer un élément

Le nom d'un élément est *facultatif*. Il se place juste après le ou les
angles, sans clé : `tc-point(30, $A$)`, `tc-arc(0, 90, $cal(C)$)`. Il s'écrit
le plus souvent en mode mathématique (`$A$`), mais peut aussi être du texte
(`[départ]`). Le nom est placé à l'extérieur du cercle, sans chevaucher les
axes.

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  remarkable: false,
  tc-point(30, $A$),
  tc-point(150),
  tc-point(-90, [point le plus bas]),
)
```)

== La taille des noms et des points

Quand le rayon dépasse 1 cm, les noms, les points et les pointes de flèches
*grandissent avec le cercle*, mais deux fois moins vite que lui : au rayon 3,
ils sont deux fois plus grands qu'au rayon 1. Ainsi, une figure agrandie
garde les mêmes proportions. En revanche, l'épaisseur des traits ne change
pas.

#example(```typ
// SETUP
// START
#grid(
  columns: 2,
  column-gutter: 1cm,
  align: horizon,
  trig-circle(radius: 1, remarkable: false, tc-point(45, $A$), tc-ray(45, arrow: true)),
  trig-circle(radius: 3, remarkable: false, tc-point(45, $A$), tc-ray(45, arrow: true)),
)
```)

#info(title: "Dans quel ordre les éléments sont-ils dessinés ?")[
  Les éléments sont dessinés par sorte, toujours dans le même ordre, quel que
  soit l'ordre dans lequel on les écrit. Les *points sont dessinés en
  dernier*, au-dessus de tout le reste : un rayon ou un arc ne passe jamais
  par-dessus un point.
]
