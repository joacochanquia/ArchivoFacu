.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
.text
lwu $t8, CONTROL($zero)
lwu $t9, DATA($zero)
daddi $t0, $0, 7
sd $t0, 0($t8)
daddi $t3, $0, 10
daddi $t1, $0, 0
daddi $t0, $0, 5
daddi $t2, $0, -1
loop1: sw $zero, 0($t9)
dmul $t4, $t1, $t1
sb $t1, 5($t9)
loop2: daddi $t2, $t2, 1
sb $t2, 4($t9)
sd $t0, 0($t8)
bne $t2, $t4, loop2
daddi $t1, $t1, 1
daddi $t3, $t3, -1
bnez $t3, loop1
halt