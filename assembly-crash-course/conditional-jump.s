.intel_syntax noprefix
.global _start

_start:     
    
    mov eax, 0

    cmp DWORD PTR [rdi], 0x7f454c46
    je first_equals

    cmp DWORD PTR [rdi], 0x00005A4D
    je second_equals

    jmp default

first_equals:
    xor eax, eax
    add eax, [rdi+4]
    add eax, [rdi+8]
    add eax, [rdi+12]

    jmp done

second_equals:
    xor eax, eax
    mov eax, [rdi+4]
    sub eax, [rdi+8]
    sub eax, [rdi+12]

    jmp done

default:
    mov eax, 1
    imul eax, [rdi+4]
    imul eax, [rdi+8]
    imul eax, [rdi+12]
    
done:
    
