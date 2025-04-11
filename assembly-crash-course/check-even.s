.intel_syntax noprefix
.global _start

_start:
    
    and rdi, 0b0000001
    xor rax, rax
    or rax, 0b00000001
    xor rax, rdi

