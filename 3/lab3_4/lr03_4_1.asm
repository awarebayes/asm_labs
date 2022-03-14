PUBLIC X ; экспорт X
EXTRN exit: far ; объявление X, где то в другом сегменте

SSTK SEGMENT para STACK 'STACK'
	db 100 dup(0)
SSTK ENDS

SD1 SEGMENT para public 'DATA'
	X db 'X'
SD1 ENDS

SC1 SEGMENT para public 'CODE'
	assume CS:SC1, DS:SD1
main:	
	jmp exit ; сразу же jmp к метке exit
SC1 ENDS
END main