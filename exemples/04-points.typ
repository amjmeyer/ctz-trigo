#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Points, rays, arcs and angles

Angles are numbers of degrees (`80`) or Typst angles (`180deg`, `calc.pi / 4 * 1rad`).

#trig-circle(
  radius: 1.5,
  remarkable: false,
  show-ticks: true,
  tc-point(80, $A$),
  tc-point(0.8 * calc.pi * 1rad, $B$),
  tc-point(180deg, $C$),
  tc-point(-90, $D$, color: red),
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

#trig-circle(
  radius: 2,
  remarkable: false,
  show-origin: true,
  show-direction: true,
  tc-arc(20, 110),
  tc-ray(20, $U$, color: green, arrow: true),
  tc-ray(110, $V$, color: orange, arrow: true),
  tc-angle(20, 110, $(arrow(u), arrow(v))$),
)
