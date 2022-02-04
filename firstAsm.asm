;
; firstAsm.asm
;
; Created: 01-02-2022 19:07:19
; Author : tusha
;


	.include "m328pdef.inc"

	.cseg

	ldi r16, (1<<PINB5)
	out DDRB, r16
	out PORTB, r16

loop:
	rjmp loop
