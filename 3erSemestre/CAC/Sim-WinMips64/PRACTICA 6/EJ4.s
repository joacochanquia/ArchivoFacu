.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
msj: .asciiz "Ingrese la clave: "
clave: .asciiz "hola"
texto: .asciiz "    "
correcto: .asciiz "Bienvenido"
error: .asciiz "ERROR"

.text
daddi $sp, $0, 0x400
daddi $a0, $0, msj
jal mostrar
daddi $s2, $0, 0 ; $s2 = indice
daddi $s3, $0, 4
lazo: lb $t0, texto($s2)
beqz $t0, fin_carga	; si se cargo 0 en t0 no hay mas lugar
jal char
sb $v0, texto($s2)	; guardo el caracter en la cadena
daddi $s2, $s2, 1
j lazo
fin_carga: daddi $s2, $0, 0 ; $s2 = indice
lazo2: lb $t0, texto($s2)
beqz $t0, iguales	; si se cargo 0 en t0 no hay mas lugar
lb $t1, clave($s2)
bne $t0, $t1, noiguales
daddi $s2, $s2, 1
j lazo2
iguales: daddi $a0, $zero, correcto
jal mostrar
j fin
noiguales: daddi $a0, $zero, error
jal mostrar
fin: halt

char: lwu $t0, DATA(r0) 	; $t0 = dirección de DATA
daddi $t2, $0, 9	; cargo 9 el comando para leer char
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
sd $t2, 0($t1)		; manda 9 para recibir un caracter en DATA
lbu $v0, 0($t0)		; $v0 = char en DATA
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