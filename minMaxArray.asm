	;
	; minMaxArray.asm
	;
	; Created: 09 - 02 - 2022 17:26:04
	; Author : tushar
	;
	
	; Works only for unsigned values of one byte
	
	.NOLIST
	.include "m328pdef.inc"
	.include "include/stackInit.inc"
	.LIST
	
	.def loopCount = r16
	.def temp = r17
	.def maxR = r18
	.def minR = r19
	
	.equ num = 10
	
	.cseg
	.org 0x0000
	
	stackInit
	
MAX_STORE:
	mov maxR, temp
	rjmp MIN_CMP
	
MIN_STORE:
	mov minR, temp
	rjmp LOOP_DEC
	
	ldi ZL, LOW(pArr * 2)
	ldi ZH, HIGH(pArr * 2)
	
	ldi loopCount, num
	
	lpm temp, Z+ 
	mov maxR, temp
	mov minR, temp
	dec loopCount
	
START:
	lpm temp, Z+ 
	cp maxR, temp
	brlo MAX_STORE
	
MIN_CMP:
	cp temp, minR
	brlo MIN_STORE
	
LOOP_DEC:
	dec loopCount
	brne START
	
END:
	out PORTB, maxR
	out PORTD, minR

; Infinite Loop	
I_LOOP:
	rjmp I_LOOP
	
	
pArr:
	.db 0x11, 0x03, 0x02, 0x03, 0x04, 0x10, 0x02, 0x03, 0xAF, 0x01
