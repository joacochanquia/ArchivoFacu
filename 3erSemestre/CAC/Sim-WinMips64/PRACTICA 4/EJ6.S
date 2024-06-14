.data
A: .word 2
B: .word 2
C: .word 2
D: .word 0
.code
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)
bne r1, r2, NO_TRES
bne r1, r3, DOS
TRES: daddi r4, r0, 3
j FIN
NO_TRES: beq r1, r3, DOS
beq r2, r3, DOS
CERO: daddi r4, r0, 0
j FIN
DOS: daddi r4, r0, 2
FIN: sd r4, D(r0)
halt