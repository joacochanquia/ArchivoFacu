.data
coorY: .byte 24
color: .byte 0, 255, 255, 0
CONTROL: .word32 0x10000
DATA: .word32 0x10008
.text
lwu $s6, CONTROL($zero) ; $s6 CONTROL
lwu $s7, DATA($zero)	; $s7 DATA
daddi $t0, $zero, 7	; 7 comando para limpiar pantalla
sd $t0, 0($s6)		; limpio la pantalla
daddi $t1, $0, 1	; $t1 va a ser la coorX
daddi $t2, $0, 11	; $t2 va a ser el limite de $t1
loop: daddi $t0, $0, 5	;_______<A>____________ comando para imprimir pixel
lbu $s1, coorY($zero)	; $s1 coorY
sb $s1, 4($s7)		;____________<B>___________ mando la coor en y
lwu $s2, color($zero)	; $s2 color
sb $t1, 5($s7)		;__________<C>_____________ mando la coor en x
sw $s2, 0($s7)		;__________<D>_____________ mando el color
sd $t0, 0($s6)		; mando el comando para imprimir pixel
daddi $t1, $t1, 1	;__________<E>_____________ aumento la coor x
bne $t1, $t2, loop	;__________<F>_____________ si x llego a 11 corto
halt