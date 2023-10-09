#include <stdio.h>

extern char* yytext;
extern int yyparse();
extern FILE* yyin;

int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yyparse();
    return 0;
}