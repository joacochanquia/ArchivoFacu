;memoria datos
	ORG 	1000H
CADENA	DB	"HOiLA Gabi toido BiEni?!"
FINAL	DB	0
CHAR	DB	"i"
;memoria instrucciones
;subrutinas
	ORG	3000H
CONCAR:	CMP 	BYTE PTR [BX], 0
	JZ	FIN
	CMP	[BX], AL
	JNZ	NO_ES
	INC	DX
NO_ES:	INC 	BX
	JMP	CONCAR
FIN:	RET
;prog principal
	ORG 	2000H	
	MOV	BX, OFFSET CADENA
	MOV	DX, 0
	MOV	AL, CHAR
	CALL	CONCAR
	HLT
	END
