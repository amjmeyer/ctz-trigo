// Réglages communs à toutes les pages de la doc (toot).

#import "@preview/toot:0.1.0": setup-toot

// Bordures des tableaux (le HTML exporté par Typst n'en met pas) et encadré.
#let css = ```css
table { border-collapse: collapse; margin: 1em 0; }
th, td { border-bottom: 1px solid color-mix(in srgb, currentColor 25%, transparent); padding: .3em .8em; text-align: left; vertical-align: top; }
.encadre { border-left: 4px solid #16a34a; background: color-mix(in srgb, #16a34a 10%, transparent); padding: .6em 1em; margin: 1em 0; border-radius: 4px; }
```.text

// Le module `html` n'existe qu'à l'export HTML (toot-builder), pas dans
// l'aperçu PDF de l'éditeur.
#let html-dispo = "html" in std

#let (toot-page, example, i-link) = setup-toot(
  name: [ctz-trigo],
  universe-url: "https://typst.app/universe/package/ctz-trigo",
  root: "ctz-trigo",
  styling: (accent-color: rgb("#228B22")),
  outline: include "OUTLINE.typ",
  head-extra: if html-dispo { html.style(css) },
  snippets: (
    // Page blanche même en thème sombre : le cercle est noir. Le paquet est
    // pris en @local (lié par config-preambule/installer.sh) tant qu'il
    // n'est pas publié ; les pages affichent l'import @preview.
    (
      trigger: "// SETUP",
      expansion: ```typ
      #import "@local/ctz-trigo:0.1.0": *
      #import "@preview/cetz:0.5.2"
      #set page(width: auto, height: auto, margin: 8pt, fill: white)
      ```.text,
    ),
  ),
)

// Encadré « astuce » ; simple bloc hors export HTML.
#let tip(body) = context if html-dispo and target() == "html" {
  html.div(class: "encadre", body)
} else { block(inset: 8pt, stroke: (left: 2pt), body) }
