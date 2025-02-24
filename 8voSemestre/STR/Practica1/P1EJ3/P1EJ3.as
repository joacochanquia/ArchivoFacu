opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_initPorts
	FNCALL	_main,_initADC
	FNCALL	_main,_readADC
	FNCALL	_main,_updateDisplay
	FNROOT	_main
	global	_ADCON0
psect	text90,local,class=CODE,delta=2
global __ptext90
__ptext90:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTB
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_GO_nDONE
_GO_nDONE	set	250
	global	_RD6
_RD6	set	70
	global	_RD7
_RD7	set	71
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_ADFM
_ADFM	set	1279
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_initADC
?_initADC:	; 0 bytes @ 0x0
	global	??_initADC
??_initADC:	; 0 bytes @ 0x0
	global	?_initPorts
?_initPorts:	; 0 bytes @ 0x0
	global	??_initPorts
??_initPorts:	; 0 bytes @ 0x0
	global	?_updateDisplay
?_updateDisplay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_readADC
?_readADC:	; 2 bytes @ 0x0
	global	updateDisplay@value
updateDisplay@value:	; 2 bytes @ 0x0
	ds	2
	global	??_readADC
??_readADC:	; 0 bytes @ 0x2
	global	??_updateDisplay
??_updateDisplay:	; 0 bytes @ 0x2
	ds	1
	global	updateDisplay@digit
updateDisplay@digit:	; 1 bytes @ 0x3
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	3
	global	main@adcValue
