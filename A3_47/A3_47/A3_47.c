#include "lex.yy.c"

int main()
{
    FILE *fp = fopen("output.txt", "w+");

    int token;
    while ((token = yylex()))
    {
        if (token == keyword)
        {
            fprintf(fp, "keyword: %s\n", yytext);
        }
        else if (token == identifier)
        {
            fprintf(fp, "identifier: %s\n", yytext);
        }
        else if (token == integer_constant)
        {
            fprintf(fp, "constant: integer_constant: %s\n", yytext);
        }
        else if (token == char_constant)
        {
            fprintf(fp, "constant: char_constant: %s\n", yytext);
        }
        else if (token == string_literal)
        {
            fprintf(fp, "string_literal: %s\n", yytext);
        }
        else if (token == punctuator)
        {
            fprintf(fp, "punctuator: %s\n", yytext);
        }
        else if (token == single_line_comment)
        {
            fprintf(fp, "single_line_comment: %s\n", yytext);
        }
        else if (token == multi_line_comment)
        {
            fprintf(fp, "multi_line_comment: %s\n", yytext);
        }
        else if (token == wrong_token)
        {
            fprintf(fp, "Error: Wrong Token: %s\n", yytext);
        }
    }
    fclose(fp);
    return 0;
}