opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F84A
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
	FNCALL	_main,_iniPorts
	FNCALL	_main,_iniTimer0
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_presionado
	global	_start
	global	_PORTB
psect	text155,local,class=CODE,delta=2
global __ptext155
__ptext155:
_PORTB	set	6
	global	_TMR0
_TMR0	set	1
	global	_GIE
_GIE	set	95
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_PS0
_PS0	set	1032
	global	_PS1
_PS1	set	1033
	global	_PS2
_PS2	set	1034
	global	_PSA
_PSA	set	1035
	global	_T0CS
_T0CS	set	1037
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ2\P1EJ2.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_presionado:
       ds      2

_start:
       ds      2

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_iniTimer0
??_iniTimer0:	; 0 bytes @ 0x0
	global	??_iniPorts
??_iniPorts:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_iniTimer0
?_iniTimer0:	; 0 bytes @ 0x0
	global	?_iniPorts
?_iniPorts:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	ds	4
;;Data sizes: Strings 0, constant 0, data 0, bss 4, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66      4       8

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0       0
;;                           _iniPorts
;;                          _iniTimer0
;; ---------------------------------------------------------------------------------
;; (1) _iniPorts                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _iniTimer0                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _ISR                                                  4     4      0       0
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _iniPorts
;;   _iniTimer0
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            0      0       0       0        0.0%
;;EEDATA              40      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               42      4       8       3       12.1%
;;ABS                  0      0       8       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       9       6        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 34 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ2\P1EJ2.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_iniPorts
;;		_iniTimer0
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ2\P1EJ2.c"
	line	34
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	35
	
l1386:	
	fcall	_iniPorts
	line	36
	fcall	_iniTimer0
	goto	l1388
	line	39
	
l177:	
	line	41
	
l1388:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(41/8),(41)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l1392
u2240:
	
l1390:	
	btfsc	(40/8),(40)&7
	goto	u2251
	goto	u2250
u2251:
	goto	l1396
u2250:
	goto	l1392
	
l180:	
	
l1392:	
	movf	((_presionado+1)),w	;volatile
	iorwf	((_presionado)),w	;volatile
	skipz
	goto	u2261
	goto	u2260
u2261:
	goto	l1396
u2260:
	line	42
	
l1394:	
	movlw	low(01h)
	movwf	(_start)	;volatile
	movlw	high(01h)
	movwf	((_start))+1	;volatile
	line	43
	movlw	low(01h)
	movwf	(_presionado)	;volatile
	movlw	high(01h)
	movwf	((_presionado))+1	;volatile
	goto	l1396
	line	44
	
l178:	
	line	46
	
l1396:	
	btfss	(41/8),(41)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l1388
u2270:
	
l1398:	
	btfss	(40/8),(40)&7
	goto	u2281
	goto	u2280
u2281:
	goto	l1388
u2280:
	
l1400:	
	movf	(_presionado+1),w	;volatile
	iorwf	(_presionado),w	;volatile
	skipnz
	goto	u2291
	goto	u2290
u2291:
	goto	l1388
u2290:
	line	47
	
l1402:	
	clrf	(_start)	;volatile
	clrf	(_start+1)	;volatile
	line	48
	clrf	(_presionado)	;volatile
	clrf	(_presionado+1)	;volatile
	goto	l1388
	line	49
	
l181:	
	goto	l1388
	line	50
	
l182:	
	line	39
	goto	l1388
	
l183:	
	line	51
	
l184:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_iniPorts
psect	text156,local,class=CODE,delta=2
global __ptext156
__ptext156:

;; *************** function _iniPorts *****************
;; Defined at:
;;		line 24 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ2\P1EJ2.c"
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
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text156
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ2\P1EJ2.c"
	line	24
	global	__size_of_iniPorts
	__size_of_iniPorts	equ	__end_of_iniPorts-_iniPorts
	
_iniPorts:	
	opt	stack 6
; Regs used in _iniPorts: [wreg+status,2]
	line	25
	
l1372:	
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	26
	
l1374:	
	clrf	(134)^080h	;volatile
	line	27
	
l1376:	
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(6)	;volatile
	line	28
	
l174:	
	return
	opt stack 0
GLOBAL	__end_of_iniPorts
	__end_of_iniPorts:
;; =============== function _iniPorts ends ============

	signat	_iniPorts,88
	global	_iniTimer0
psect	text157,local,class=CODE,delta=2
global __ptext157
__ptext157:

;; *************** function _iniTimer0 *****************
;; Defined at:
;;		line 8 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ2\P1EJ2.c"
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
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text157
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ2\P1EJ2.c"
	line	8
	global	__size_of_iniTimer0
	__size_of_iniTimer0	equ	__end_of_iniTimer0-_iniTimer0
	
_iniTimer0:	
	opt	stack 6
; Regs used in _iniTimer0: [wreg]
	line	9
	
l1364:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	10
	bcf	(1035/8)^080h,(1035)&7
	line	11
	bsf	(1034/8)^080h,(1034)&7
	line	12
	bsf	(1033/8)^080h,(1033)&7
	line	13
	bsf	(1032/8)^080h,(1032)&7
	line	14
	
l1366:	
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	15
	
l1368:	
	bsf	(93/8),(93)&7
	line	16
	
l1370:	
	bsf	(95/8),(95)&7
	line	17
	
l171:	
	return
	opt stack 0
GLOBAL	__end_of_iniTimer0
	__end_of_iniTimer0:
;; =============== function _iniTimer0 ends ============

	signat	_iniTimer0,88
	global	_ISR
psect	text158,local,class=CODE,delta=2
global __ptext158
__ptext158:

;; *************** function _ISR *****************
;; Defined at:
;;		line 54 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ2\P1EJ2.c"
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
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       4
;;      Totals:         0       4
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text158
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ2\P1EJ2.c"
	line	54
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 6
; Regs used in _ISR: [wreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_ISR+0)
	movf	fsr0,w
	movwf	(??_ISR+1)
	movf	pclath,w
	movwf	(??_ISR+2)
	movf	btemp+1,w
	movwf	(??_ISR+3)
	ljmp	_ISR
psect	text158
	line	55
	
i1l1378:	
	btfss	(90/8),(90)&7
	goto	u222_21
	goto	u222_20
u222_21:
	goto	i1l189
u222_20:
	line	56
	
i1l1380:	
	bcf	(90/8),(90)&7
	line	57
	
i1l1382:	
	movlw	01h
	xorwf	(_start),w	;volatile
	iorwf	(_start+1),w	;volatile
	skipz
	goto	u223_21
	goto	u223_20
u223_21:
	goto	i1l189
u223_20:
	line	58
	
i1l1384:	
	movlw	1<<((52)&7)
	xorwf	((52)/8),f
	line	59
	movlw	1<<((53)&7)
	xorwf	((53)/8),f
	goto	i1l189
	line	60
	
i1l188:	
	goto	i1l189
	line	61
	
i1l187:	
	line	62
	
i1l189:	
	movf	(??_ISR+3),w
	movwf	btemp+1
	movf	(??_ISR+2),w
	movwf	pclath
	movf	(??_ISR+1),w
	movwf	fsr0
	swapf	(??_ISR+0)^00h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text159,local,class=CODE,delta=2
global __ptext159
__ptext159:
	global	btemp
	btemp set 04Eh

	DABS	1,78,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
