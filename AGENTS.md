# ctz-trigo — guide for coding agents

Typst package that draws the trigonometric unit circle, after `\CercleTrigo`
of Cédric Pierquet's LaTeX package ProfLycee, with the additions of the
author's `proflycee-minimal` package (where it comes from). Built on CeTZ.
Public names, keys and error messages are in English; the README and the
documentation (`toot/`) in French (the README opens with an English summary
for Universe); comments and internal names (prefixed with `_`, or local
variables) in French.

## Layout

```
src/
  lib.typ          entry point: exports only trig-circle, trig-circle-draw
                   and the tc-* elements
  deps.typ         the only external import (@preview/cetz:0.5.2)
  outils.typ       _deg, _reel, _nom, _ancre-ext, _arc (not exported)
  elements.typ     tc-point, tc-ray, tc-vector, tc-arc, tc-angle, tc-wind,
                   tc-interval, tc-cos-eq, tc-sin-eq, tc-cos-sin
  trig-circle.typ  the drawing
exemples/          01-… to 07-…: one file per use case (visual tests)
images/apercu.svg  the README image, from its code block
toot/              online documentation (toot), published on gh-pages
tests/lancer.sh    runs all the tests
```

## How it works

Two steps, as in ctz-interval.

1. **The `tc-*` functions draw nothing.** They check their arguments
   (`panic` with a clear message) and return a record
   `(_ctz-trigo: "<kind>", …)`, angles already converted to degrees
   (floats). The optional name is caught by a `..nom` sink: `_nom` rejects
   any named key that falls into it (an unknown key of the element).
2. **`trig-circle-draw(..elements, keys)` draws**: the circle and what the
   keys ask for, then the elements kind by kind in a fixed order (points
   last, on top). Its `..elements` sink also receives unknown named keys:
   they are rejected first. `trig-circle` wraps it in
   `cetz.canvas(length: 1cm, …)`.

Size of what is added: `k = max(1, (1 + radius) / 2)` multiplies the names, points
(`marque`), arrow heads (`pointe`) and paddings of the elements and of the
frame (`rep`), never the thicknesses nor ProfLycee's remarkable values and
angles (`val`, `ang`). Use these helpers for any new element.

## Conventions

- Public names in English kebab-case; elements prefixed with `tc-`.
- 3-line MIT header in every `.typ` of `src/`. Short comments.
- Independent rewrite: never copy ProfLycee's code (LPPL).
- A new key or element: an example in `exemples/`, the documentation
  (`toot/src/`, and its ProfLycee table if it comes from there), a unit test
  and an error test.

## Tests

`tests/lancer.sh [prefixes]` compiles, producing no file: `exemples/*.typ`
(no error), the ```` ```typ ```` blocks of the README (with `cetz`
imported), `tests/unitaires/*.typ` (assertions, tools in `aide.typ`),
`tests/erreurs/*.typ` (must fail with the message of the first line,
`// attendu : …`). Exit code = number of failures.

After changing the rendering, rebuild `images/apercu.svg` from the README
code block, and look at the documentation (`toot-builder serve` in `toot/`).

## Known pitfalls

- Inside the `tc-*` functions, never name a parameter `angle`: it would
  shadow the `angle` type (`type(a) == angle`). Type tests live in
  `outils.typ`.
- `trig-circle-draw` does `import cetz.draw: *`, which shadows any key with
  the same name as a CeTZ function (`fill`, `stroke`, `grid`, `mark`…):
  never use those as keys of `trig-circle`.
- `releve-textes` does not see math (`$I$`, values): test with plain text.
