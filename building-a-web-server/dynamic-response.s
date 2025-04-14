.intel_syntax noprefix
.global _start

.section .data
    msg: .ascii "HTTP/1.0 200 OK\r\n\r\n"
    msg_len = . - msg

.section .text

_start:

create_socket:
    mov rax, 41
    mov rdi, 2
    mov rsi, 1
    mov rcx, 0
    syscall
    call check_rax

    mov r12, rax

create_bind:
    sub rsp, 16
    mov rsi, rsp
    
    # bind
    mov rax, 49
    mov rdi, r12
    mov word ptr [rsi], 2
    mov word ptr [rsi+2], 0x5000
    mov dword ptr [rsi+4], 0
    mov qword ptr [rsi+8], 0
    mov rdx, 16
    syscall
    call check_rax

    mov r13, rsi

create_listener:
    mov rax, 50
    mov rdi, r12
    xor rsi, rsi
    syscall
    call check_rax

accept_req:
    mov rax, 43
    mov rdi, r12
    xor rsi, rsi
    xor rdx, rdx
    syscall
    call check_rax

    mov r14, rax

read_req:
    mov rax, 0
    mov rdi, r14
    mov rsi, rsp
    mov rdx, 0x200
    syscall
    call check_rax

    add rsp, 16
load_req:
    lea rbx, [r13]
    add rbx, 4

    mov rcx, rbx

find_first_space:
    cmp byte ptr [rcx], ' '
    je found_first_space

    inc rcx
    jmp found_first_space

found_first_space:
    dec rcx
    mov rbx, rcx

find_second_space:
    cmp byte ptr [rcx], ' '
    je found_second_space

    inc rcx
    jmp find_second_space

found_second_space:
    mov byte ptr [rcx], 0

open_file:
    mov rax, 2
    mov rdi, rbx
    mov rsi, 0
    mov rdx, 0
    syscall
    call check_rax

    mov r15, rax 

read_file:
    sub rsp, 512 

    mov rax, 0
    mov rsi, rsp        
    mov rdi, r15        
    mov rdx, 0x200       
    syscall
    call check_rax

    mov rbx, rax 
    

close_read:
    mov rdi, r15
    mov rax, 3
    syscall

write_headers:
    mov rax, 1
    mov rdi, r14
    lea rsi, [rip + msg]
    mov rdx, msg_len
    syscall
    call check_rax

    add rsp, 512

write_res:
    sub rsp, 512
    mov rax, 1
    mov rdi, r14
    mov rsi, rsp
    mov rdx, rbx
    syscall
    add rsp, 512

close_write_res:
    mov rdi, r14
    mov rax, 3
    syscall

exit:
    mov rdi, 0
    mov rax, 60
    syscall

fail:
    mov rdi, 1
    mov rax, 60
    syscall

check_rax:
    cmp rax, -1
    je fail
    ret

