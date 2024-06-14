.data
NUM1: .word 5
NUM2: .word 3
RES: .word 0
.code
ld r1, NUM1(r0)
ld r2, NUM2(r0)
daddi r3, r0, 0
SUMA: daddi r2, r2, -1
nop
bnez r2, SUMA
dadd r3, r3, r1
sd r3, RES(r0)
halt