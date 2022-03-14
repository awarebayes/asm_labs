StkSeg SEGMENT PARA STACK 'STACK'
    DB 200h DUP (?)
StkSeg ENDS

DataS SEGMENT WORD 'DATA'
HelloMessage DB 13 
             DB 10
             DB 'Hello world!'
             DB '$'
DataS ENDS

Code SEGMENT WORD 'CODE'
    ASSUME CS:Code, DS:DataS
DispMsg:
    mov AX, DataS   ;  В AX загружается адрес сегмента данных
    mov DS, AX      ;  Установка DS (???) я думал он сам
    mov DX, OFFSET HelloMessage ; в DS:DX адрес строки

    mov CX, 3 ; Записываем в 3 кол-во повторений цикла
    mov AH, 9 ; Установка в AH номера функции системного вызова
HelloWorldLoop:
    int 21h
    loop HelloWorldLoop

    mov AH, 7 ; вывести символ без эха
    int 21h
    mov AH, 4Ch ; завершить процесс
    int 21h
Code ENDS
End DispMsg