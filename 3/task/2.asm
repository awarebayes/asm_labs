EXTRN NUM1: byte
EXTRN NUM2: byte
EXTRN sum_and_print: far

PUBLIC input_nums

SC2 SEGMENT PARA PUBLIC 'CODE'

input_nums:
    mov ax, seg NUM1 ; переместим в AX адрес сегмента где хранится ARRAY
    mov es, ax ; загрузим сегмент в es

    ;; считаем цифру из потока ввода

    mov ah, 07h
    int 21h
    sub al, 30h
    mov es:NUM1, al
    
    ; считаем вторую цифру из потока
    mov ah, 07h
    int 21h
    sub al, 30h
    mov es:NUM2, al

    jmp sum_and_print ; суммируем и печатаем

SC2 ENDS
END