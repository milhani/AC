%include 'in_out.asm'

SECTION .data
    fun:	DB 'Функция: f(x)=4x+3',0h
    answer:	DB 'Результат: ',0h

SECTION .text

    GLOBAL _start

_start:
    pop ecx
    pop edx
    sub ecx,1
    mov esi,0
    
next:
    cmp ecx,0h
    jz _end
    pop eax
    call atoi
    mov ebx,4
    mul ebx
    add eax,3
    add esi,eax
    loop next
    
_end:
    mov eax,fun
    call sprintLF
    mov eax,answer
    call sprint
    mov eax,esi
    call iprintLF
    
    call quit
