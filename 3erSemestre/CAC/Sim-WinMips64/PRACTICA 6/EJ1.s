.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
texto: .asciiz "                                                                " ; El mensaje a mostrar
.text
lwu $s0, DATA(r0) ; $s0 = dirección de DATA
lwu $s1, CONTROL(r0) ; $s1 = dirección de CONTROL
daddi $s2, $0, 0 ; $s2 = indice
daddi $s3, $0, 9
daddi $s4, $0, 0x30

lazo: lb $t0, texto($s2)
beqz $t0, fin_carga	; si se cargo 0 en t0 no hay mas lugar
sd $s3, 0($s1)		; manda 9 para recibir un caracter en DATA
lbu $t1, 0($s0)		; $t1 = char en DATA
beq $t1, $s4, fin_carga	; si DATA recibio "0" corto la carga 
sb $t1, texto($s2)	; guardo el caracter en la cadena
daddi $s2, $s2, 1
j lazo

fin_carga: daddi $t0, $0, texto ; $t0 = dirección del mensaje a mostrar
sd $t0, 0($s0) ; DATA recibe el puntero al comienzo del mensaje
daddi $t0, $0, 6 ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
sd $t0, 0($s1) ; CONTROL recibe 6 y limpia la pantalla
daddi $t0, $0, 4 ; $t0 = 4 -> función 4: salida de una cadena ASCII
sd $t0, 0($s1) ; CONTROL recibe 4 y produce la salida del mensaje
halt