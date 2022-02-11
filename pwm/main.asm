	;
	; pwm.asm
	;
	; Created: 11 - 02 - 2022 11:42:43
	; Author : tushar
	;
	
	.NOLIST
	.include "m328pdef.inc"
	.include "include/delayMacro.inc"
	.LIST
	
	.def mask = r16
	.def duty_cy = r17
	
	.cseg
	.org 0x0000
	
	ldi mask, (1<<PIND6)
	out DDRD, mask
	clr mask
	
TMR0INIT:
	ldi mask, (1<<COM0A1)|(1<<WGM01)|(1<<WGM00) ; FAST PWM with non - inverting mode
	out TCCR0A, mask
	clr mask
	
	ldi mask, (1<<CS01)|(1<<CS00) ; F_clk / 64 Prescaler Value
	out TCCR0B, mask
	
LD_DUTY_CYCLE:
	ldi duty_cy, 0xff
	
MAIN:
	out OCR0A, duty_cy
	delayMS 10
	dec duty_cy
	brne MAIN
	
	rjmp LD_DUTY_CYCLE
	
	.include "delay10ms.asm"
