.data
tabla: .word 2, 9, 3, 5, 8, 4, 1, 2, 6, 4
tam: .word 10
M: .word 4
result: .word 0

.text
ld $a0, M($0)			; cargo M en el argumento 0
daddi $a1, $0, tabla		; cargo el offset de tabla en el argumento a1
ld $a2, tam($zero)		; cargo el tamaño de la tabla en $a2
jal mayores_que			; llamo a la subrutina
sd $v0, result($0)		; guardo el resultado
halt

mayores_que: dadd $t0, $0, $0 	; en t0 avanzo hasta coincidir con la cantidad
lazo: beq $t0, $a2, terminar  	; si t0 y a2(tamanio) son iguales termino
ld $t1, 0($a1)			; cargo el valor de la tabla (t1 guardo el valor) (a1 indice)
daddi $a1, $a1, 8		; aumento el indice de la tabla (a1)
slt $t2, $a0, $t1		; si M (a0) es menor que el valor en la tabla (en t1)
daddi $t0, $t0, 1 		; aumento t0
beqz $t2, lazo			; si slt es 1, M menor que t1 entonces no salto
daddi $v0, $v0, 1		; aumento el contador (v0)
j lazo
terminar: jr $ra
