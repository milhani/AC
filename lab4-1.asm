%include 'in_out.asm'

SECTION .data
    msg:	DB 'Введите номер:',0
    msgLen:	EQU $-msg
    msg2:	DB 'Тогда номер вашего варианта: ',0

SECTION .bss
    buf1:	RESB 80
    out:	RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax,msg
    call sprintLF
    
    mov ecx,buf1
    mov edx,80
    call sread
    
    mov eax, buf1
    call atoi
    mov ebx,20
    xor edx,edx
    div ebx
    add edx,1
    mov [out],eax
        
    mov eax,msg2
    call sprint
    mov eax,edx
    call iprintLF
    
    call quit