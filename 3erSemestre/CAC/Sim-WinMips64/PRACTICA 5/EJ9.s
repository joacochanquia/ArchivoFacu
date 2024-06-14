.data
valor: .word 10
result: .word 0
.text
daddi $sp, $0, 0x400 ; Inicializa el puntero al tope de la pila (1)
ld $a0, valor($0)
jal factorial
sd $v0, result($0)
halt

factorial: beqz $a0, uno 	; si es 0 el factorial es 1
daddi $t0, $0, 1
beq $a0, $t0, uno		; si es 1 el factorial es 1
daddi $sp, $sp, -16		; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
sd $s0, 8($sp)			; PILA guardo el $s0
daddi $s0, $a0, 0		; guardo el valor en un registro s
daddi $a0, $a0, -1		; disminuyo el argumento
jal factorial			; llamo a la funcon recursivamente
dmul $v0, $v0, $s0		; realizo la operacion con el resultado de la subrutina y con el s
ld $ra, 0($sp)			; PILA recupero el return adress
ld $s0, 8($sp)			; PILA recupero el $s0
daddi $sp, $sp, 16		; PILA vuelvo al sp original
j fin
uno: daddi $v0, $0, 1
fin: jr $ra