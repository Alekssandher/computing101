.intel_syntax noprefix
.global _start

_start:
mov rdi, 1
mov rsi, 1337000
mov rdx, 1
mov rax, 1
syscall