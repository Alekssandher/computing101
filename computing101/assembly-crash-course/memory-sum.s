.intel_syntax noprefix
.global _start

_start:

    mov rax, [rdi]
    mov rdi, [rdi+8]
    add rax, rdi 

    mov [rsi], rax
