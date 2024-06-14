.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
msj: .asciiz "Ingrese un numero: "
error: .asciiz "EL CARACTER NO ES UN NUMERO"

.text
daddi $sp, $0, 0x400
jal ingreso
beqz $v1, no_num
daddi $s0, $v0, 0
jal ingreso
beqz $v1, no_num
daddi $s1, $v0, 0
j sigo
no_num: daddi $a0, $0, error ; $a0 = dirección del mensaje de error
jal mostrar
j fin
sigo: dadd $s2, $s0, $s1
lwu $t0, DATA(r0) 	; $t0 = dirección de DATA
daddi $t2, $0, 6	; $t2 = 6 -> función 6: limpiar pantalla alfanumérica
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
sd $s2, 0($t0) 		; DATA recibe el numero
sd $t2, 0($t1) 		; CONTROL recibe 6 y limpia la pantalla
daddi $t2, $0, 2 	; $t2 = 2 -> función 2: imprimir numero
sd $t2, 0($t1) 		; CONTROL recibe 2 y produce la salida del numero
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

mostrar: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
lwu $t0, DATA(r0) ; $t0 = dirección de DATA
daddi $t2, $0, 6	; $t2 = 6 -> función 6: limpiar pantalla alfanumérica
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
sd $a0, 0($t0) 		; DATA recibe el puntero al comienzo del mensaje
sd $t2, 0($t1) 		; CONTROL recibe 6 y limpia la pantalla
daddi $t2, $0, 4 	; $t2 = 4 -> función 4: salida de una cadena ASCII
sd $t2, 0($t1) 		; CONTROL recibe 4 y produce la salida del mensaje
finingreso: ld $ra, 0($sp)	; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
jr $ra