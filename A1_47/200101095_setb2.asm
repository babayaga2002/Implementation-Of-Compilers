default rel

global main: function

extern __stack_chk_fail                                 ; near
extern putchar                                          ; near
extern fclose                                           ; near
extern fgetc                                            ; near
extern fputc                                            ; near
extern puts                                             ; near
extern fopen                                            ; near
extern _GLOBAL_OFFSET_TABLE_                            ; byte


SECTION .text   align=1 execute                         ; section number 1, code

main:   ; Function begin
        endbr64                                         ; 0000 _ F3: 0F 1E. FA
        push    rbp                                     ; 0004 _ 55
        mov     rbp, rsp                                ; 0005 _ 48: 89. E5
        sub     rsp, 64                                 ; 0008 _ 48: 83. EC, 40
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 000C _ 64 48: 8B. 04 25, 00000028
        mov     qword [rbp-8H], rax                     ; 0015 _ 48: 89. 45, F8
        xor     eax, eax                                ; 0019 _ 31. C0
        mov     rax, qword 656C69665F77656EH            ; 001B _ 48: B8, 656C69665F77656E
        mov     qword [rbp-15H], rax                    ; 0025 _ 48: 89. 45, EB
        mov     dword [rbp-0DH], 1954051118             ; 0029 _ C7. 45, F3, 7478742E
        mov     byte [rbp-9H], 0                        ; 0030 _ C6. 45, F7, 00
        lea     rsi, [rel ?_012]                        ; 0034 _ 48: 8D. 35, 00000000(rel)
        lea     rdi, [rel ?_013]                        ; 003B _ 48: 8D. 3D, 00000000(rel)
        call    fopen                                   ; 0042 _ E8, 00000000(PLT r)
        mov     qword [rbp-30H], rax                    ; 0047 _ 48: 89. 45, D0
        cmp     qword [rbp-30H], 0                      ; 004B _ 48: 83. 7D, D0, 00
        jnz     ?_001                                   ; 0050 _ 75, 16
        lea     rdi, [rel ?_014]                        ; 0052 _ 48: 8D. 3D, 00000000(rel)
        call    puts                                    ; 0059 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 005E _ B8, 00000000
        jmp     ?_010                                   ; 0063 _ E9, 0000013F

?_001:  lea     rax, [rbp-15H]                          ; 0068 _ 48: 8D. 45, EB
        lea     rsi, [rel ?_015]                        ; 006C _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0073 _ 48: 89. C7
        call    fopen                                   ; 0076 _ E8, 00000000(PLT r)
        mov     qword [rbp-28H], rax                    ; 007B _ 48: 89. 45, D8
        cmp     qword [rbp-28H], 0                      ; 007F _ 48: 83. 7D, D8, 00
        jnz     ?_005                                   ; 0084 _ 75, 38
        lea     rdi, [rel ?_016]                        ; 0086 _ 48: 8D. 3D, 00000000(rel)
        call    puts                                    ; 008D _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0092 _ B8, 00000000
        jmp     ?_010                                   ; 0097 _ E9, 0000010B

?_002:  cmp     byte [rbp-31H], 31                      ; 009C _ 80. 7D, CF, 1F
        jle     ?_003                                   ; 00A0 _ 7E, 06
        cmp     byte [rbp-31H], 127                     ; 00A2 _ 80. 7D, CF, 7F
        jnz     ?_004                                   ; 00A6 _ 75, 04
?_003:  mov     byte [rbp-31H], 42                      ; 00A8 _ C6. 45, CF, 2A
?_004:  movsx   eax, byte [rbp-31H]                     ; 00AC _ 0F BE. 45, CF
        mov     rdx, qword [rbp-28H]                    ; 00B0 _ 48: 8B. 55, D8
        mov     rsi, rdx                                ; 00B4 _ 48: 89. D6
        mov     edi, eax                                ; 00B7 _ 89. C7
        call    fputc                                   ; 00B9 _ E8, 00000000(PLT r)
?_005:  mov     rax, qword [rbp-30H]                    ; 00BE _ 48: 8B. 45, D0
        mov     rdi, rax                                ; 00C2 _ 48: 89. C7
        call    fgetc                                   ; 00C5 _ E8, 00000000(PLT r)
        mov     byte [rbp-31H], al                      ; 00CA _ 88. 45, CF
        cmp     byte [rbp-31H], -1                      ; 00CD _ 80. 7D, CF, FF
        jnz     ?_002                                   ; 00D1 _ 75, C9
        mov     rax, qword [rbp-30H]                    ; 00D3 _ 48: 8B. 45, D0
        mov     rdi, rax                                ; 00D7 _ 48: 89. C7
        call    fclose                                  ; 00DA _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-28H]                    ; 00DF _ 48: 8B. 45, D8
        mov     rdi, rax                                ; 00E3 _ 48: 89. C7
        call    fclose                                  ; 00E6 _ E8, 00000000(PLT r)
        lea     rax, [rbp-15H]                          ; 00EB _ 48: 8D. 45, EB
        lea     rsi, [rel ?_012]                        ; 00EF _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 00F6 _ 48: 89. C7
        call    fopen                                   ; 00F9 _ E8, 00000000(PLT r)
        mov     qword [rbp-20H], rax                    ; 00FE _ 48: 89. 45, E0
        cmp     qword [rbp-20H], 0                      ; 0102 _ 48: 83. 7D, E0, 00
        jnz     ?_007                                   ; 0107 _ 75, 21
        lea     rdi, [rel ?_017]                        ; 0109 _ 48: 8D. 3D, 00000000(rel)
        call    puts                                    ; 0110 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0115 _ B8, 00000000
        jmp     ?_010                                   ; 011A _ E9, 00000088

