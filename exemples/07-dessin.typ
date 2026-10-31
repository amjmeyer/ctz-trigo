#import "../src/lib.typ": *
#import "@preview/cetz:0.5.2"
#set page(width: 16cm, height: auto, margin: 1cm)

= In your own canvas: `trig-circle-draw`

#cetz.canvas(length: 1.5cm, {
  let (x, y) = (70deg.rad(), 120deg.rad())
  trig-circle-draw(
    radius: 1,
    remarkable: false,
    show-origin: true,
    tc-arc(70deg, 120deg),
    tc-ray(70deg, $U$, color: green),
    tc-ray(120deg, $V$, color: orange),
    tc-wind(x, $x$, segment: false, arc: false),
    tc-wind(y, $y$, color: orange, segment: false, arc: false),
  )
  cetz.draw.line((1, x), (1, y), stroke: red + 2pt)
})
