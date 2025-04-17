.intel_syntax noprefix
.global _start

_start:
    cmp rdi, 0
    je rdi_zero
    xor rax, rax
    
loop_start:
    mov cl, [rdi]
    cmp cl, 0
    je done
    
    inc rax
    inc rdi
    
    jmp loop_start

rdi_zero:
    xor rax, rax

done:
