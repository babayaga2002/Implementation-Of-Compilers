all: a.out
	@echo "\n+++++++++++++++++++ Test 1 +++++++++++++++++++\n\n"
	./a.out < test1.nc > output1.txt

	@echo "\n+++++++++++++++++++ Test 2 +++++++++++++++++++\n\n"
	./a.out < test2.nc > output2.txt

	@echo "\n+++++++++++++++++++ Test 3 +++++++++++++++++++\n\n"
	./a.out < test3.nc > output3.txt

	@echo "\n+++++++++++++++++++ Test 4 +++++++++++++++++++\n\n"
	./a.out < test4.nc > output4.txt	

	@echo "\n+++++++++++++++++++ Test 5 +++++++++++++++++++\n\n"
	./a.out < test5.nc > output5.txt	
	
	@echo "\nAll Test Case Successfully Translated !!\n"


a.out: lex.yy.o A5_47.tab.o A5_47_translator.o
	g++ lex.yy.o A5_47.tab.o A5_47_translator.o

A5_47.tab.c: A5_47.y
	bison -dty A5_47.y 

lex.yy.c: A5_47.l A5_47.tab.h 
	flex A5_47.l

A5_47.tab.h: A5_47.y
	bison -d A5_47.y 

A5_47_translator.o:
	g++ -c A5_47_translator.cpp

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

A5_47.tab.o: A5_47.tab.c
	g++ -c A5_47.tab.c

clean:
	@rm -f a.out lex.yy.* *.o *.tab.* *.txt