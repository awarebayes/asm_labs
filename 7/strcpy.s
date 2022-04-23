global my_strcpy

section .text
    lea rdx, [rdi]

my_strcpy:
    lodsb
    test al, al
    stosb
    jnz my_strcpy
    lea rax, [rdx]
    ret