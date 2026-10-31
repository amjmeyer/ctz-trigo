#import "SETUP.typ": *
#set document(title: [Depuis ProfLycee])
#show: toot-page

#title[III. Depuis ProfLycee]

Les clés de `\CercleTrigo` et leur équivalent.

#table(
  columns: 2,
  table.header[*`\CercleTrigo`*][*ctz-trigo*],
  [`Rayon`, `Epaisseur`, `Marge`], [`radius`, `thickness`, `margin`],
  [`TailleValeurs`, `TailleAngles`, `CouleurFond`, `Decal`], [`values-size`, `angles-size`, `background`, `angles-offset`],
  [`MoinsPi`, `AffAngles`, `AffTraits`, `AffValeurs`, `ValeursTan`], [`minus-pi`, `show-angles`, `show-lines`, `show-values`, `show-tan`],
  [`EquationCos`, `cos`, `CouleurSol`, `AffTraitsEq`], [`tc-cos-eq(angle, color: …, lines: …)`],
  [`EquationSin`, `sin`], [`tc-sin-eq(angle)`],
  [`Point`, `NomPt`, `Angle`], [`tc-cos-sin(angle, nom, angle-name: …)`],
)

Tout le reste (repère, droite réelle, éléments, marques) est un ajout de
ctz-trigo.
