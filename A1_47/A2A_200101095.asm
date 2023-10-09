section .data
        msg1    db        "Enter n" , 10, 0
        msg2    db        "Enter k" , 10, 0
        msg4    db        "Enter the array",10,0
        msg3    db        10,”k is less than n, 10, 0
        intFormat     db        "%d", 0
        ansFormat     db        10,"%d",10,0
        array times 1000 dd 0

section .bss
        var1     resd      1
        var2     resd      1

global main
extern scanf
default rel


%macro scan 1
        lea rdi, [intFormat]
        lea rsi, %1
        xor rax, rax
        call scanf
%endmacro

section .text

main:

        scan [var1]
        scan [var2]
        xor r14,r14


loop:
        scan [array+r14d*4]
        inc r14d
        cmp r14d, [var1]
        jne loop

        mov eax, [var1]
        cmp eax, [var2]
        jl lesser
        xor r14, r14
        xor r13, r13

sum:
        add r13, [array+r14d*4]
        inc r14d
        cmp r14d, [var2]
        jne sum
	
        lea rdi, [ansFormat]
        mov esi, r13d
        xor rax, rax
        call printf
        jmp end

lesser:
        print [msg3]
end:
        mov rax, 0
        ret