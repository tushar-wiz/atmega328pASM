/*
 * delayMacro.inc
 *
 *  Created: 09-02-2022 00:14:37
 *   Author: tushar
 */ 

.macro	delayMS
	push	r18
	push	r24
	push	r25

	ldi		r18, @0/10
	rcall	DELAY10MS

	pop		r25
	pop		r24
	pop		r18
.endmacro