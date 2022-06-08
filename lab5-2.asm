%include 'in_out.asm'

SECTION .data
    msgX:	DB 'Введите x: ',0h
    msgA:	DB 'Введите a: ',0h
    answer:	DB 'Ответ: ',0h

SECTION .bss
    x:	RESB 10
    a:	RESB 10
    out:	RESB 10

SECTION .text
    GLOBAL _start

_start:
    mov eax,msgX
    call sprintLF
    
    mov ecx,x
    mov edx,10
    call sread
    
    mov eax,x
    call atoi
    mov [x],eax
    
    mov eax,msgA
    call sprintLF
    
    mov ecx,a
    mov edx,10
    call sread
    
    mov eax,a
    call atoi
    mov [a],eax
    
    cmp eax,[x]
    jl check
    jmp another
    
check:
    mov eax,[x]
    mov ebx,[a]
    sub eax,ebx
    mov ebx,2
    mul ebx
    mov [out],eax
    jmp end
    
another:
    mov eax,15
    mov [out],eax
    
end:
    mov eax,answer
    call sprint
    mov eax,[out]
    call iprintLF
    
    call quit
