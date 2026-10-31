// Tests unitaires de src/trig-circle.typ.
#import "aide.typ": *
#import "/src/lib.typ": *

// remarkable: false retire valeurs et angles remarquables
#releve-textes("nu", trig-circle(remarkable: false))
#context egal(textes("nu"), none, quoi: "cercle nu")

// droite réelle : affichée d'elle-même avec un enroulement, nom réglable
#releve-textes("w", trig-circle(remarkable: false, tc-wind(2)))
#context egal(textes("w"), "real line", quoi: "droite réelle automatique (I en maths, non relevé)")
#releve-textes("w2", trig-circle(remarkable: false, real-line-label: [axe], tc-interval(0, 1)))
#context egal(textes("w2"), "axe", quoi: "real-line-label")
#releve-textes("w3", trig-circle(remarkable: false, show-real-line: false, tc-wind(2)))
#context egal(textes("w3"), none, quoi: "show-real-line: false")

// noms des éléments
#releve-textes("p", trig-circle(remarkable: false, tc-point(30, [A]), tc-arc(0, 60, [arc])))
#context egal(textes("p"), "arcA", quoi: "noms (arcs avant points)")

// trig-circle-draw dans le canvas de l'utilisateur
#import "/src/deps.typ": cetz
#releve-textes("d", cetz.canvas({
  trig-circle-draw(radius: 1, remarkable: false, tc-point(90, [B]))
  cetz.draw.content((2, 0), [x])
}))
#context egal(textes("d"), "Bx", quoi: "trig-circle-draw")
