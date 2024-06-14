;memoria datos
	ORG 	1000H
NUM0	DW	1234H
NUM1	DW	0ABCDH
;memoria instrucciones
;subrutinas
	ORG	3000H
SWAP:	PUSH	BX
	MOV	BX, SP
	PUSH	AX
	PUSH	CX
	PUSH	DX
	ADD	BX, 4
;guardo la dir de 1 a AX
	MOV	AX, [BX]
	ADD	BX, 2
;muevo la dir de 0 a BX
	MOV	BX, [BX]
;guardo el contenido de 0 en DX
	MOV	DX, [BX]
;guardo la direccion de 0 a CX
	MOV	CX, BX
;muevo la dir de 1 a BX
	MOV	BX, AX
;guardo el contenido de 1 en AX
	MOV	AX, [BX]
;muevo 1 en el lugar de 0
	MOV	[BX], DX
;muevo la direccion de 0 en BX
	MOV 	BX, CX
;muevo 1 en el lugar de 0
	MOV	[BX], AX
	POP	DX
	POP 	CX
	POP 	AX
	POP 	BX
	RET
;prog principal
	ORG 	2000H	
	MOV	AX, OFFSET NUM0
	PUSH 	AX
	MOV	AX, OFFSET NUM1
	PUSH	AX
	CALL	SWAP
	POP	AX
	POP 	CX
	HLT
	END
