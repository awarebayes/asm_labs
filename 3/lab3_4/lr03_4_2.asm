EXTRN X: byte
PUBLIC exit ; вывод exit

SD2 SEGMENT para 'DATA'
	Y db 'Y'
SD2 ENDS

SC2 SEGMENT para public 'CODE'
	assume CS:SC2, DS:SD2
exit:
	mov ax, seg X ; seg X - адрес сегмента где есть X
	mov es, ax ; поместим этот адрес в ax
	; В зубкове сказано : - переопределение сегмента
	mov bh, es:X ; то есть тут мы как в си mov bh, (es = X) и оно возвращается

	mov ax, SD2
	mov ds, ax ; загружаем в ds SD2

	; меняем местами X и Y
	xchg ah, Y ; ah <-> Y
	xchg ah, es:X ; ah <-> ES:X
	xchg ah, Y	; ah <-> Y

	mov ah, 2 ; 2 - вывод ASCII символа в STDOUT
	mov dl, Y ; агрумент, значение Y
	int 21h	 ; вывод
	
	mov ax, 4c00h
	int 21h ; выход
SC2 ENDS
END