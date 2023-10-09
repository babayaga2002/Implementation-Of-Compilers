global main
extern printf, scanf

section .data
    file db "file.txt",0 ; name of the file
    buffer dd 1 ; buffer to read the file
;     arr TIMES 256 db 0
    newline db 0xA,0xD,0
    num db 0
    temp_a dd 32
    temp_b dd 127

    format:db "%c",0
    format3: db "value:%d", 10, 0

section .bss
    fd resb 4 ; file descriptor
    n resb 4 ; number of bytes read


section .text

main:
    ; open the file for reading
    mov eax, 5
    mov ebx, file
    mov ecx, 0
    int 0x80

    mov [fd], eax

    ; read the file character by character
    read_loop:
        mov eax, 3
        mov ebx, [fd]
        mov ecx, buffer
        mov edx, 1
        int 0x80

        mov [n], eax

        ; check if read was successful
        cmp eax, 0
        je end_loop
        ; changing if non-printable
        cmp byte[buffer],' '
        jl change
        ; cmp byte[buffer], 127
        ; je change
        jmp no_change
change:
        mov byte[buffer],dword('*')
no_change:
        ; print the character
        mov eax, 4
        mov ebx, 1
        mov ecx, buffer
        mov edx, 1
        int 0x80

        mov ecx,[num]
        inc ecx
        mov [num],ecx

        jmp read_loop
    end_loop:

    ; close the file
    mov eax, 6
    mov ebx, [fd]
    int 0x80



    ; exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80