; Матрица 9x9
; заменить все значения в столбцах, содержащих
; цифры на #

SSEG SEGMENT PARA STACK 'STACK'
    DB 256 DUP (0)
SSEG ENDS

DS1 SEGMENT PARA PUBLIC 
    mat db 9*9 dup(0) 

    nr_msg db 'Enter #rows: $'
    nc_msg db 'Enter #cols: $'
    dim_msg db 'Got matrix of dim: $'
    elem_msg_1 db 'mat[$'
    elem_msg_2 db '][$'
    elem_msg_3 db ']: $'

    n_rows db 0
    n_cols db 0
    replace_flag db 9 dup (0)
DS1 ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
assume CS:CSEG, DS: DS1, SS:SSEG ; set segments

main:
    mov ax, DS1
    mov ds, ax

    call input_dim
    ; mov n_rows, 2
    ; mov n_cols, 3
    call input_mat
    call process_mat
    call output_dim
    call print_mat
    mov ah, 4ch						
    int 21h	


input_dim:
    mov dx, offset nr_msg
    call println

    call read_num
    mov n_rows, al
    call new_line

    mov dx, offset nc_msg
    call println

    call read_num
    mov n_cols, al
    call new_line

    ret

output_dim:
    mov dx, offset dim_msg
    call println
    call output_dim_raw
    ret


output_dim_raw:
    mov ah, 2
    mov dl, n_rows
    add dl, '0'
    int 21h

    mov dl, 'x'
    int 21h

    mov ah, 2
    mov dl, n_cols
    add dl, '0'
    int 21h

    call new_line

    ret

println:
    mov ah, 9
    int 21h
    call new_line
    ret

print:
    mov ah, 9
    int 21h
    ret

new_line:
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    ret

read_num:
    mov ah, 1
    int 21h
    sub al, '0'
    ret

read_char:
    mov ah, 1
    int 21h
    ret

input_mat:
    mov cl, n_rows
    
    row_loop:
        mov bl, cl ; move to row index for input row
        call input_row
        loop row_loop
    ret

input_row:
    ; bl - reversed row index
    ; cl - reversed col index

    push cx

    mov cl, n_cols
    col_loop:
        call input_element
        loop col_loop
    
    pop cx
    ret


input_element:
    ; bl - reversed row index
    ; cl - reversed col index

    push bx
    push cx

    call reverse_indexes

    ; prints welcome message
    mov dx, offset elem_msg_1
    call print

    mov ah, 2
    mov dl, bl
    add dl, '0'
    int 21h

    mov dx, offset elem_msg_2
    call print

    mov ah, 2
    mov dl, cl
    add dl, '0'
    int 21h

    mov dx, offset elem_msg_3
    call print
    
    call read_char

    call calc_element_offset ; sets si

    mov mat[si], al
    call new_line


    pop cx
    pop bx
    
    ret

reverse_indexes:
    ; input:
    ; bl - reversed row index
    ; cl - reversed column index
    ; output:
    ; bl - column index
    ; cl - column index
    push dx

    mov dl, n_rows
    sub dl, bl
    mov bl, dl

    ; reverses indexing for cols
    mov dl, n_cols
    sub dl, cl
    mov cl, dl

    pop dx

    ret

calc_element_offset:
    ; input:
    ; bl - row
    ; cl - column
    ; output
    ; si - element index
    push ax

    mov al, bl
    mov ah, 0
    mul n_cols
    add al, cl
    mov si, ax

    pop ax
    ret

print_mat:

    mov cl, n_rows
    
    row_loop_1:
        mov bl, cl
        mov cl, n_cols

        col_loop_1:
            call print_elem
            loop col_loop_1
        
        call new_line

        mov cl, bl
        loop row_loop_1
    ret


print_elem:
    ; const
    ; prints element
    ; bl - row
    ; cl - col

    push bx
    push cx

    call reverse_indexes
    call calc_element_offset ; sets si

    mov ah, 2
    mov dl, mat[si]
    int 21h

    mov dl, ' '
    int 21h

    pop cx
    pop bx

    ret

process_mat:
    call find_columns_with_numbers
    call replace_columns_with_numbers
    ret 

find_columns_with_numbers:
    mov cl, n_rows
    row_loop_2:
        mov bl, cl
        mov cl, n_cols

        col_loop_2:
            call check_if_number
            loop col_loop_2

        mov cl, bl
        loop row_loop_2
    ret

check_if_number:
    ; const
    ; prints element
    ; bl - row
    ; cl - col

    push bx
    push cx

    call reverse_indexes
    call calc_element_offset ; sets si

    mov dl, mat[si]
    call is_number

    cmp ah, 0
    je end_check

    ; else
    mov ch, 0
    mov si, cx
    mov replace_flag[si], 1

    end_check:
        pop cx
        pop bx

    ret

is_number:
    ; in: dl = char to check
    ; out: ah = 1 if dl is number else ah = 0
    
    cmp dl, '0'
    jl ret_0
    cmp dl, '9'
    jg ret_0

    jmp ret_1

    ret_1:
        mov ah, 1
        ret
    ret_0:
        mov ah, 0
        ret

replace_columns_with_numbers:
    mov ch, 0
    mov cl, n_cols

    col_loop_3:
        mov al, n_cols
        mov ah, 0
        mov si, ax
        sub si, cx

        cmp replace_flag[si], 1
        je call_fill_column_with_hashes
        jmp skip_column

        call_fill_column_with_hashes:
            call fill_column_with_hashes
        
        skip_column:
            loop col_loop_3

    mov cl, bl
    ret

fill_column_with_hashes:
    ; cl - column index
    push cx
    push bx

    mov bl, cl
    mov cl, n_rows
    row_loop_4:
        xchg bl, cl
        call set_elem_to_hash
        xchg bl, cl
        loop row_loop_4

    pop bx
    pop cx

    ret

set_elem_to_hash:
    ; const
    ; prints element
    ; bl - row
    ; cl - col

    push bx
    push cx

    call reverse_indexes
    call calc_element_offset ; sets si

    mov mat[si], '#'

    pop cx
    pop bx

    ret

CSEG ENDS
END main
