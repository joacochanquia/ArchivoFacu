.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
color: .byte 0, 0, 255, 0
.text
daddi $sp, $zero, 0x400
lwu $t8, CONTROL($zero)
lwu $t9, DATA($zero)
daddi $t0, $zero, 7
sd $t0, 0($t8)
daddi $a0, $zero, 1
daddi $a1, $zero, 1
daddi $a2, $zero, 8
jal arriba
daddi $a0, $zero, 2
daddi $a1, $zero, 1
daddi $a2, $zero, 8
jal arriba
daddi $a0, $zero, 3
daddi $a1, $zero, 1
daddi $a2, $zero, 3
jal derecha
daddi $a0, $zero, 3
daddi $a1, $zero, 2
daddi $a2, $zero, 3
jal derecha
halt

arriba: daddi $sp, $sp, -8
sd $ra, 0($sp)
lwu $t8, CONTROL($zero)
lwu $t9, DATA($zero)
daddi $t0, $zero, 5
lwu $t1, color($zero)
sw $t1, 0($t9)
sb $a0, 5($t9)
looparriba: beqz $a2, finarriba
sb $a1, 4($t9)
daddi $a1, $a1, 1
daddi $a2, $a2, -1
sd $t0, 0($t8)
j looparriba
finarriba: ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

derecha: daddi $sp, $sp, -8
sd $ra, 0($sp)
lwu $t8, CONTROL($zero)
lwu $t9, DATA($zero)
daddi $t0, $zero, 5
lwu $t1, color($zero)
sw $t1, 0($t9)
sb $a1, 4($t9)
loopderecha: beqz $a2, finderecha
sb $a0, 5($t9)
daddi $a0, $a0, 1
daddi $a2, $a2, -1
sd $t0, 0($t8)
j loopderecha
finderecha: ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

 