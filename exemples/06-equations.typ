#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Cosine, sine, equations

#trig-circle(
  radius: 2.5,
  remarkable: false,
  tc-cos-sin(130deg),
)

#trig-circle(
  radius: 2,
  tc-cos-eq(60),
)

#trig-circle(
  radius: 2,
  minus-pi: false,
  tc-sin-eq(-30, color: red),
)
