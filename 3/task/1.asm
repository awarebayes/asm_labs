; Написать программу состоящую из
; из двух модулей. Точку входа разместить в первом, затем передать
; управление с помощью дальнего перехода во второй, где ввести 2
; цифры от 1 до 5, вернуть управление в 1-й и вывести сумму этих
; цифр.
;

PUBLIC NUM1
PUBLIC NUM2
PUBLIC sum_and_print
EXTRN input_nums: far

SSTK SEGMENT para STACK 'STACK'
	db 100 dup(0)
SSTK ENDS

SD1 SEGMENT PARA PUBLIC 'DATA'
    NUM1 db 0
    NUM2 db 0
SD1 ENDS

SC1 SEGMENT PARA PUBLIC 'CODE'
    assume CS:SC1, DS:SD1

;; main
main:
    mov ax, SD1
    mov ds, ax ; загрузим сегмент в ds

    ; перейдем в input_nums
    jmp input_nums

sum_and_print:
    
    mov dl, 0
    add dl, NUM1
    add dl, NUM2

    cmp dl, 10
    je print_a

    ; выведем число, меньшее 9
    add dl, 30h
    mov ah, 02h
    int 21h
    jmp exit

print_a:
    mov ah, 02h
    mov dl, 61h
    int 21h
    jmp exit

exit:
	mov ax, 4c00h
	int 21h ; выход

SC1 ENDS
END MAIN