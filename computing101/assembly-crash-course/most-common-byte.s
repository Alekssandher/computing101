.intel_syntax noprefix
.global _start

_start:
    xor rcx, rcx
    xor r10, r10
    xor r11, r11
    push rbp
    push r10
    mov rbp, rsp

first_while:

    mov rax, rsi
    sub rax, 1

    cmp rcx, rax
    ja .second_while

    mov al, [rdi+rcx]
    sub [rbp], al 
    inc byte ptr [rbp]

    inc rcx
    jmp first_while

.second_while:
    cmp r10, 0xff
    ja .return

    sub byte ptr [rbp], r10b

    cmp [rbp], r11
    jbe .skip

    mov r11, [rbp]
    
.skip:
    pop r10
    inc r10
.return:
    pop rbp
    mov al, r10b
    ret
    