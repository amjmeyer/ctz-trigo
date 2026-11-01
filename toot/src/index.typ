#import "SETUP.typ": *
#set document(title: [ctz-trigo])
#show: toot-page

#title()

_Le cercle trigonométrique, à la manière de ProfLycee._

ctz-trigo sert à dessiner le cercle trigonométrique avec Typst, pour un
cours, une fiche d'exercices ou une interro. Le paquet est construit sur
#link("https://typst.app/universe/package/cetz")[CeTZ], mais il n'est pas
nécessaire de connaître CeTZ pour s'en servir : une seule fonction,
`trig-circle`, dessine le cercle, et on lui ajoute ce qu'on veut dessus. En
résumé :

- *une ligne suffit* pour obtenir le cercle « tout fait » de ProfLycee, avec
  ses valeurs et ses angles remarquables ;

- on peut à l'inverse partir d'un *cercle nu*, et n'afficher que ce dont on a
  besoin (repère, vecteurs $arrow(i)$ et $arrow(j)$, sens direct…) ;

- on peut placer des *points*, des *rayons*, des *vecteurs*, des *arcs* et
  des *angles* ;

- on peut illustrer l'*enroulement de la droite réelle* sur le cercle ;

- on peut représenter le *cosinus et le sinus* d'un angle, et les solutions
  des équations $cos x = cos alpha$ et $sin x = sin alpha$.

Voici le cercle par défaut, obtenu en une ligne :

#example(```typ
// SETUP
// START
#trig-circle()
```)

Et un cercle nu, sur lequel on a ajouté quelques éléments pour illustrer la
définition du radian :

#example(```typ
// SETUP
// START
#trig-circle(
  radius: 2,
  remarkable: false,
  show-axes: false,
  show-origin: true,
  tc-ray(0, $A$),
  tc-ray(1rad, $B$),
  tc-arc(0, 1rad),
  tc-angle(0, 1rad, $1 "rad"$),
)
```)

#warning(title: "Évolutions")[
  ctz-trigo s'inspire directement de la commande `\CercleTrigo` du package
  LaTeX #link("https://ctan.org/pkg/proflycee")[ProfLycee] de *Cédric
  Pierquet*, à laquelle il ajoute de nombreux éléments. \
  Tant que le paquet est en version `0.x`, il pourra évoluer *de façon
  incompatible* entre deux versions.
]

Pour commencer, rendez-vous à la partie #i-link("1-demarrer.typ")[I. Démarrer].
