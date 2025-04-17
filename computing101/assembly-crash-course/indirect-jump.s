.intel_syntax noprefix
.global _start

_start:
    
    cmp rdi, 3
    ja above

    imul rax, rdi, 8
    add rax, rsi

    jmp [rax]

above:
    jmp [rsi+32]
