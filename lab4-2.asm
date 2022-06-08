%include 'in_out.asm'

SECTION .data
    msg:	DB 'Введите x:',0
    msg2:	DB 'Результат: ',0
    msg3:	DB 'y=(9x-8)/8',0
    msg4:	DB 'Остаток: ',0

SECTION .bss
    x:	RESB 80
    out:	RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax,msg3
    call sprintLF
    
    mov eax,msg
    call sprintLF
    
    mov ecx,x
    mov edx,80
    call sread
    
    mov eax,x
    call atoi
    
    mov ebx,9
    mul ebx
    sub eax,8
    mov ebx,8
    div ebx
    
    mov [out],eax
    
    mov eax,msg2
    call sprint
    mov eax,[out]
    call iprintLF
    
    mov eax,msg4
    call sprint
    mov eax,edx
    call iprintLF
    
    call quit