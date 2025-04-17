.intel_syntax noprefix
.global _start

_start:
    
    mov rdi, 2
    mov rsi, 1
    mov rdx, 0

    mov rax, 41
    syscall

    cmp rax, -1
    je .fail
    
    xor rdi, rdi
    mov rax, 60
    syscall

.fail:
    mov rdi, 1
    mov rax, 60
    syscall
