.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
coorX: .byte 10
coorY: .byte 10
color: .byte 0, 255, 255, 0
tam: .word 10


.text
lwu $t8, CONTROL($zero)
lwu $t9, DATA($zero)
daddi $t0, $zero, 7
sd $t0, 0($t8)
daddi $t0, $zero, 5
lwu $t1, color($zero)
sw $t1, 0($t9)
ld $t3, tam($zero)
lbu $t1, coorX($zero)
lbu $t2, coorY($zero)
lazo1: beqz $t3, finlazo1
sb $t1, 5($t9)
sb $t2, 4($t9)
daddi $t1, $t1, 1
daddi $t2, $t2, 1
daddi $t3, $t3, -1
sd $t0, 0($t8)
j lazo1
finlazo1: ld $t3, tam($zero)
lbu $t1, coorX($zero)
lbu $t2, coorY($zero)
dadd $t2, $t2, $t3
daddi $t2, $t2, -1
lazo2: beqz $t3, finlazo2
sb $t1, 5($t9)
sb $t2, 4($t9)
daddi $t1, $t1, 1
daddi $t2, $t2, -1
daddi $t3, $t3, -1
sd $t0, 0($t8)
j lazo2
finlazo2: halt