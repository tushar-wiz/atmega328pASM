;
; stackInit.inc
; 
; Created: 09-02-2022 17:26:45
; Author: tushar

.macro stackInit
	ldi		r16, LOW(RAMEND)
	out		SPL, r16
	ldi		r17, HIGH(RAMEND)
	out		SPH, r17

	clr		r16
	clr		r17
.endmacro
 
