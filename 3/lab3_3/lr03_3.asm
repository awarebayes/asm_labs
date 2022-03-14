SD1 SEGMENT para public 'DATA' ; большущий сегмент который состоит из Y и кучи 0
	S1 db 'Y'
	db 65535 - 2 dup (0)
SD1 ENDS

SD2 SEGMENT para public 'DATA' ; то же самое
	S2 db 'E'
	db 65535 - 2 dup (0)
SD2 ENDS

SD3 SEGMENT para public 'DATA' ; то же самое
	S3 db 'S'
	db 65535 - 2 dup (0)
SD3 ENDS

CSEG SEGMENT para public 'CODE'
	assume CS:CSEG, DS:SD1 ; по умолчанию загрузится 1 сегмент
output:
	mov ah, 2 ;  В ah загрузили код выводa символа stdout
	int 21h ; вывели
	mov dl, 13 ; new line
	int 21h
	mov dl, 10 ; flush
	int 21h
	ret
main:
	mov ax, SD1
	mov ds, ax ; загрузка регистра ds, он установлен в SD1
	mov dl, S1 ; в dl загружается значение S1
	call output ; вызов процедуры output
assume DS:SD2 ; можно загрузить SD2
	mov ax, SD2
	mov ds, ax ; загружаем DS2
	mov dl, S2 
	call output
assume DS:SD3 ; можно загрузить SD3
	mov ax, SD3
	mov ds, ax ; загружаем SD3
	mov dl, S3
	call output
	
	mov ax, 4c00h
	int 21h
CSEG ENDS
END main