.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
msj: .asciiz "Ingrese un numero: "

.text
daddi $sp, $0, 0x400
jal ingresofloat
daddi $s0, $v0, 0
jal ingreso
daddi $a0, $s0, 0
daddi $a1, $v0, 0
jal a_la_potencia
mtc1 $v0, f3
lwu $t0, DATA(r0) 	; $t0 = dirección de DATA
daddi $t2, $0, 6	; $t2 = 6 -> función 6: limpiar pantalla alfanumérica
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
s.d f3, 0($t0) 		; DATA recibe el numero
sd $t2, 0($t1) 		; CONTROL recibe 6 y limpia la pantalla
daddi $t2, $0, 3 	; $t2 = 3 -> función 3: imprimir numero float
sd $t2, 0($t1) 		; CONTROL recibe 3 y produce la salida del numero
fin: halt

a_la_potencia: beqz $a1, escero
mtc1 $a0, f1
mtc1 $a0, f2
lazo: daddi $a1, $a1, -1
beqz $a1, finpotencia
mul.d f1, f2, f1
j lazo
j finpotencia
escero: daddi $t0, $0, 1
mtc1 $t0, f1
cvt.d.l f1, f1
finpotencia: mfc1 $v0, f1
jr $ra

ingresofloat: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
daddi $a0, $0, msj
jal mostrar
lwu $t0, DATA(r0) 	; $t0 = dirección de DATA
daddi $t2, $0, 8	; cargo 8 el comando para leer numero
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
sd $t2, 0($t1)		; manda 8 para recibir un numero en DATA
l.d f1, 0($t0)		; $v0 = char en DATA
mfc1 $v0, f1
finingreso: ld $ra, 0($sp)	; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
jr $ra

ingreso: daddi $sp, $sp, -8	; PILA guardo lugar para dos registros
sd $ra, 0($sp)			; PILA guardo el return adress
daddi $a0, $0, msj
jal mostrar
lwu $t0, DATA(r0) 	; $t0 = dirección de DATA
daddi $t2, $0, 8	; cargo 8 el comando para leer numero
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
sd $t2, 0($t1)		; manda 8 para recibir un numero en DATA
lbu $v0, 0($t0)		; $v0 = char en DATA
finingreso: ld $ra, 0($sp)	; PILA recupero el return adress
daddi $sp, $sp, 8		; PILA vuelvo al sp original
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