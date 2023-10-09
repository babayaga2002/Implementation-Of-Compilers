all: run clean

run:
	@bison -d A4_47.y 1>/dev/null 2>/dev/null
	@echo "Parsing completed."
	@flex A4_47.l
	@echo "Lexing completed."
	@gcc lex.yy.c A4_47.tab.c A4_47.c -lfl
	@echo "Compilation completed."
	@./a.out < A4_47.nc > A4_47.txt
	@echo "Execution completed."
	@echo "Output file generated: A4_47.txt"

clean:
	@rm -f lex.yy.c A4_47.tab.c A4_47.tab.h a.out
	@echo "Cleaned."