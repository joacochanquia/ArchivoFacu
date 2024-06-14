.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
num: .double 45.35
msj: .asciiz "Ingrese un numero flotante menor a "
correcto: .asciiz "El numero ingresado es correcto"
error: .asciiz "El numero ingresado NO es correcto"

.text
daddi $sp, $zero, 0x400
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)
daddi $t0, $zero, 6
sd $t0, 0($s0)
daddi $a0, $zero, msj
jal mostrar
daddi $t0, $zero, 3
l.d f0, num($zero)
s.d f0, 0($s1)
sd $t0, 0($s0)
daddi $t0, $zero, 8
sd $t0, 0($s0)
l.d f1, 0($s1)
c.lt.d f1, f0
bc1f falso
daddi $a0, $zero, correcto
jal mostrar
j fin
falso: daddi $a0, $zero, error
jal mostrar
fin: halt

mostrar: daddi $sp, $sp, -8
sd $ra, 0($sp)
lwu $t8, CONTROL($zero)
lwu $t9, DATA($zero)
daddi $t0, $zero, 4
sd $a0, 0($t9)
sd $t0, 0($t8)
ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

