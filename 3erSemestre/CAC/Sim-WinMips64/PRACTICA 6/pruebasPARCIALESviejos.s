.data
TABLA: .word 4, 11, 18, 6, 17, 28, 9, 0, 11, 23, 15, 6, 37, 29, 14
MENOR: .word 20
MAYOR: .word 10
CANTIDAD: .word 15
TOTAL: .word 0
NUEVO: .word 0
.text
ld $t0, MENOR($zero)
ld $t1, CANTIDAD($zero)
daddi $t2, $zero, 0
daddi $t3, $zero, 0
loop: beqz $t1, fin
ld $t4, TABLA($t2)
slt $t5, $t4, $t0
beqz $t5, noes
sd $t4, NUEVO($t3)
daddi $t3, $t3, 8 
noes: daddi $t2, $t2, 8
daddi $t1, $t1, -1
j loop
fin: daddi $t8, $zero, 8
ddiv $t3, $t3, $t8
sd $t3, TOTAL($zero)
halt