.data
cadena: .asciiz "Hola Que Tal"
cadena2: .asciiz "hola Que Tal"
result: .word 0

.text
daddi $a0, $0, cadena		; cargo el offset de tabla en el argumento a1
daddi $a1, $0, cadena2		; cargo el offset de tabla2 en el argumento a1
jal mayores_que			; llamo a la subrutina
sd $v0, result($0)		; guardo el resultado
halt

mayores_que: daddi $v0, r0, 1	; inicializo el contador de posiciones
lazo: lb $t0, 0($a0)		; cargo el valor de la cadena (t0 guardo el valor) (a0 indice)
lb $t1, 0($a1)			; cargo el valor de la cadena (t1 guardo el valor) (a1 indice)
beqz $t0, iguales		; si termino son iguales
bne $t0, $t1, terminar		; si los valores en las tablas son iguales termino
daddi $a0, $a0, 1		; aumento el indice de la cadena (a0) (byte a byte)
daddi $a1, $a1, 1		; aumento el indice de la cadena (a1)
daddi $v0, $v0, 1		; aumento el contador (v0)
j lazo
iguales: daddi $v0, r0, -1
terminar: jr $ra
