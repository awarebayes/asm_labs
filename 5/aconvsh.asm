public convert_shex

extrn num: word



DATASEG SEGMENT PARA PUBLIC 'DATA'
    out_msg db 'Result (in s16): $'
    hexnum db 4 dup('0'), '$'
    sign db ' '

    mask_last_hex_digit dw 15
DATASEG ENDS


CODESEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CODESEG, DS:DATASEG

to_shex:
    mov ax, num

    cmp ax, 32767
    jbe nosign

    mov sign, '-'

    sub ax, 1 ; переводим из дополнительного кода в обычный
    not ax

    nosign:

    mov bx, 3 ; идем тип с конца 

    trans_shex: ; for bx in range(4, 0, -1):
        mov dx, ax ; переносим число из ax в dx, дальше ax для вывода

        and dx, mask_last_hex_digit

        cmp dl, 10
        jb digit ; печатаем десятичную цифру

        add dl, 7 ; добавляем +7 если нет 

        digit:

        add dl, '0' 

        mov hexnum[bx], dl

        mov cl, 4 ; двигаем на 4 позиции
        sar ax, cl

        dec bx ; декрементим

        cmp bx, -1
        jne trans_shex

    ret


print_shex:

    mov cx, 4
    mov bx, 0

    mov dl, sign

    mov ah, 2
    int 21h

    loop_out: 
        mov ah, 2

        mov dl, hexnum[bx]

        inc bx

        int 21h
        
        loop loop_out

    mov sign, ' '

    ret

; Var 2 end




convert_shex proc near
    mov dx, OFFSET out_msg
    mov ah, 9
    int 21h

    call to_shex

    call print_shex

    ret

convert_shex endp

CODESEG ENDS
END