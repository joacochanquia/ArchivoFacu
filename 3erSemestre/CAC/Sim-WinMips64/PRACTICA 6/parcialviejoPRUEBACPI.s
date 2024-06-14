.data
dato: .word 12

.text
ld r4, dato(r0)
dadd r1, r14, r6
daddi r2, r2, 1
sd r5, dato(r12)
halt