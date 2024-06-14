.data
tabla: .double 2.3, 5.6, 3.1, 1.8, 9.6
cant: .word 5
res: .double 0, 0, 0, 0, 0

.text
daddi $t2, $zero, 2
ld $t0, cant($zero)
mtc1 $t2, f2
daddi $t1, $zero, 0
cvt.d.l f2, f2
loop: beqz $t0, fin
l.d f1, tabla($t1)
mul.d f3, f1, f2
s.d f3, res($t1)
daddi $t0, $t0, -1
daddi $t1, $t1, 8
j loop
fin: halt
