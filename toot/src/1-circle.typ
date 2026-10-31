#import "SETUP.typ": *
#set document(title: [Le cercle])
#show: toot-page

#title[I. Le cercle]

Les clés de `trig-circle`. Le rayon et les longueurs sont en cm.

= Ce qui est affiché

Par défaut, le cercle de ProfLycee : valeurs remarquables, angles et traits
de construction. `remarkable: false` les retire d'un coup.

#table(
  columns: 3,
  table.header[*Clé*][*Défaut*][*Rôle*],
  `radius`, `3`, [rayon du cercle],
  `remarkable`, `true`, [`false` : ni valeurs, ni angles, ni traits],
  `show-values`, `true`, [valeurs de cos et sin sur les axes],
  `show-angles`, `true`, [angles remarquables autour du cercle],
  `show-lines`, `true`, [traits de construction en pointillés],
  `show-points`, `auto`, [points des angles remarquables],
  `minus-pi`, `true`, [angles dans $]-pi ; pi]$ (`false` : dans $[0 ; 2pi[$)],
  `show-tan`, `false`, [tangente en I avec les valeurs de tan],
)

#example(columns: 2, ```typ
// SETUP
// START
#trig-circle(
  radius: 1.5,
  minus-pi: false,
  show-tan: true,
  show-lines: false,
)
```)

Un gabarit vierge, avec les seuls points des angles remarquables :

#example(columns: 2, ```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  show-values: false,
  show-angles: false,
  show-points: true,
)
```)

= Le repère

#table(
  columns: 3,
  table.header[*Clé*][*Défaut*][*Rôle*],
  `show-axes`, `true`, [axes],
  `show-origin`, `false`, [nom O de l'origine],
  `show-ticks`, `false`, [graduations ±1 sur les axes],
  `show-vectors`, `false`, [vecteurs $arrow(i)$ et $arrow(j)$],
  `show-direction`, `false`, [flèche rouge du sens direct],
  `show-real-line`, `auto`, [droite réelle en I (`auto` : avec `tc-wind` ou `tc-interval`)],
  `real-line-label`, `[real line]`, [son nom (`[axe réel]`…)],
)

#example(columns: 2, ```typ
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

= L'apparence

#table(
  columns: 3,
  table.header[*Clé*][*Défaut*][*Rôle*],
  `thickness`, `1pt`, [épaisseur du cercle et des axes],
  `margin`, `0.25`, [dépassement des axes au-delà du cercle],
  `circle-color`, `black`, [couleur du cercle],
  `values-size`, `7pt`, [taille des valeurs],
  `angles-size`, `8pt`, [taille des angles remarquables],
  `names-size`, `9pt`, [taille des noms des éléments],
  `angles-offset`, `10pt`, [distance entre le cercle et les angles],
  `background`, `white`, [fond des valeurs, des angles et des marques creuses],
)
