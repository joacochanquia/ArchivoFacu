.data
coorX: .byte 24 ; coordenada X de un punto
coorY: .byte 24 ; coordenada Y de un punto
color: .byte 255, 0, 255, 0 ; color: máximo rojo + máximo azul => magenta
CONTROL: .word32 0x10000
DATA: .word32 0x10008
msj: .asciiz "Ingrese un numero: "
msjX: .asciiz "Coordenada en X: "
msjY: .asciiz "Coordenada en Y: "
msjR: .asciiz "Color rojo: "
msjG: .asciiz "Color verde: "
msjB: .asciiz "Color azul: "


.text
daddi $sp, $zero, 0x400
jal cargarcoor
jal cargarcolor
lwu $s6, CONTROL(r0) ; $s6 = dirección de CONTROL
lwu $s7, DATA(r0) ; $s7 = dirección de DATA
daddi $t0, $0, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($s6) ; CONTROL recibe 7 y limpia la pantalla gráfica
lbu $s0, coorX(r0) ; $s0 = valor de coordenada X
sb $s0, 5($s7) ; DATA+5 recibe el valor de coordenada X
lbu $s1, coorY(r0) ; $s1 = valor de coordenada Y
sb $s1, 4($s7) ; DATA+4 recibe el valor de coordenada Y
lwu $s2, color(r0) ; $s2 = valor de color a pintar
sw $s2, 0($s7) ; DATA recibe el valor del color a pintar
daddi $t0, $0, 5 ; $t0 = 5 -> función 5: salida gráfica
sd $t0, 0($s6) ; CONTROL recibe 5 y produce el dibujo del punto
halt

cargarcoor: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
daddi $a0, $zero, msjX
jal mostrar
jal ingreso
sb $v0, coorX(r0)
daddi $a0, $zero, msjY
jal mostrar
jal ingreso
sb $v0, coorY(r0)
ld $ra, 0($sp)			; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
jr $ra

cargarcolor: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
daddi $a0, $zero, msjR
jal mostrar
jal ingreso
sb $v0, color(r0)
daddi $a0, $zero, msjG
jal mostrar
jal ingreso
daddi $t0, $zero, 1
sb $v0, color($t0)
daddi $a0, $zero, msjB
jal mostrar
jal ingreso
daddi $t0, $zero, 2
sb $v0, color($t0)
ld $ra, 0($sp)			; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
jr $ra

ingreso: lwu $t0, DATA(r0) 	; $t0 = dirección de DATA
daddi $t2, $0, 8	; cargo 8 el comando para leer numero
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
sd $t2, 0($t1)		; manda 8 para recibir un numero en DATA
lbu $v0, 0($t0)		; $v0 = char en DATA
jr $ra

mostrar: lwu $t0, DATA(r0) ; $t0 = dirección de DATA
daddi $t2, $0, 6	; $t2 = 6 -> función 6: limpiar pantalla alfanumérica
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
sd $a0, 0($t0) 		; DATA recibe el puntero al comienzo del mensaje
sd $t2, 0($t1) 		; CONTROL recibe 6 y limpia la pantalla
daddi $t2, $0, 4 	; $t2 = 4 -> función 4: salida de una cadena ASCII
sd $t2, 0($t1) 		; CONTROL recibe 4 y produce la salida del mensaje
jr $ra