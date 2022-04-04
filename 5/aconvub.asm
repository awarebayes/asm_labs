public convert_ubin

extrn num: word


DATASEG SEGMENT PARA PUBLIC 'DATA'
    out_msg db 'Result in (u2): $'
    binnum db 16 dup('0'), '$'

    mask_last_hex_digit dw 1
DATASEG ENDS


CODESEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CODESEG, DS:DATASEG

to_ubin:
    mov ax, num ; 
    mov bx, 15 ; счетчик, начинаем с конца

    c_ubin:
        mov dx, ax

        and dx, mask_last_hex_digit ; выделяем последний бит
        add dl, '0' ; добавляем 0

        mov binnum[bx], dl ; добавляем в конец

        sar ax, 1 ; арифметический сдвиг влево

        dec bx ; декремент счетчика

        cmp bx, -1 ; проверяем, не закончилось ли число
        jne c_ubin

    ret


print_ubin:

    mov cx, 16 ; печатаем все 16 символов
    mov bx, 0 ; печатаем сначала

    loop_out: 
        mov ah, 2 ; печатаем один символ с dl

        mov dl, binnum[bx] ; тут мы его загружаем

        inc bx ; увеличиваем счетчик

        int 21h
        
        loop loop_out

    ret

; Var 2 end




convert_ubin proc near
    mov dx, OFFSET out_msg
    mov ah, 9
    int 21h

    call to_ubin

    call print_ubin

    ret

convert_ubin endp

CODESEG ENDS
END