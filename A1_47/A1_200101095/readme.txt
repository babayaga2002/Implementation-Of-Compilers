Running SetA code:

nasm -f elf64 A2A_200101095.asm && gcc -m64 -no-pie A2A_200101095.o -o hello && ./hello

Running SetB code:

nasm -f elf64 -g A3B_200101095.asm && gcc A3B_200101095.o -no-pie && ./a.out