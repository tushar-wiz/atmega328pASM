;
; putC.inc
;
; Created: 10-02-2022 11:47:24
; Author: tushar

.macro	putC
    push	r17
    push	r16

    mov		r16, @0
    rcall	putC_start

    pop		r16
    pop		r17
.endmacro

