;
; blink_noTimer.asm
;
; Created: 07-02-2022 09:57:35
; Author : tushar
;

    .NOLIST
    .include "m328pdef.inc"
    .LIST

    .def	mask	= r16
    .def	ledR	= r17
    .def	oLoopR	= r18
    .def	iLoopR_l = r24
    .def	iLoopR_h = r25

    .equ	oVal	= 255			; Outer Loop Value
    .equ	iVal	= 15685			; Inner Loop Value

    .cseg
    .org	0x0000
    
    clr		ledR					; Clear Led register		
    ldi		mask, (1 << PINB5)		; Load b00100000 into mask	
    out		DDRB, mask				; Set as PINB5 as Output	

START:
    eor		ledR, mask				; XOR to Toggle				; 1 cycle
    out		PORTB, ledR				; Toggle Pin				; 1 cycle
    ldi		oLoopR, oVal			; Load reg with oVal		; 1 cycle

O_LOOP:
    ldi		iLoopR_l, LOW(iVal)		; Load reg with lower byte	; 1 cycle
    ldi		iLoopR_h, HIGH(iVal)	; Load reg with higher byte	; 1 cycle

I_LOOP:
    sbiw	iLoopR_l, 1				; Decrements 1 from the word; 2 cycles
    brne	I_LOOP					; branch if Z != 0			; 1/2 cycles

    dec		oLoopR					; Decrements 1				; 1 cycle
    brne	O_LOOP					; branch if Z != 0			; 1/2 cycles

    rjmp	START					; Back to Start

    ; Total Cycles = 4 + (4*oVal*(1 + iVal))
    ; Total Cycles = 4 + (4*255*(1+15685)) = 15999724
    ; Time Delay @ 16Mhz = 0.99998275s almost 1s 