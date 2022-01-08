; A function to print a string
; string address in bx
print:
    pusha
.start:
    mov al, [bx]
    cmp al, 0
    je .done

    mov ah, 0x0E
    int 0x10

    inc bx
    jmp .start
.done:
    popa
    ret