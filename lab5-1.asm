%include 'in_out.asm'

SECTION .data
    msgA:	DB 'Введите a: ',0h
    msgB:	DB 'Введите b: ',0h
    msgC:	DB 'Введите c: ',0h
    answer:	DB 'Ответ: ',0h

SECTION .bss
    a:	RESB 10
    b:	RESB 10
    c:	RESB 10
    out:	RESB 10

SECTION .text
    GLOBAL _start

_start:
    mov eax,msgA
    call sprintLF
    
    mov ecx,a
    mov edx,10
    call sread
    
    mov eax,a
    call atoi
    mov [a],eax
    
    mov eax,msgB
    call sprintLF
    
    mov ecx,b
    mov edx,10
    call sread
    
    mov eax,b
    call atoi
    mov [b],eax
    
    mov eax,msgC
    call sprintLF
    
    mov ecx,c
    mov edx,10
    call sread
    
    mov eax,c
    call atoi
    mov [c],eax
    
    mov ecx,[a]
    mov [out],ecx
    
    cmp ecx,[c]
    jg check
    mov ecx,[c]
    mov [out],ecx
    
check:
    mov ecx,[out]
    cmp ecx,[b]
    jg end
    mov ecx,[b]
    mov [out],ecx
    
end:
    mov eax,answer
    call sprint
    mov eax,[out]
    call iprintLF
    
    call quit
