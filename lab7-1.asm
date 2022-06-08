%include 'in_out.asm'

SECTION .data
    msg:	DB 'Введите число: ',0h
    answer:	DB 'Ответ: ',0h

SECTION .bss
    x:	RESB 10

SECTION .text
    GLOBAL _start

_start:
    mov eax,msg
    call sprint

    mov ecx,x
    mov edx,10
    call sread
    
    mov eax,answer
    call sprint
    
    mov eax,x
    call atoi
    
    call fun
    
    call quit

fun:
    push eax
    push ecx
    push edx
    push esi
    mov ecx,0

divided:
    inc ecx
    mov edx,0
    mov esi,6
    idiv esi
    add edx,48
    push edx
    cmp eax,0
    jnz divided

printloop:
    dec ecx
    mov eax,esp
    call sprint
    pop eax
    cmp ecx,0
    jnz printloop
    
    pop esi
    pop edx
    pop ecx
    pop eax
    ret