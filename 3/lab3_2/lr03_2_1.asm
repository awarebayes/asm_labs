STK SEGMENT para STACK 'STACK'
	db 100 dup(0)
STK ENDS

SD1 SEGMENT para common 'DATA' ; общий сегмент, он будет использоваться в другом файле
	W dw 3444h ; паковка по слову (два байта)
SD1 ENDS
END
