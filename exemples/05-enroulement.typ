#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Wrapping the real line around the circle

`tc-wind(x)` takes a real number `x` (a length, not an angle). The real line
appears as soon as there is a `tc-wind` or a `tc-interval`.

#trig-circle(
  radius: 1,
  remarkable: false,
  show-vectors: true,
  tc-wind(2, $M(2)$),
  tc-wind(-1, $P(-1)$, color: orange),
)

#trig-circle(
  radius: 0.8,
  remarkable: false,
  show-direction: true,
  real-line-label: [axe réel],
  tc-wind(9 * calc.pi / 8, $M((9pi)/8)$),
  tc-wind(-7 * calc.pi / 8, $P(-(7pi)/8)$, color: blue),
)
