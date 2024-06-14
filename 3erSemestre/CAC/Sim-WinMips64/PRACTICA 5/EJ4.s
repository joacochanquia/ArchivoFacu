.data
PESO: .double 56.3
ALTURA: .double 1.68
IMC: .double 0.0
ESTADO: .word 0
INFRAPESO: .double 18.5
NORMAL: .double 25
SOBREPESO: .double 30
.code
l.d f2, ALTURA(r0)
l.d f1, PESO(r0)
mul.d f3, f2, f2
l.d f4, INFRAPESO(r0)
l.d f5, NORMAL(r0)
l.d f6, SOBREPESO(r0)
div.d f3, f1, f3
daddi r1, r0, 1
s.d f3, IMC(r0)
c.lt.d f3, f4
bc1t FIN
daddi r1, r1, 1
c.lt.d f3, f5
bc1t FIN
daddi r1, r1, 1
c.lt.d f3, f6
bc1t FIN
daddi r1, r1, 1
FIN: sd r1, ESTADO(r0)
halt