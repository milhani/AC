%include 'in_out.asm'

SECTION .data
    answer:	DB 'Результат: ',0h

SECTION .text

    GLOBAL _start

_start:
    pop ecx
    pop edx
    sub ecx,1
    mov edi,ecx
    mov eax,answer
    call sprint
    mov esi,0h
    
_next:
    cmp edi,0h
    jz _end
    pop eax
    call atoi
    sub eax,48
    call myprint
    loop _next
    
_end:
    
    call quit
    
myprint:
    push eax
    push ecx
    push edx
    push esi
    mov ecx,0

mloop:
    inc ecx
    mov edx,0
    mov esi,10
    idiv esi
    add edx,48
    push edx
    cmp eax,0
    jnz mloop

prl:
    dec ecx
    mov eax,esp
    call sprint
    pop eax
    cmp ecx,0
    jnz prl
    
    pop esi
    pop edx
    pop ecx
    pop eax
    ret