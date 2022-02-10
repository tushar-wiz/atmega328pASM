	;
	; uart.asm
	;
	; Created: 10 - 02 - 2022 10:12:59
	; Author : tushar
	;
	
	.NOLIST
	.include "m328pdef.inc"
	.include "include/stackInit.inc"
	.include "include/putC.inc"
	.include "include/initUART.inc"
	.LIST
	
	.equ F_CPU = 16000000
	.equ baud = 9600
	.equ bps = (F_CPU / 16 / baud) - 1
	
	.def loopCount = r16
	.def temp = r17
	
	.cseg
	.org 0x000
	
	stackInit
	
	initUART bps
	
START:
	ldi loopCount, 8
	ldi ZL, LOW(string * 2)
	ldi ZH, HIGH(string * 2)
	
LOOP:
	lpm temp, Z+ 
	putC temp
	dec loopCount
	brne LOOP
	
	rjmp START
	
	
	.include "putC.asm"
	
string:
	.db 'T', 'U', 'S', 'H', 'A', 'R', '\0', '\n'
