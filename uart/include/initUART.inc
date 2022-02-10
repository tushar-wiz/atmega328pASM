;
; initUART.inc
;
; Created: 10-02-2022 12:07:50
; Author: tushar 
;

.macro	initUART
    push	r16
    push	r17

    ldi		r16, LOW(@0)
    ldi		r17, HIGH(@0)


    sts		UBRR0L, r16
    sts		UBRR0H, r17

    ldi		r16, (1 << RXEN0)|(1 << TXEN0)
    sts		UCSR0B, r16

    pop		r17
    pop		r16
.endmacro