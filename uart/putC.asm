	;
	; putC.asm
	;
	; Created: 10 - 02 - 2022 11:58:40
	; Author: tushar
	
	
putC_start:
	lds r17, UCSR0A
	sbrs r17, UDRE0
	rjmp putC_start
	
	sts UDR0, r16
	
	ret
