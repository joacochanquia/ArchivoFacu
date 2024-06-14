.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
msj: .asciiz "Ingrese un numero: "
cero: .asciiz "CERO"
uno: .asciiz "UNO"
dos: .asciiz "DOS"
tres: .asciiz "TRES"
cuatro: .asciiz "CUATRO"
cinco: .asciiz "CINCO"
seis: .asciiz "SEIS"
siete: .asciiz "SIETE"
ocho: .asciiz "OCHO"
nueve: .asciiz "NUEVE"
error: .asciiz "EL CARACTER NO ES UN NUMERO"

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
daddi $a0, $0, cero 
jal mostrar
j finmuestra
no_cero: daddi $t0, $0, 1
bne $a0, $t0, no_uno
daddi $a0, $0, uno
jal mostrar
j finmuestra
no_uno: daddi $t0, $t0, 1
bne $a0, $t0, no_dos
daddi $a0, $0, dos
jal mostrar
j finmuestra
no_dos: daddi $t0, $t0, 1
bne $a0, $t0, no_tres
daddi $a0, $0, tres
jal mostrar
j finmuestra
no_tres: daddi $t0, $t0, 1
bne $a0, $t0, no_cuatro
daddi $a0, $0, cuatro
jal mostrar
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

mostrar: lwu $t0, DATA(r0) ; $t0 = dirección de DATA
daddi $t2, $0, 6	; $t2 = 6 -> función 6: limpiar pantalla alfanumérica
lwu $t1, CONTROL(r0) 	; $t1 = dirección de CONTROL
sd $a0, 0($t0) 		; DATA recibe el puntero al comienzo del mensaje
sd $t2, 0($t1) 		; CONTROL recibe 6 y limpia la pantalla
daddi $t2, $0, 4 	; $t2 = 4 -> función 4: salida de una cadena ASCII
sd $t2, 0($t1) 		; CONTROL recibe 4 y produce la salida del mensaje
jr $ra