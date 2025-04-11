.intel_syntax noprefix
.global _start

_start:

    xor rdx, rdx
    mov rax, rdi
    div rsi

    mov rax, rdx