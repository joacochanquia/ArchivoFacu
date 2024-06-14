; Memoria de Datos
	ORG 	1000H
NUM1 	DB 	5H
NUM2 	DB 	3H
; Memoria de Instrucciones
	ORG 	3000H ; Subrutina MUL
MUL: 	CMP 	AL, 0
	JZ 	FIN
	CMP 	CL, 0
	JZ 	FIN
LAZO: 	ADD 	DX, AX
	DEC 	CX
	JNZ 	LAZO
FIN: 	RET
	ORG 	2000H ; Programa principal
	MOV 	AL, NUM1
	MOV 	CL, NUM2
	MOV 	DX, 0
	MOV 	AH, 0
	CALL 	MUL
	HLT
	END
