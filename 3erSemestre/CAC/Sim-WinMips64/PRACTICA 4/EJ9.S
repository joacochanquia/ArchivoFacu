.data
A: .word 5
X: .word 3
Y: .word 1
.code
ld r1, A(r0)
daddi r4, r0, 0
ld r2, X(r0)
ld r3, Y(r0)
WHILE: slt r4, r0, r1
beqz r4, FIN
daddi r1, r1, -1
j WHILE
dadd r2, r2, r3
FIN: halt