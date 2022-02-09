;
; minMax.inc
;
; Created: 10-02-2022 00:41:24
; Author: tushar

	.def	loopCount = r16
	.def	temp = r17
	.def	maxR = r18
	.def	minR = r19
	.def	mask = r20

.macro minMax
	push	ZL
	push	ZH
	push	temp
	push	loopCount
	push	maxR
	push	minR
	push	mask

	ldi   	ZL, LOW(@0 * 2)
	ldi  	ZH, HIGH(@0 * 2)
	ldi   	loopCount, @1
	
	ldi		mask, 0xff

	rcall	MIN_MAX_ARRAY

	out DDRB, mask
	out DDRD, mask
	out	PORTB, maxR
	out	PORTD, minR

	pop	mask
	pop	minR
	pop	maxR
	pop	loopCount
	pop	temp
	pop	ZH
	pop	ZL

.endmacro
