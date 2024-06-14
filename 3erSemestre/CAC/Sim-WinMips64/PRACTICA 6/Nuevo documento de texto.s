.data
num: .word 10
res: .word 0

.text
daddi r2, r0, num
nop
nop
ld r1, 0(r2)
dadd r5, r6, r7
or r9, r1, r7
dsub r8, r2, r7
nop
nop
ld r1, num(r0)
daddi r2, r1, 1
daddi r3, r0, 3
nop
nop
dadd r2, r3, r1
daddi r4, r2, 2
nop
nop
dsub r2, r3, r1
dsub r5, r2, r4
halt