// Tests unitaires de src/elements.typ.
#import "aide.typ": *
#import "/src/elements.typ": *

// angles convertis en degrés, quelle que soit l'écriture
#egal(tc-point(45).angle, 45.0, quoi: "nombre de degrés")
#egal(tc-point(45deg).angle, 45.0, quoi: "angle en degrés")
#proche(tc-point(calc.pi / 4 * 1rad).angle, 45, quoi: "angle en radians")

// nom positionnel facultatif
#egal(tc-point(10).name, none, quoi: "point sans nom")
#egal(tc-point(10, $A$).name, $A$, quoi: "point nommé")
#egal(tc-cos-sin(10).name, $M$, quoi: "nom par défaut de tc-cos-sin")
#egal(tc-cos-sin(10, none).name, none, quoi: "tc-cos-sin sans nom")

// valeurs par défaut
#{
  let r = tc-ray(30)
  egal(r._ctz-trigo, "ray", quoi: "sorte")
  egal(r.thickness, auto, quoi: "épaisseur du cercle par défaut")
  egal(r.arrow, false, quoi: "arrow")
  egal(r.copy, none, quoi: "copy")
}
#egal(tc-ray(30, copy: (1, 0)).copy, (1.0, 0.0), quoi: "copy en flottants")
#egal(tc-arc(0, 1rad).to, 1rad.deg(), quoi: "arc")
#egal(tc-angle(0, 90).radius, 0.4, quoi: "rayon de l'angle")
#egal(tc-wind(2).x, 2.0, quoi: "réel enroulé")
#egal(tc-interval(0, 1).from, 0.0, quoi: "intervalle")
#egal(tc-cos-eq(60).lines, true, quoi: "lines")

// marques des points
#egal(tc-point(10).mark, "*", quoi: "marque par défaut")
#egal(tc-point(10).mark-size, 0.1, quoi: "taille du disque plein")
#egal(tc-point(10, mark: "o").mark-size, 0.15, quoi: "taille des autres formes")
#egal(tc-point(10, mark: "x", mark-size: 0.3).mark-size, 0.3, quoi: "taille donnée")
#egal(tc-point(10, mark: none).mark, none, quoi: "sans marque")

// vecteur d'origine quelconque
#{
  let v = tc-vector(30, $arrow(u)$)
  egal(v._ctz-trigo, "vector", quoi: "sorte")
  egal(v.origin, (0.0, 0.0), quoi: "origine par défaut")
  egal(v.length, 1.0, quoi: "vecteur unitaire")
}
#egal(tc-vector(30, from: (1, -0.5)).origin, (1.0, -0.5), quoi: "origine (x, y)")
#{
  let (x, y) = tc-vector(30, from: 90deg).origin
  proche(x, 0, quoi: "origine sur le cercle (x)")
  proche(y, 1, quoi: "origine sur le cercle (y)")
}

// marques des enroulements
#egal(tc-wind(2).mark, "*", quoi: "marque d'enroulement par défaut")
#egal(tc-wind(2).mark-size, 0.1, quoi: "taille du disque plein (enroulement)")
#egal(tc-wind(2, mark: "o").mark-size, 0.15, quoi: "taille des autres formes (enroulement)")
#egal(tc-wind(2, mark: none).mark, none, quoi: "enroulement sans marque")
