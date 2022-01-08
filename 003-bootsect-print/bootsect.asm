; Memory offset 0x7C00
[org 0x7C00]

mov bx, MSG
call print
jmp $ ; Wait here

MSG: db "Hello World!", 0 ; Null-terminated string

%include "boot-print.asm"

times 510-($-$$) db 0
dw 0xAA55