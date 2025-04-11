.intel_syntax noprefix
.global _start

_start:

    AND rdi, rsi
    push rdi
    pop rax