.intel_syntax noprefix
.global _start

_start:
    xor rax, rax
    xor rcx, rcx

loop:
    cmp rcx, rsi
    jge end

    mov rbx, [rdi + rcx*8]
    add rax, rbx
    inc rcx
    jmp loop

end:
    cqo
    idiv rsi
