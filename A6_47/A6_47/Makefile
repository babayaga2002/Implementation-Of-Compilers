INPUT_DIR:= input
QUAD_DIR := quads
EXEC_DIR:= exec
.PHONY: test

nanoC: y.tab.o lex.yy.o A6_47_translator.o A6_47_converter.o 
	@g++ -no-pie -g A6_47_translator.o A6_47_converter.o lex.yy.o y.tab.o -lfl -o nanoC

lex.yy.c: A6_47.l
	@flex A6_47.l

y.tab.c: A6_47.y
	@yacc -dtv A6_47.y

A6_47_converter.o: A6_47_converter.cpp
	@g++ -no-pie -g -c A6_47_converter.cpp

A6_47_translator.o: A6_47_translator.cpp
	@g++ -no-pie -g -c A6_47_translator.cpp

lex.yy.o: lex.yy.c
	@g++ -no-pie -g -c lex.yy.c

y.tab.o:    y.tab.c
	@g++ -no-pie -g -DYYDEBUG -c y.tab.c

libmyl.a: myl.o
	@ar -rcs libmyl.a myl.o

ass2_16CS10053.o: myl.c myl.h
	@g++ -no-pie -Wall  -c myl.c

clean:
	@rm *.s \
	lex.yy.c y.tab.h y.output y.tab.c lex.yy.o y.tab.o \
	*.o libmyl.a \
	*.out nanoC \
	test1 test2 test3 test4 test5

test1: A6_47_test1.o libmyl.a
	@gcc -no-pie -g A6_47_test1.o -o test1 -L. -lmyl

A6_47_test1.o: A6_47_test1.s myl.h
	@gcc -no-pie -g -Wall  -c A6_47_test1.s -o A6_47_test1.o

test2: A6_47_test2.o libmyl.a
	@gcc -no-pie -g  A6_47_test2.o -o test2 -L. -lmyl
A6_47_test2.o: A6_47_test2.s myl.h
	@gcc -no-pie -g -Wall -c A6_47_test2.s

test3: A6_47_test3.o libmyl.a
	@gcc -no-pie -g  A6_47_test3.o -o test3 -L. -lmyl
A6_47_test3.o: A6_47_test3.s myl.h
	@gcc -no-pie -g -Wall  -c A6_47_test3.s

test4: A6_47_test4.o libmyl.a
	@gcc -no-pie -g  A6_47_test4.o -o test4 -L. -lmyl
A6_47_test4.o: A6_47_test4.s myl.h
	@gcc -no-pie -g -Wall  -c A6_47_test4.s

test5: A6_47_test5.o libmyl.a
	@gcc -no-pie -g  A6_47_test5.o -o test5 -L. -lmyl
A6_47_test5.o: A6_47_test5.s myl.h
	@gcc -no-pie -g -Wall -c A6_47_test5.s

#output: output.o
output: output.o libmyl.a
	@gcc -no-pie -g  output.o -o output -L. -lmyl
output.o: output.s myl.h
	@gcc -no-pie -g -Wall -c output.s

run: 
	mkdir -p A6_47
	@echo 1 rn
	@./nanoC < ./input/test1.nc > ./A6_47/quad1.out
	
	@mv output.s A6_47_test1.s
	
	@make test1
	@echo 2 rn
	@./nanoC < ./input/test2.nc > ./A6_47/quad2.out

	@mv output.s A6_47_test2.s
	
	@make test2
	@echo 3 rn
	@./nanoC < ./input/test3.nc > ./A6_47/quad3.out

	@mv output.s A6_47_test3.s

	@make test3
	@echo 4 rn
	@./nanoC < ./input/test4.nc > ./A6_47/quad4.out
	
	@mv output.s A6_47_test4.s

	@make test4
	@echo 5 rn
	@./nanoC < ./input/test5.nc > ./A6_47/quad5.out
	
	@mv output.s A6_47_test5.s

	@make test5
