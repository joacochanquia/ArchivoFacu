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
	FNROOT	_main
	global	_PORTB
psect	text113,local,class=CODE,delta=2
global __ptext113
__ptext113:
_PORTB	set	6
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ1\practica1.as"
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
	global	??_iniPorts
??_iniPorts:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_iniPorts
?_iniPorts:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	2
	global	main@start
main@start:	; 2 bytes @ 0x2
	ds	2
	global	main@presionado
main@presionado:	; 2 bytes @ 0x4
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66      6       6

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 6     6      0      72
;;                                              0 BANK0      6     6      0
;;                           _iniPorts
;; ---------------------------------------------------------------------------------
;; (1) _iniPorts                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _iniPorts
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
;;BANK0               42      6       6       3        9.1%
;;ABS                  0      0       0       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 13 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ1\practica1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  presionado      2    4[BANK0 ] int 
;;  start           2    2[BANK0 ] int 
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
;;      Locals:         0       4
;;      Temps:          0       2
;;      Totals:         0       6
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_iniPorts
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ1\practica1.c"
	line	13
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l1353:	
	fcall	_iniPorts
	line	15
	
l1355:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@start)
	clrf	(main@start+1)
	line	16
	
l1357:	
	clrf	(main@presionado)
	clrf	(main@presionado+1)
	goto	l1359
	line	17
	
l172:	
	line	18
	
l1359:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(41/8),(41)&7
	goto	u2211
	goto	u2210
u2211:
	goto	l1365
u2210:
	
l1361:	
	btfsc	(40/8),(40)&7
	goto	u2221
	goto	u2220
u2221:
	goto	l1367
u2220:
	
l1363:	
	movf	((main@presionado+1)),w
	iorwf	((main@presionado)),w
	skipz
	goto	u2231
	goto	u2230
u2231:
	goto	l1367
u2230:
	goto	l1365
	
l175:	
	line	19
	
l1365:	
	movlw	low(01h)
	movwf	(main@start)
	movlw	high(01h)
	movwf	((main@start))+1
	line	20
	movlw	low(01h)
	movwf	(main@presionado)
	movlw	high(01h)
	movwf	((main@presionado))+1
	goto	l1367
	line	21
	
l173:	
	line	22
	
l1367:	
	btfss	(41/8),(41)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l1375
u2240:
	
l1369:	
	btfss	(40/8),(40)&7
	goto	u2251
	goto	u2250
u2251:
	goto	l1375
u2250:
	
l1371:	
	movf	(main@presionado+1),w
	iorwf	(main@presionado),w
	skipnz
	goto	u2261
	goto	u2260
u2261:
	goto	l1375
u2260:
	line	23
	
l1373:	
	clrf	(main@start)
	clrf	(main@start+1)
	line	24
	clrf	(main@presionado)
	clrf	(main@presionado+1)
	goto	l1375
	line	25
	
l176:	
	line	26
	
l1375:	
	movlw	01h
	xorwf	(main@start),w
	iorwf	(main@start+1),w
	skipz
	goto	u2271
	goto	u2270
u2271:
	goto	l177
u2270:
	line	27
	
l1377:	
	movlw	1<<((52)&7)
	xorwf	((52)/8),f
	line	28
	movlw	1<<((53)&7)
	xorwf	((53)/8),f
	line	29
	
l177:	
	line	30
	opt asmopt_off
movlw	82
movwf	((??_main+0)+0+1),f
	movlw	41
movwf	((??_main+0)+0),f
u2287:
	decfsz	((??_main+0)+0),f
	goto	u2287
	decfsz	((??_main+0)+0+1),f
	goto	u2287
	nop2
opt asmopt_on

	goto	l1359
	line	31
	
l178:	
	line	17
	goto	l1359
	
l179:	
	line	33
	
l180:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_iniPorts
psect	text114,local,class=CODE,delta=2
global __ptext114
__ptext114:

;; *************** function _iniPorts *****************
;; Defined at:
;;		line 8 in file "C:\Users\Joaco\Desktop\STR\Practica1\P1EJ1\practica1.c"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text114
	file	"C:\Users\Joaco\Desktop\STR\Practica1\P1EJ1\practica1.c"
	line	8
	global	__size_of_iniPorts
	__size_of_iniPorts	equ	__end_of_iniPorts-_iniPorts
	
_iniPorts:	
	opt	stack 7
; Regs used in _iniPorts: [wreg+status,2]
	line	9
	
l1347:	
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	10
	
l1349:	
	clrf	(134)^080h	;volatile
	line	11
	
l1351:	
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(6)	;volatile
	line	12
	
l169:	
	return
	opt stack 0
GLOBAL	__end_of_iniPorts
	__end_of_iniPorts:
;; =============== function _iniPorts ends ============

	signat	_iniPorts,88
psect	text115,local,class=CODE,delta=2
global __ptext115
__ptext115:
	global	btemp
	btemp set 04Eh

	DABS	1,78,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
