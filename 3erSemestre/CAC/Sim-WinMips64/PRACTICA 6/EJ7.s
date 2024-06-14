.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
msj: .asciiz "Ingrese un numero: "
cinco: .asciiz "CINCO"
seis: .asciiz "SEIS"
siete: .asciiz "SIETE"
ocho: .asciiz "OCHO"
nueve: .asciiz "NUEVE"
error: .asciiz "EL CARACTER NO ES UN NUMERO"
negro: .byte 0, 0, 0, 0 ;

.text
daddi $sp, $0, 0x400
jal ingreso
beqz $v1, no_num
daddi $a0, $v0, 0
jal muestra
j fin
no_num: daddi $a0, $0, error ; $a0 = dirección del mensaje de error
jal mostrar
fin: halt

ingreso: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
daddi $a0, $0, msj
jal mostrar
lwu $t0, DATA(r0) 	; $t0 = dirección de DATA
daddi $t2, $0, 9	; cargo 9 el comando para leer char
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
sd $t2, 0($t1)		; manda 9 para recibir un caracter en DATA
lbu $v0, 0($t0)		; $v0 = char en DATA
slti $v1, $v0, 0x3A
beqz $v1, finingreso	; salto si el resultado es mayor o igual
slti $t2, $v0, 0x30
beqz $t2, finingreso
daddi $v1, $zero, 0
finingreso: ld $ra, 0($sp)	; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
daddi $v0, $v0, -0x30
jr $ra

muestra: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
bnez $a0, no_cero
jal cero
j finmuestra
no_cero: daddi $t0, $0, 1
bne $a0, $t0, no_uno
jal uno
j finmuestra
no_uno: daddi $t0, $t0, 1
bne $a0, $t0, no_dos
jal dos
j finmuestra
no_dos: daddi $t0, $t0, 1
bne $a0, $t0, no_tres
jal tres
j finmuestra
no_tres: daddi $t0, $t0, 1
bne $a0, $t0, no_cuatro
jal cuatro
j finmuestra
no_cuatro: daddi $t0, $t0, 1
bne $a0, $t0, no_cinco
daddi $a0, $0, cinco
jal mostrar
j finmuestra
no_cinco: daddi $t0, $t0, 1
bne $a0, $t0, no_seis
daddi $a0, $0, seis
jal mostrar
j finmuestra
no_seis: daddi $t0, $t0, 1
bne $a0, $t0, no_siete
daddi $a0, $0, siete
jal mostrar
j finmuestra
no_siete: daddi $t0, $t0, 1
bne $a0, $t0, no_ocho
daddi $a0, $0, ocho
jal mostrar
j finmuestra
no_ocho: daddi $t0, $t0, 1
bne $a0, $t0, no_nueve
daddi $a0, $0, nueve
jal mostrar
j finmuestra
no_nueve: daddi $a0, $0, error
jal mostrar
finmuestra: ld $ra, 0($sp)	; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
jr $ra

cero: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
lwu $t6, CONTROL(r0) ; $s6 = dirección de CONTROL
lwu $t7, DATA(r0) ; $s7 = dirección de DATA
daddi $t0, $0, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($t6) ; CONTROL recibe 7 y limpia la pantalla gráfica
daddi $a0, $0, 1
daddi $a1, $0, 2
daddi $a2, $0, 6
jal arriba
daddi $a0, $0, 5
daddi $a1, $0, 2
daddi $a2, $0, 6
jal arriba
daddi $a0, $0, 2
daddi $a1, $0, 1
daddi $a2, $0, 3
jal derecha
daddi $a0, $0, 2
daddi $a1, $0, 8
daddi $a2, $0, 3
jal derecha
ld $ra, 0($sp)			; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
jr $ra

uno: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
lwu $t6, CONTROL(r0) ; $s6 = dirección de CONTROL
lwu $t7, DATA(r0) ; $s7 = dirección de DATA
daddi $t0, $0, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($t6) ; CONTROL recibe 7 y limpia la pantalla gráfica
daddi $a0, $0, 2
daddi $a1, $0, 1
daddi $a2, $0, 3
jal derecha
daddi $a0, $0, 3
daddi $a1, $0, 2
daddi $a2, $0, 7
jal arriba
daddi $a0, $0, 2
daddi $a1, $0, 7
daddi $a2, $0, 1
jal arriba
ld $ra, 0($sp)			; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
jr $ra

