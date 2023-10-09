SYS_EXIT  equ 1
SYS_WRITE equ 4
SYS_READ equ 3
STDIN     equ 0
STDOUT    equ 1
section	 .text
   global _start   
	
_start:           
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg1         
    mov edx, len1 
    int 0x80                

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, n
    sub ecx,'0'
    mov edx, 2          
    int 0x80
        
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg2         
    mov edx, len2 
    int 0x80

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, k
    sub ecx,'0'
    mov edx, 2          
    int 0x80
    
    cmp ecx,[n]
    jle l1
    mov ecx,[n]

l0:
    push ecx
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, var
    mov edx, 2          
    int 0x80
    sub ecx,'0'
    mov edx, [sum]
    add edx,ecx
    mov [sum],edx
    pop ecx
    loop l0
    jmp print_0

l1:
    push ecx
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, var
    mov edx, 2          
    int 0x80
    sub ecx,'0'
    mov edx, [sum]
    add edx,ecx
    mov [sum],edx
    pop ecx
    loop l1
    jmp print_1

print_0:
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg4        
    mov edx, len4 
    int 0x80
    jmp print_sum


print_1:
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg5         
    mov edx, len5 
    int 0x80 


print_sum:
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg3         
    mov edx, len3 
    int 0x80 
    
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, sum         
    mov edx, 2 
    int 0x80

    mov eax,SYS_EXIT    ;system call number (sys_exit)
    int 0x80            ;call kernel



section .bss
    n resd 4
    k resd 4
    sum resd 4
    var resd 4

section	 .data
msg1 db	'Enter the number n',0xA,0xD 	
len1 equ $ - msg1			

msg2 db 'Enter the number k', 0xA,0xD 
len2 equ $ - msg2 

msg3 db 'Sum Equals'
len3 equ $- msg3

msg4 db '0'
len4 equ $- msg4

msg5 db '1'
len5 equ $- msg3
