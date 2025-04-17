.intel_syntax noprefix
.global _start

_start:
    jmp point
    .rept 0x51 
        nop
    .endr
point: 
    mov rax, 0x1
