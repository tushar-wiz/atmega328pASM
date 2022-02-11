	;
	; delay10ms.asm
	;
	; Created: 08 - 02 - 2022 12:15:43
	; Author: tushar
	;
	
	.def loopCt = r18
	.def iLoopL = r24
	.def iLoopH = r25
	
	.equ iVal = 39998
	
	
	; Time Delay @ 16Mhz = ((loopCt * 159996) + 4) / 16000000
	; Where loopCt cannot be greater than 255
	
DELAY10MS:
	ldi iLoopL, LOW(iVal)
	ldi iLoopH, HIGH(iVal)
	
iLoop:
	sbiw iLoopL, 1
	brne iLoop
	
	dec loopCt
	brne DELAY10MS
	
	nop
	
	ret
