.data
tam: .word 10
x: .word 4
cant: .word 0
datos: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
res: .word 0
.code
daddi r1, r0, 0
ld r2, tam(r0)
ld r4, x(r0)
daddi r5, r0, 0
loop: ld r3, datos(r1)
daddi r2, r2, -1
slt r5, r4, r3
dadd r6, r6, r5
sd r5, res(r1)
daddi r1, r1, 8
daddi r5, r0, 0
bnez r2, loop
sd r6, cant(r0)
halt