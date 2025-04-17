.intel_syntax noprefix
.global _start

_start:
    xor rax, rax

    add rax, [rsp+8]
    add rax, [rsp+16]
    add rax, [rsp+24]
    add rax, [rsp]

    sar rax, 2

    push rax
    
