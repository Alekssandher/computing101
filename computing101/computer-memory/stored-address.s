.intel_syntax noprefix
.global _start

_start:
mov rdi, [567800]
mov rdi, [rdi]
mov rax, 60

syscall