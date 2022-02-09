	;
	; minMaxArray.asm
	;
	; Created: 09 - 02 - 2022 17:26:04
	; Author : tushar
	;
	
	; Works only for unsigned values of one byte
	
	.NOLIST
	.include "m328pdef.inc"
	.include "include/stackInit.inc"
	.include "include/minMax.inc"
	.LIST
	
	.equ num = 10
	
	.cseg
	.org 0x0000
	
	stackInit
	
	rjmp START
	
	.include "include / maxMinSbr.asm"
	
	
START:
	minMax pArr, num
	
END:
	rjmp END
	
pArr:
	.db 0x11, 0x03, 0x02, 0x03, 0x04, 0x10, 0x02, 0x03, 0xAF, 0x01