?_006:  movsx   eax, byte [rbp-31H]                     ; 011F _ 0F BE. 45, CF
        mov     edi, eax                                ; 0123 _ 89. C7
        call    putchar                                 ; 0125 _ E8, 00000000(PLT r)
?_007:  mov     rax, qword [rbp-20H]                    ; 012A _ 48: 8B. 45, E0
        mov     rdi, rax                                ; 012E _ 48: 89. C7
        call    fgetc                                   ; 0131 _ E8, 00000000(PLT r)
        mov     byte [rbp-31H], al                      ; 0136 _ 88. 45, CF
        cmp     byte [rbp-31H], -1                      ; 0139 _ 80. 7D, CF, FF
        jnz     ?_006                                   ; 013D _ 75, E0
        mov     rax, qword [rbp-20H]                    ; 013F _ 48: 8B. 45, E0
        mov     rdi, rax                                ; 0143 _ 48: 89. C7
        call    fclose                                  ; 0146 _ E8, 00000000(PLT r)
        lea     rax, [rbp-15H]                          ; 014B _ 48: 8D. 45, EB
        lea     rsi, [rel ?_012]                        ; 014F _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0156 _ 48: 89. C7
        call    fopen                                   ; 0159 _ E8, 00000000(PLT r)
        mov     qword [rbp-20H], rax                    ; 015E _ 48: 89. 45, E0
        lea     rsi, [rel ?_015]                        ; 0162 _ 48: 8D. 35, 00000000(rel)
        lea     rdi, [rel ?_013]                        ; 0169 _ 48: 8D. 3D, 00000000(rel)
        call    fopen                                   ; 0170 _ E8, 00000000(PLT r)
        mov     qword [rbp-30H], rax                    ; 0175 _ 48: 89. 45, D0
        jmp     ?_009                                   ; 0179 _ EB, 12

?_008:  movsx   eax, byte [rbp-31H]                     ; 017B _ 0F BE. 45, CF
        mov     rdx, qword [rbp-30H]                    ; 017F _ 48: 8B. 55, D0
        mov     rsi, rdx                                ; 0183 _ 48: 89. D6
        mov     edi, eax                                ; 0186 _ 89. C7
        call    fputc                                   ; 0188 _ E8, 00000000(PLT r)
?_009:  mov     rax, qword [rbp-20H]                    ; 018D _ 48: 8B. 45, E0
        mov     rdi, rax                                ; 0191 _ 48: 89. C7
        call    fgetc                                   ; 0194 _ E8, 00000000(PLT r)
        mov     byte [rbp-31H], al                      ; 0199 _ 88. 45, CF
        cmp     byte [rbp-31H], -1                      ; 019C _ 80. 7D, CF, FF
        jnz     ?_008                                   ; 01A0 _ 75, D9
        mov     eax, 0                                  ; 01A2 _ B8, 00000000
?_010:  mov     rcx, qword [rbp-8H]                     ; 01A7 _ 48: 8B. 4D, F8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rcx, qword [fs:abs 28H]                 ; 01AB _ 64 48: 33. 0C 25, 00000028
        jz      ?_011                                   ; 01B4 _ 74, 05
        call    __stack_chk_fail                        ; 01B6 _ E8, 00000000(PLT r)
?_011:  leave                                           ; 01BB _ C9
        ret                                             ; 01BC _ C3
; main End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=8 noexecute                       ; section number 4, const

?_012:                                                  ; byte
        db 72H, 00H                                     ; 0000 _ r.

?_013:                                                  ; byte
        db 2EH, 2FH, 6FH, 72H, 69H, 67H, 69H, 6EH       ; 0002 _ ./origin
        db 61H, 6CH, 5FH, 66H, 69H, 6CH, 65H, 2EH       ; 000A _ al_file.
        db 74H, 78H, 74H, 00H                           ; 0012 _ txt.

?_014:                                                  ; byte
        db 45H, 72H, 72H, 6FH, 72H, 20H, 6FH, 70H       ; 0016 _ Error op
        db 65H, 6EH, 69H, 6EH, 67H, 20H, 66H, 69H       ; 001E _ ening fi
        db 6CH, 65H, 21H, 00H                           ; 0026 _ le!.

?_015:                                                  ; byte
        db 77H, 00H                                     ; 002A _ w.

?_016:                                                  ; byte
        db 45H, 72H, 72H, 6FH, 72H, 20H, 63H, 72H       ; 002C _ Error cr
        db 65H, 61H, 74H, 69H, 6EH, 67H, 20H, 6EH       ; 0034 _ eating n
        db 65H, 77H, 20H, 66H, 69H, 6CH, 65H, 21H       ; 003C _ ew file!
        db 00H, 00H, 00H, 00H                           ; 0044 _ ....

?_017:                                                  ; byte
        db 45H, 72H, 72H, 6FH, 72H, 20H, 6FH, 70H       ; 0048 _ Error op
        db 65H, 6EH, 69H, 6EH, 67H, 20H, 6EH, 65H       ; 0050 _ ening ne
        db 77H, 20H, 66H, 69H, 6CH, 65H, 20H, 66H       ; 0058 _ w file f
        db 6FH, 72H, 20H, 70H, 72H, 69H, 6EH, 74H       ; 0060 _ or print
        db 69H, 6EH, 67H, 21H, 00H                      ; 0068 _ ing!.


SECTION .note.gnu.property align=8 noexecute            ; section number 5, const

        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 0000 _ ........
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0008 _ ....GNU.
        db 02H, 00H, 00H, 0C0H, 04H, 00H, 00H, 00H      ; 0010 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........


