;memoria datos
	 ORG 	1000H
VOCALES	 DB	"AEIOUaeiou"
FINAL	 DB	0
CHAR	 DB	"C"
;memoria instrucciones
;subrutinas
	 ORG	3000H
ES_VOCAL:MOV	BX, OFFSET VOCALES
	 MOV	CL, 10
	 MOV	DL, 00H
COMP:	 CMP	[BX], AL
	 JNZ	NO_ES
	 MOV	DL, 0FFH
	 JMP	FIN
NO_ES:	 INC 	BX
	 DEC	CL
	 JNZ	COMP
FIN:	 RET
;prog principal
	 ORG 	2000H	
	 MOV	DX, 0
	 MOV	AL, CHAR
	 CALL	ES_VOCAL
	 HLT
	END
