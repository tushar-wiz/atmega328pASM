;
; addition16bit.asm
;
; Created: 03-02-2022 12:05:06
; Author : tushar
;

	.NOLIST				;Stops Listing
	.include "m328pdef.inc"
	.LIST				;Starts Listing
	
	;Little Endian Format
	.def	num1L = r16
	.def	num1H = r17

	.def	num2L = r18
	.def	num2H = r19

	.cseg				
	.org	0x0000		; put at the start of program flash

	; LDI rD, K where 16<=D<=31 and 0<=K<=255

	; Loading 0x01_24
	LDI		num1L, 0x24
	LDI		num1H, 0x01

	; Loading 0x45_fa
	LDI		num2L, 0xfa
	LDI		num2H, 0x45

	; ADD is addition without carry
	ADD		num1L, num2L

	; ADC is addition with carry takes into account the overflow or the C Flag register
	ADC		num1H, num2H

	; Result Gets placed in num1L and num1H

loop:
	RJMP	loop

