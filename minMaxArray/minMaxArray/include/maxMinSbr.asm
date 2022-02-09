	;
	; maxMinSbr.asm
	;
	; Created: 10 - 02 - 2022 00:38:28
	; Author: tushar
	;
	
	
	
MIN_MAX_ARRAY:
	lpm temp, Z + 
	mov maxR, temp
	mov minR, temp
	dec loopCount
	
MAX_CMP:
	lpm temp, Z + 
	cp maxR, temp
	brlo MAX_STORE
	
MIN_CMP:
	cp temp, minR
	brlo MIN_STORE
	
LOOP_DEC:
	dec loopCount
	brne MAX_CMP
	ret
	
MAX_STORE:
	mov maxR, temp
	rjmp MIN_CMP
	
MIN_STORE:
	mov minR, temp
	rjmp LOOP_DEC
