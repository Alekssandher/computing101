.intel_syntax noprefix
.global _start

_start:
    
    jmp point
    .rept 0x51
        nop
    .endr
point:
    pop rdi
    mov rax, 0x403000
    jmp rax
