PUBLIC output_X ; экспорт символа output_X
EXTRN X: byte ; внешний символ X, размер которого равен байту

DS2 SEGMENT AT 0b800h ; тут буффер экрана. Символы отсюда будут печататься на экране
	CA LABEL byte ; определение метки CA
	ORG 80 * 2 * 2 + 2 * 2 ; сдвинуться вооот на это число байтов перед
	SYMB LABEL word ; тут будет выводимый символ
DS2 ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSEG, ES:DS2
output_X proc near ; определение метки output_X, аттрибут near соотносится с другим файлом
	mov ax, DS2 ; загрузка регистра
	mov es, ax

	mov ah, 10 ; переносим зачем то в ax X10
	mov al, X
	mov symb, ax ; после этого они по идее должны будут появиться на экране, у меня не получилось
	ret
output_X endp
CSEG ENDS
END