.intel_syntax noprefix
.global _start

_start:
    mov rdi, 2
    mov rsi, 1
    mov rcx, 0
    mov rax, 41
    syscall

    cmp rax, -1
    je .fail

    sub rsp, 16
    mov rsi, rsp

    mov r13, rax

    mov rdi, r13
    mov word ptr [rsi], 2
    mov word ptr [rsi+2], 0x5000
    mov dword ptr [rsi+4], 0
    mov qword ptr [rsi+8], 0

    mov rdx, 16
    mov rax, 49
    syscall

    mov rdi, r13
    mov rsi, 0
    mov rax, 50
    syscall

.end:
    mov rdi, 0
    mov rax, 60
    syscall

.fail:
    mov rdi, 1
    mov rax, 0
    syscall
