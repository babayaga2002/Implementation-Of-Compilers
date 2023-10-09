all: convert_lex_to_c compile_c execute

convert_lex_to_c:
	@flex A3_47.l

compile_c:
	@gcc A3_47.c

execute:
	@./a.out < A3_47.nc

clean_all_files:
	@rm lex.yy.c a.out output.txt