%include 'in_out.asm'

SECTION .data
    answer:	DB 'Ответ: ',0h

SECTION .bss
    out:	RESB 10

SECTION .text
    GLOBAL _start

_start:
    pop ecx
    pop edx
    pop eax
    call atoi
    mov ecx, eax

    mov eax,1
    
label:
    mul ecx
    loop label
    
    mov [out],eax
    mov eax,answer
    call sprint
    mov eax,[out]
    call iprintLF
    
    call quit
