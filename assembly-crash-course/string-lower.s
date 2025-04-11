.intel_syntax noprefix 
.global _start

_start:
    xor rsi, rsi
    cmp rdi, 0
    je .return
    
.loop:
    cmp byte ptr [rdi], 0
    je .return

    cmp byte ptr [rdi], 0x5a
    ja .skip_foo

    push rsi
    mov rax, 0x403000
    push rdi
    mov rdi, [rdi]

    call rax
    pop rdi
    mov byte ptr [rdi], al
    pop rsi
    inc rsi

.skip_foo:
    inc rdi
    jmp .loop

.return:
    mov rax, rsi
    ret
