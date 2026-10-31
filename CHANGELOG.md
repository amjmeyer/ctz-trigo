# Changelog

## 0.1.0 (unreleased)

- First version: `trig-circle` and `trig-circle-draw`, with the keys of
  ProfLycee's `\CercleTrigo` and the additions of proflycee-minimal's
  `cercle-trigo` (frame, real line, ticks, vectors…).
- Elements `tc-point`, `tc-ray`, `tc-arc`, `tc-angle`, `tc-wind`,
  `tc-interval`, `tc-cos-eq`, `tc-sin-eq`, `tc-cos-sin` instead of lists of
  dictionaries; the real line shows up by itself with `tc-wind` or
  `tc-interval`.
- Beyond a radius of 1, the elements (names, points, arrow heads) and the
  frame (O, ticks, i, j, I, real line, positive direction) grow with the
  radius, half as fast (twice as big at radius 3).
- `tc-point`: keys `mark` (the marks of pgfplots, as in simple-plot) and
  `mark-size`.
- `tc-vector`: a vector of given direction drawn anywhere, not only from O.
