;memoria datos
	ORG 	1000H
CADENA	DB	"HOLA Gabi todo BiEn?!"
FINAL	DB	0
;memoria instrucciones
;subrutinas
	ORG	3000H
CONCAR:	CMP 	BYTE PTR [BX], 0
	JZ	FIN
	INC	DX
	INC 	BX
	JMP	CONCAR
FIN:	RET
;prog principal
	ORG 	2000H	
	MOV	BX, OFFSET CADENA
	MOV	DX, 0
	CALL	CONCAR
	HLT
	END
