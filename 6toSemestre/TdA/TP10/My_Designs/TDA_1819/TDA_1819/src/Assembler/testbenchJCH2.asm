		.data
A:		.hword	28877
B:		.hword	6213
C:		.hword	0xB5C9
D:		.hword	0xAE
E:		.hword	0
F:		.hword	0
G:		.hword	0
H:		.hword	0
		.code
		lh r1, A(r0)
		lh r6, B(r0)
		lh r3, C(r0)
		lh r8, D(r0)
		dsubi r2, r1, 6213
		andi r5, r2, 0x8000
		beqz r5, posit1
		xnorr r4, r2, r8
		jmp num2
posit1:		xnorr r4, r2, r3
num2:		dsubi r7, r6, 28877
		andi r10, r7, 0x8000
		beqz r10, posit2
		xnorr r9, r7, r8
		jmp fin
posit2:		xnorr r9, r7, r3
fin:		sh r2, E(r0)
		sh r7, G(r0)
		sh r4, F(r0)
		sh r9, H(r0)
		halt
	