dos: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
lwu $t6, CONTROL(r0) ; $s6 = dirección de CONTROL
lwu $t7, DATA(r0) ; $s7 = dirección de DATA
daddi $t0, $0, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($t6) ; CONTROL recibe 7 y limpia la pantalla gráfica
daddi $a0, $0, 1
daddi $a1, $0, 1
daddi $a2, $0, 5
jal derecha
daddi $a0, $0, 2
daddi $a1, $0, 2
daddi $a2, $0, 1
jal derecha
daddi $a0, $0, 3
daddi $a1, $0, 3
daddi $a2, $0, 1
jal derecha
daddi $a0, $0, 4
daddi $a1, $0, 4
daddi $a2, $0, 1
jal derecha
daddi $a0, $0, 5
daddi $a1, $0, 5
daddi $a2, $0, 3
jal arriba
daddi $a0, $0, 2
daddi $a1, $0, 8
daddi $a2, $0, 3
jal derecha
daddi $a0, $0, 1
daddi $a1, $0, 6
daddi $a2, $0, 2
jal arriba
ld $ra, 0($sp)			; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
jr $ra

tres: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
lwu $t6, CONTROL(r0) ; $s6 = dirección de CONTROL
lwu $t7, DATA(r0) ; $s7 = dirección de DATA
daddi $t0, $0, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($t6) ; CONTROL recibe 7 y limpia la pantalla gráfica
daddi $a0, $0, 2
daddi $a1, $0, 1
daddi $a2, $0, 3
jal derecha
daddi $a0, $0, 1
daddi $a1, $0, 2
daddi $a2, $0, 2
jal arriba
daddi $a0, $0, 5
daddi $a1, $0, 2
daddi $a2, $0, 3
jal arriba
daddi $a0, $0, 3
daddi $a1, $0, 5
daddi $a2, $0, 2
jal derecha
daddi $a0, $0, 5
daddi $a1, $0, 6
daddi $a2, $0, 2
jal arriba
daddi $a0, $0, 2
daddi $a1, $0, 8
daddi $a2, $0, 3
jal derecha
daddi $a0, $0, 1
daddi $a1, $0, 6
daddi $a2, $0, 2
jal arriba
ld $ra, 0($sp)			; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
jr $ra

cuatro: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
lwu $t6, CONTROL(r0) ; $s6 = dirección de CONTROL
lwu $t7, DATA(r0) ; $s7 = dirección de DATA
daddi $t0, $0, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($t6) ; CONTROL recibe 7 y limpia la pantalla gráfica
daddi $a0, $0, 1
daddi $a1, $0, 4
daddi $a2, $0, 4
jal arriba
daddi $a0, $0, 2
daddi $a1, $0, 4
daddi $a2, $0, 3
jal derecha
daddi $a0, $0, 5
daddi $a1, $0, 1
daddi $a2, $0, 7
jal arriba
ld $ra, 0($sp)			; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
jr $ra

arriba: lwu $t6, CONTROL(r0) ; $s6 = dirección de CONTROL
lwu $t7, DATA(r0) ; $s7 = dirección de DATA
lwu $t2, negro(r0) ; $t2 = valor de color a pintar
sw $t2, 0($t7) ; DATA recibe el valor del color a pintar
sb $a0, 5($t7) ; DATA+5 recibe el valor de coordenada X
daddi $t0, $0, 5 ; $t0 = 5 -> función 5: salida gráfica
lazoarriba: sb $a1, 4($t7) ; DATA+4 recibe el valor de coordenada Y
sd $t0, 0($t6) ; CONTROL recibe 5 y produce el dibujo del punto
daddi $a2, $a2, -1
daddi $a1, $a1, 1
bnez $a2, lazoarriba
jr $ra

derecha: lwu $t6, CONTROL(r0) ; $s6 = dirección de CONTROL
lwu $t7, DATA(r0) ; $s7 = dirección de DATA
sb $a1, 4($t7) ; DATA+4 recibe el valor de coordenada Y
lwu $t2, negro(r0) ; $t2 = valor de color a pintar
sw $t2, 0($t7) ; DATA recibe el valor del color a pintar
daddi $t0, $0, 5 ; $t0 = 5 -> función 5: salida gráfica
lazoderecha: sb $a0, 5($t7) ; DATA+5 recibe el valor de coordenada X
sd $t0, 0($t6) ; CONTROL recibe 5 y produce el dibujo del punto
daddi $a2, $a2, -1
daddi $a0, $a0, 1
bnez $a2, lazoderecha
jr $ra

mostrar: lwu $t0, DATA(r0) ; $t0 = dirección de DATA
daddi $t2, $0, 6	; $t2 = 6 -> función 6: limpiar pantalla alfanumérica
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
sd $a0, 0($t0) 		; DATA recibe el puntero al comienzo del mensaje
sd $t2, 0($t1) 		; CONTROL recibe 6 y limpia la pantalla
daddi $t2, $0, 4 	; $t2 = 4 -> función 4: salida de una cadena ASCII
sd $t2, 0($t1) 		; CONTROL recibe 4 y produce la salida del mensaje
jr $ra