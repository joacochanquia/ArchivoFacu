;memoria datos
	ORG 	1000H
NUM0	DB	3
NUM1	DB	1
;memoria instrucciones
;subrutinas
	ORG	3000H
ROTARIZ:ADD 	AL, AL
	ADC	AL, 0
	DEC	CL
	JNZ	ROTARIZ
	RET
;prog principal
	ORG 	2000H	
	MOV	AL, NUM0
	MOV	CL, NUM1
	CALL	ROTARIZ
	HLT
	END
