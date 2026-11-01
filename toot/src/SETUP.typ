// Réglages communs à toutes les pages de la doc (toot), et petits outils de
// mise en page propres à cette doc (mêmes que ceux de profmaquette-minimal).

#import "@preview/toot:0.1.0": setup-toot

// Mise en forme des encadrés et des fiches de paramètres (le HTML exporté par
// Typst ignore les couleurs et les cadres des `block`). Les figures sont
// centrées, à 1,5 fois leur taille réelle : toot les étire sur toute la largeur.
#let css = ```css
.encadre { border-left: 4px solid var(--c); background: color-mix(in srgb, var(--c) 10%, transparent); padding: .6em 1em; margin: 1em 0; border-radius: 4px; }
.encadre > .titre { font-weight: bold; color: var(--c); display: block; margin-bottom: .3em; }
.encadre.info { --c: #2563eb; }
.encadre.astuce { --c: #16a34a; }
.encadre.attention { --c: #ea580c; }
.encadre.idee { --c: #9333ea; }
.parametre { background: color-mix(in srgb, currentColor 6%, transparent); border-radius: 4px; padding: .8em 1em; margin: 1.2em 0 .6em; }
.parametre > .nom { font-weight: bold; font-size: 1.15em; margin-right: .5em; }
.parametre .type { font-family: monospace; font-size: .8em; padding: .1em .4em; border-radius: 3px; margin-right: .3em; background: color-mix(in srgb, currentColor 12%, transparent); }
.parametre .defaut { display: block; font-size: .85em; opacity: .7; margin-top: .4em; }
picture img { width: auto; max-width: 100%; zoom: 1.5; display: block; margin: 0 auto; }
table { border-collapse: collapse; margin: 1em 0; }
th, td { border-bottom: 1px solid color-mix(in srgb, currentColor 25%, transparent); padding: .3em .8em; text-align: left; vertical-align: top; }
```.text

// Le module `html` n'existe qu'à l'export HTML (toot-builder) : pas dans
// l'aperçu PDF de l'éditeur, qui doit donc s'en passer.
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

// Hors export HTML (aperçu PDF d'une page), les outils se replient sur un
// simple bloc. `version-html` est une fonction, appelée seulement en HTML.
#let en-html(version-html, repli) = context if html-dispo and target() == "html" { version-html() } else { repli }

// Encadrés : #info(title: "…")[…].
#let encadre(genre, title, body) = en-html(
  () => html.div(class: "encadre " + genre, {
    // Un bloc, pas un `span` : sinon, dès que le contenu a plusieurs
    // paragraphes, Typst range le titre dans un <p> et le CSS
    // `.encadre > .titre` ne le trouve plus.
    html.div(class: "titre", title)
    body
  }),
  block(inset: 8pt, stroke: (left: 2pt), [*#title* \ #body]),
)
#let info(title: "Info", body) = encadre("info", title, body)
#let tip(title: "Astuce", body) = encadre("astuce", title, body)
#let warning(title: "Attention", body) = encadre("attention", title, body)
#let idea(title: "Idée", body) = encadre("idee", title, body)

// Fiche d'un paramètre : nom, types, description, valeur par défaut.
//   #parametre("radius", ("int", "float"), `3`)[…]
#let parametre(nom, types, defaut, description) = en-html(
  () => html.div(class: "parametre", {
    html.span(class: "nom", raw(nom))
    for t in types { html.span(class: "type", t) }
    html.div(description)
    html.span(class: "defaut")[Défaut : #defaut]
  }),
  block[*#raw(nom)* (#types.join(", ")) — défaut : #defaut \ #description],
)

// Signature d'une fonction (notation `type | type`, pas du Typst valide).
#let signature(texte) = raw(block: true, texte)
