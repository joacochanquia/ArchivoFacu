.data
BASE: .double 5.85
ALTURA: .double 13.47
AREA: .double 0.0
.code
l.d f1, BASE(r0)
l.d f2, ALTURA(r0)
daddi r1, r0, 2
mul.d f3, f1, f2
mtc1 r1, f4
cvt.d.l f4, f4
mov.d f5, f3
div.d f3, f3, f4
s.d f3, AREA(r0)
halt