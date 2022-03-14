EXTRN output_X: near ; в дугом файле который загрузится в тот же сегмент есть символ output_X

STK SEGMENT PARA STACK 'STACK'
	db 100 dup(0)
STK ENDS

DSEG SEGMENT PARA PUBLIC 'DATA'
	X db 'R' ; X равен R
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSEG, DS:DSEG, SS:STK
main:
	mov ax, DSEG ; загрузка сегмента данных
	mov ds, ax

	call output_X ; вызов процедуры 

	mov ax, 4c00h
	int 21h
CSEG ENDS

PUBLIC X ; X предоставляется другим файлам

END main