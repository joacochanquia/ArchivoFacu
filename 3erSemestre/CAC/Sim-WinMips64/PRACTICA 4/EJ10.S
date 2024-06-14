.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena
.code
daddi r1, r0, 0 ; dezplazamiento
ld r2, car(r0) ; char buscado
daddi r4, r0, 0
LOOP: lbu r3, cadena(r1)
daddi r1, r1, 1  ; dezplazo
bne r3, r2, NO_ES
daddi r4, r4, 1
NO_ES: bnez r3, LOOP
sd r4, cant(r0)
halt