# Documentation en ligne (toot)

Documentation de _ctz-trigo_, construite avec
[toot](https://typst.app/universe/package/toot), sur le modèle de celle de
profmaquette-minimal (mêmes outils, même façon d'écrire).

- `src/SETUP.typ` : réglages communs, encadrés (`info`, `tip`, `warning`,
  `idea`), fiches de paramètres (`parametre`), signatures (`signature`) ; le
  déclencheur `// SETUP` des exemples importe `@local/ctz-trigo:0.1.0` (lié
  par `config-preambule/installer.sh`) et `cetz`.
- `src/OUTLINE.typ` : le menu ; seules les pages qui y figurent sont construites.
- Une page `.typ` par partie.

Depuis ce dossier `toot/` (prérequis : `typst` et `toot-builder`, voir la doc
de profmaquette-minimal) :
```sh
toot-builder serve   # aperçu en direct
toot-builder build   # site dans build/
```

Publication : le contenu de `build/` sur la branche `gh-pages` (garder
`.nojekyll`), voir le skill `publier-paquet`.
