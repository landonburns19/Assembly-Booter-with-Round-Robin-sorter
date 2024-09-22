[org 0x7c00]


mov byte [31745], 'p'
mov byte [31746], '1'
mov byte [31747], 2

mov byte [31745+10], 'p'
mov byte [31746+10], '2'
mov byte [31747+10], 1

mov byte [31745+20], 'p'
mov byte [31746+20], '3'
mov byte [31747+20], 1

mov byte [31747+30], 0
mov byte [31747+31], 0
mov byte [31747+32], 0



jmp RRtimer
end1:

;mov al, [31745 + 20]
;mov ah, 0x0E
;int 0x10 


jmp $

RRtimer:
mov al, [31747]
mov bl, [31747+10]
cmp al, bl 
JNL comparep1andp3
cmp al, bl 
JL comparep2andp3
jmp end1

comparep1andp3:
mov al, [31747]
mov bl, [31747+20]
cmp al, bl 
JNL p1getsallocated
cmp al, bl 
JL p3getsallocated
jmp end1

comparep2andp3:
mov al, [31747+10]
mov bl, [31747+20]
cmp al, bl 
JNL p2getsallocated
cmp al, bl 
JL p3getsallocated
jmp end1


p1getsallocated:
mov al, [31747+31]
inc al
mov byte [31747+31], al
mov al, [31747+32]
inc al
mov byte [31747+32], al

p2getsallocated:
mov al, [31747+30]
inc al
mov byte [31747+30], al
mov al, [31747+32]
inc al
mov byte [31747+32], al

p3getsallocated:
mov al, [31747+30]
inc al
mov byte [31747+30], al
mov al, [31747+31]
inc al
mov byte [31747+31], al

times 510-($-$$) db 0
dw 0xaa55