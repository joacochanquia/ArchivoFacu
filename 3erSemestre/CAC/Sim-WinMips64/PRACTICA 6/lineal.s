.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.text
lwu $t8, CONTROL($zero)
lwu $t9, DATA($zero)
daddi $t0, $0, 9
sd $t0, 0($t8)
ld $t5, 0($t9)
slti $t7, $t5, 0x3A
beqz $t7, fin
slti $t7, $t5, 0x30
bnez $t7, fin
daddi $t5, $t5, -0x30
sd $t0, 0($t8)
ld $t6, 0($t9)
slti $t7, $t6, 0x3A
beqz $t7, fin
slti $t7, $t6, 0x30
bnez $t7, fin
daddi $t6, $t6, -0x30
daddi $t0, $0, 7
sd $t0, 0($t8)
daddi $t3, $0, 50
daddi $t1, $0, 0
daddi $t0, $0, 5
dadd $t2, $0, $t6
loop1: sw $zero, 0($t9)
dmul $t4, $t5, $t1
dadd $t4, $t4, $t6
daddi $t4, $t4, 1
sb $t1, 5($t9)
loop2: beq $t2, $t4, finloop2
sb $t2, 4($t9)
sd $t0, 0($t8)
daddi $t2, $t2, 1
j loop2
finloop2: daddi $t1, $t1, 1
daddi $t3, $t3, -1
bnez $t3, loop1
fin: halt