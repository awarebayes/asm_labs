;
; Что здесь происходит?
; SD1 записывается в одном и том же сегменте из за common
; 

SD1 SEGMENT para common 'DATA'
	C1 LABEL byte ; метка второго символа, первый байт big endian, байт 34 -> символ 4
	ORG 1h ; говорит компилятору асм: подвинься на 1 байт
	C2 LABEL byte ; метка первого символа, второй байт big endian, байт 44 -> символ D
SD1 ENDS

CSEG SEGMENT para 'CODE'
	ASSUME CS:CSEG, DS:SD1
main:
	; загрузка SD1 в регистр ds
	mov ax, SD1
	mov ds, ax

	; установка аргумента вывода ascii символа
	mov ah, 2

	mov dl, C1 ; перенесли метку (содержимое) C1 в регистр dl
	int 21h ; вызов dos

	mov dl, C2 ; перенесли содержимое C2 в регистр dl
	int 21h ; вызов dos

	mov ax, 4c00h ; код завершения работы
	int 21h
CSEG ENDS
END main