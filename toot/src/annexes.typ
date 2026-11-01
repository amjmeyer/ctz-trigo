#import "SETUP.typ": *
#set document(title: [Annexes])
#show: toot-page

#title[Annexes]

= Correspondance avec ProfLycee

Pour qui connaît la commande `\CercleTrigo` de ProfLycee, voici l'équivalent
de ses clés.

#table(
  columns: 2,
  table.header[*`\CercleTrigo`*][*ctz-trigo*],
  [`Rayon`], [`radius:`],
  [`Epaisseur`], [`thickness:`],
  [`Marge`], [`margin:`],
  [`TailleValeurs`], [`values-size:`],
  [`TailleAngles`], [`angles-size:`],
  [`CouleurFond`], [`background:`],
  [`Decal`], [`angles-offset:`],
  [`MoinsPi`], [`minus-pi:`],
  [`AffAngles`], [`show-angles:`],
  [`AffTraits`], [`show-lines:`],
  [`AffValeurs`], [`show-values:`],
  [`ValeursTan`], [`show-tan:`],
  [`EquationCos`, `cos`, `CouleurSol`, `AffTraitsEq`], [`tc-cos-eq(angle, color: …, lines: …)`],
  [`EquationSin`, `sin`], [`tc-sin-eq(angle)`],
  [`Point`, `NomPt`, `Angle`], [`tc-cos-sin(angle, nom, angle-name: …)`],
)

Tout le reste (repère, droite réelle, points, rayons, vecteurs, arcs,
angles, enroulement, `trig-circle-draw`) est un ajout de ctz-trigo.

= Les messages d'erreur

Un réglage mal écrit arrête la compilation avec un message clair (en
anglais), qui nomme la fonction en cause. Par exemple :
- une clé inconnue : `trig-circle: unknown key "raduis"` ;
- un angle qui n'en est pas un : `tc-point: an angle must be a number of
  degrees (45) or an angle (45deg, 1rad), not "45"` ;
- un rayon nul ou négatif, une marque inconnue, plusieurs noms pour un même
  élément…

= Remerciements

Un grand merci à *Cédric Pierquet*, auteur du package LaTeX
#link("https://ctan.org/pkg/proflycee")[ProfLycee] : ctz-trigo reprend
l'allure et les réglages de sa commande `\CercleTrigo`. Le code, lui, est
entièrement réécrit.

= Dépendances

Le paquet ctz-trigo est construit sur
#link("https://typst.app/universe/package/cetz")[CeTZ]. Les noms des marques
des points viennent de pgfplots. Cette documentation est construite avec
#link("https://typst.app/universe/package/toot")[toot].

= Historique des versions

Le détail de l'historique des versions se trouve dans le fichier
#link("https://github.com/amjmeyer/ctz-trigo/blob/main/CHANGELOG.md")[`CHANGELOG.md`]
du dépôt.
