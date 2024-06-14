.data
tabla: .double 2.3, 5.6, 3.1, 1.8, 9.6
cant: .word 5
res: .double 0, 0, 0, 0, 0

CONTROL: .word32 0x10000
DATA: .word32 0x10008

.text
daddi $t2, $zero, 2
ld $t0, cant($zero)
mtc1 $t2, f2
daddi $t1, $zero, 0
cvt.d.l f2, f2
loop: beqz $t0, fin
l.d f1, tabla($t1)
mul.d f3, f1, f2
mov.d f4, f1
jal imprimir
s.d f3, res($t1)
mov.d f4, f3
jal imprimir
daddi $t0, $t0, -1
daddi $t1, $t1, 8
j loop
fin: halt

imprimir: lwu $t8, CONTROL($zero)
lwu $t9, DATA($zero)
daddi $t7, $0, 3
s.d f4, 0($t9)
sd $t7, 0($t8)
jr $ra
