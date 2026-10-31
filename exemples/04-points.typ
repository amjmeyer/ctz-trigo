#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Points, rays, arcs and angles

Angles are numbers of degrees (`80`) or Typst angles (`180deg`, `calc.pi / 4 * 1rad`).

#trig-circle(
  radius: 1,
  remarkable: false,
  show-ticks: false,
  tc-point(80, $A$),
  tc-point(0.8 * calc.pi * 1rad, $B$),
  tc-point(180deg, $C$),
  tc-point(-90, $D$, color: red),
)

#trig-circle(
  radius: 1.5,
  remarkable: false,
  tc-point(90, $A$, mark: "o"),
  tc-point(150, $B$, mark: "square*", color: blue),
  tc-point(210, $C$, mark: "triangle"),
  tc-point(270, $D$, mark: "star*", color: red),
  tc-point(330, $E$, mark: "x", mark-size: 0.25),
  tc-point(30, $F$, mark: "|"),
)

#trig-circle(
  radius: 2,
  remarkable: false,
  show-axes: false,
  show-origin: true,
  tc-angle(0, 1rad, $1 "rad"$, color: black, fill: gray.lighten(70%)),
  tc-ray(0, $A$),
  tc-ray(1rad, $B$),
  tc-arc(0, 1rad, thickness: 1pt, arrow: true),
)

#let angU = 20
#let angV = 140
#trig-circle(
  radius: 2,
  remarkable: false,
  show-origin: true,
  show-direction: true,
  tc-arc(angU, angV),
  tc-vector(
    angU,
    $arrow(u)$,
    from: (0.15, -0.85),
    color: green,
  ),
  tc-vector(
    angV,
    $arrow(v)$,
    from: (-0.7, -0.3),
    color: orange,
  ),
  tc-ray(angU, $U$, color: green),
  tc-ray(angV, $V$, color: orange),
  tc-angle(angU, angV, $(arrow(u), arrow(v))$),
)
