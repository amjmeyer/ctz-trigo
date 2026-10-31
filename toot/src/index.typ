#import "SETUP.typ": *
#set document(title: [ctz-trigo])
#show: toot-page

#title()

_Le cercle trigonométrique, d'après ProfLycee, construit avec CeTZ._

```typ
#import "@preview/ctz-trigo:0.1.0": *
```

Cette ligne est sous-entendue au début de chaque exemple.

#example(columns: 2, ```typ
// SETUP
// START
#trig-circle(radius: 2.5)
```)

= Une fonction, des éléments

Tout passe par `trig-circle(clés, ..éléments)` : les clés règlent le cercle
(#i-link("1-circle.typ")[partie I]), les éléments `tc-point`, `tc-ray`…
ajoutent ce qu'on veut dessus (#i-link("2-elements.typ")[partie II]).

#example(columns: 2, ```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  show-origin: true,
  tc-point(80deg, $A$),
  tc-ray(1rad, $B$, arrow: true),
  tc-arc(0, 1rad),
  tc-angle(0, 1rad, $1 "rad"$),
)
```)

= Trois règles

- *Les angles* : un nombre de degrés (`45`) ou un angle Typst (`45deg`,
  `calc.pi / 4 * 1rad`). Seuls `tc-wind` et `tc-interval` prennent un réel
  (un point de la droite réelle).
- *Les noms* : facultatifs, juste après le ou les angles, sans clé :
  `tc-point(30, $A$)`.
- *La taille* : au-delà d'un rayon de 1, noms, points et pointes de flèche
  grandissent avec le cercle (deux fois plus grands au rayon 3). Les
  épaisseurs de trait ne changent pas.

#tip[Les noms des fonctions et des clés sont en anglais (le paquet est
publié sur Typst Universe) ; la partie III donne leur équivalent dans
ProfLycee.]
