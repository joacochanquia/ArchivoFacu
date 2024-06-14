.data
n1: .double 9.13
n2: .double 6.58
res1: .double 0.0
res2: .double 0.0
.code
l.d f1, n1(r0)
l.d f2, n2(r0)
;nop
add.d f3, f2, f1
mul.d f1, f2, f1
mul.d f4, f2, f1
;mfc1 r1, f1 ; COPIO EL REGISTRO F1 EN R1
;cvt.l.d f5, f2 ; CONVIERTO A ENTERO F2 Y LO DEJO EN F5
;mfc1 r2,f5 ; COPIO EL REGISTRO F5 EN R2 (FLOTANTE A ENTERO)
;mtc1 r2,f6 ; COPIO EL REGISTRO R2 EN F6 (ENTERO A FLOTANTE)
;cvt.d.l f7, f6 ; CONVIERTO A FLOTANTE F6 Y LO DEJO EN F7
s.d f3, res1(r0)
s.d f4, res2(r0)
halt