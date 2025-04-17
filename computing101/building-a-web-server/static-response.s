.intel_syntax noprefix
.global _start

.section .data
    msg: .ascii "HTTP/1.0 200 OK\r\n\r\n"
    msg_len = . - msg
    
.section .text
_start:
    # socket
    mov rdi, 2
    mov rsi, 1
    mov rcx, 0
    mov rax, 41
    syscall

    cmp rax, -1
    je .fail

    # prepare mem add
    sub rsp, 16
    mov rsi, rsp
    mov r13, rax
    
    # bind
    mov rdi, r13
    mov word ptr [rsi], 2
    mov word ptr [rsi+2], 0x5000
    mov dword ptr [rsi+4], 0
    mov qword ptr [rsi+8], 0

    mov r14, rsi
    mov rdx, 16
    mov rax, 49
    syscall

    cmp rax, -1
    je .fail

    # listen
    mov rdi, r13
    mov rsi, 0
    mov rax, 50
    syscall

    # accept
    mov rdi, r13
    xor rsi, rsi
    xor rdx, rdx
    mov rax, 43
    syscall

    cmp rax, -1
    je .fail

    # read
    mov r15, rax

    mov rdi, r15
    mov rsi, rsp
    mov rdx, 1024
    mov rax, 0
    syscall
    
    cmp rax, -1
    je .fail
    
    # write
    mov rdi, r15
    lea rsi, [rip + msg]
    mov rdx, msg_len
    mov rax, 1
    syscall

    # close
    mov rdi, r15
    mov rax, 3
    syscall

.end:
    mov rdi, 0
    mov rax, 60
    syscall

.fail:
    mov rdi, 1
    mov rax, 60
    syscall
