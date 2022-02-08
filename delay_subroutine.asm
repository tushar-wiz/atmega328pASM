	;
	; delay_subroutine.asm
	;
	; Created: 08 - 02 - 2022 11:39:44
	; Author : tushar
	;
	.NOLIST
	.include "m328pdef.inc"
	.include "include/delayMacro.inc"
	.LIST
	
	.def mask = r16
	.def ledR = r15
	
	.cseg
	.org 0x0000
	
	ldi r16, LOW(RAMEND)         ; initializing stack pointer
	out SPL, r16                 ;
	ldi r17, HIGH(RAMEND)        ;
	out SPH, r17                 ;
	clr r16
	
	clr ledR
	ldi mask, (1<<PINB5)
	out DDRB, mask
	
START:
	eor ledR, mask               ; Toggling LED
	out PORTB, ledR              ;
	
	;ldi loopCt, 100 ; setting loopCt value to get delay of 100 * 10ms = 1s
	;rcall DELAY10MS
	
	delayMS 1000                 ; 1s delay
	
	rjmp START
	
	.include "include/delay10ms.asm"
