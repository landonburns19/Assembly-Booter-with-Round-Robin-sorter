[org 0x7c00]
mov ah, 0x0e
mov bx, starting_message

print_this:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp print_this
end:

jmp $

starting_message:
    db "beginning", 0

times 510-($-$$) db 0
dw 0xaa55