main@adcValue:	; 2 bytes @ 0x9
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      11
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_readADC	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_readADC
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0      75
;;                                              6 COMMON     5     5      0
;;                          _initPorts
;;                            _initADC
;;                            _readADC
;;                      _updateDisplay
;; ---------------------------------------------------------------------------------
;; (1) _updateDisplay                                        4     2      2      60
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (1) _readADC                                              6     4      2       0
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; (1) _initPorts                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _initADC                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _initPorts
;;   _initADC
;;   _readADC
;;   _updateDisplay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      B       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 49 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adcValue        2    9[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_initPorts
;;		_initADC
;;		_readADC
;;		_updateDisplay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.c"
	line	49
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	52
	
l1838:	
	fcall	_initPorts
	line	53
	fcall	_initADC
	goto	l1840
	line	55
	
l658:	
	line	56
	
l1840:	
	fcall	_readADC
	movf	(1+(?_readADC)),w
	clrf	(main@adcValue+1)
	addwf	(main@adcValue+1)
	movf	(0+(?_readADC)),w
	clrf	(main@adcValue)
	addwf	(main@adcValue)

	line	57
	
l1842:	
	movf	(main@adcValue+1),w
	clrf	(?_updateDisplay+1)
	addwf	(?_updateDisplay+1)
	movf	(main@adcValue),w
	clrf	(?_updateDisplay)
	addwf	(?_updateDisplay)

	fcall	_updateDisplay
	line	58
	
l1844:	
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	136
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2157:
	decfsz	((??_main+0)+0),f
	goto	u2157
	decfsz	((??_main+0)+0+1),f
	goto	u2157
	decfsz	((??_main+0)+0+2),f
	goto	u2157
opt asmopt_on

	goto	l1840
	line	59
	
l659:	
	line	55
	goto	l1840
	
l660:	
	line	60
	
l661:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_updateDisplay
psect	text91,local,class=CODE,delta=2
global __ptext91
__ptext91:

;; *************** function _updateDisplay *****************
;; Defined at:
;;		line 32 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.c"
;; Parameters:    Size  Location     Type
;;  value           2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  digit           1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text91
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.c"
	line	32
	global	__size_of_updateDisplay
	__size_of_updateDisplay	equ	__end_of_updateDisplay-_updateDisplay
	
_updateDisplay:	
	opt	stack 7
; Regs used in _updateDisplay: [wreg+status,2]
	line	36
	
l1818:	
	movf	(updateDisplay@value+1),w
	movwf	(??_updateDisplay+0)+0
	movf	(??_updateDisplay+0)+0,w
	movwf	(updateDisplay@digit)
	line	37
	
l1820:	
	movf	(updateDisplay@digit),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	38
	
l1822:	
	bsf	(71/8),(71)&7
	
l1824:	
	bcf	(71/8),(71)&7
	line	39
	
l1826:	
	opt asmopt_off
movlw	249
movwf	(??_updateDisplay+0)+0,f
u2167:
	clrwdt
decfsz	(??_updateDisplay+0)+0,f
	goto	u2167
	nop2	;nop
	clrwdt
opt asmopt_on

	line	42
	
l1828:	
	movf	(updateDisplay@value),w
	movwf	(??_updateDisplay+0)+0
	movf	(??_updateDisplay+0)+0,w
	movwf	(updateDisplay@digit)
	line	43
	
l1830:	
	movf	(updateDisplay@digit),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	44
	
l1832:	
	bsf	(70/8),(70)&7
	
l1834:	
	bcf	(70/8),(70)&7
	line	45
	
l1836:	
	opt asmopt_off
movlw	249
movwf	(??_updateDisplay+0)+0,f
u2177:
	clrwdt
decfsz	(??_updateDisplay+0)+0,f
	goto	u2177
	nop2	;nop
	clrwdt
opt asmopt_on

	line	46
	
l655:	
	return
	opt stack 0
GLOBAL	__end_of_updateDisplay
	__end_of_updateDisplay:
;; =============== function _updateDisplay ends ============

	signat	_updateDisplay,4216
	global	_readADC
psect	text92,local,class=CODE,delta=2
global __ptext92
__ptext92:

;; *************** function _readADC *****************
;; Defined at:
;;		line 15 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text92
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.c"
	line	15
	global	__size_of_readADC
	__size_of_readADC	equ	__end_of_readADC-_readADC
	
_readADC:	
	opt	stack 7
; Regs used in _readADC: [wreg+btemp+1]
	line	16
	
l1810:	
	opt asmopt_off
movlw	6
movwf	(??_readADC+0)+0,f
u2187:
decfsz	(??_readADC+0)+0,f
	goto	u2187
	clrwdt
opt asmopt_on

	line	17
	
l1812:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	18
	goto	l646
	
l647:	
	
l646:	
	btfsc	(250/8),(250)&7
	goto	u2141
	goto	u2140
u2141:
	goto	l646
u2140:
	goto	l1814
	
l648:	
	line	19
	
l1814:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(??_readADC+0)+0
	clrf	(??_readADC+0)+0+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(??_readADC+2)+0
	clrf	(??_readADC+2)+0+1
	movf	(??_readADC+2)+0,w
	movwf	(??_readADC+2)+1
	clrf	(??_readADC+2)+0
	movf	0+(??_readADC+0)+0,w
	iorwf	0+(??_readADC+2)+0,w
	movwf	(?_readADC)
	movf	1+(??_readADC+0)+0,w
	iorwf	1+(??_readADC+2)+0,w
	movwf	1+(?_readADC)
	goto	l649
	
l1816:	
	line	20
	
l649:	
	return
	opt stack 0
GLOBAL	__end_of_readADC
	__end_of_readADC:
;; =============== function _readADC ends ============

	signat	_readADC,90
	global	_initPorts
psect	text93,local,class=CODE,delta=2
global __ptext93
__ptext93:

;; *************** function _initPorts *****************
;; Defined at:
;;		line 23 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text93
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.c"
	line	23
	global	__size_of_initPorts
	__size_of_initPorts	equ	__end_of_initPorts-_initPorts
	
_initPorts:	
	opt	stack 7
; Regs used in _initPorts: [wreg+status,2]
	line	24
	
l1034:	
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	25
	
l1036:	
	clrf	(134)^080h	;volatile
	line	26
	
l1038:	
	clrf	(136)^080h	;volatile
	line	27
	
l1040:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	28
	
l1042:	
	clrf	(8)	;volatile
	line	29
	
l652:	
	return
	opt stack 0
GLOBAL	__end_of_initPorts
	__end_of_initPorts:
;; =============== function _initPorts ends ============

	signat	_initPorts,88
	global	_initADC
psect	text94,local,class=CODE,delta=2
global __ptext94
__ptext94:

;; *************** function _initADC *****************
;; Defined at:
;;		line 8 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text94
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ3\P1EJ3.c"
	line	8
	global	__size_of_initADC
	__size_of_initADC	equ	__end_of_initADC-_initADC
	
_initADC:	
	opt	stack 7
; Regs used in _initADC: [wreg]
	line	9
	
l1030:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	10
	movlw	(0Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	11
	
l1032:	
	bsf	(1279/8)^080h,(1279)&7
	line	12
	
l643:	
	return
	opt stack 0
GLOBAL	__end_of_initADC
	__end_of_initADC:
;; =============== function _initADC ends ============

	signat	_initADC,88
psect	text95,local,class=CODE,delta=2
global __ptext95
__ptext95:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
