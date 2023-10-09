%{
#include "A4_47.tab.h"
extern void yyerror(const char *);
int line_count = 1;
%}
/* Define regular expressions for each token type */
identifier                     [a-zA-Z][a-zA-Z0-9]*
int_constant                   [-+]?([1-9][0-9]*|[0-9])
char_constant                  '([^\n'\\]|\\[\\'"?abfnrtv])*'
string_constant                \"([^\n'\\]|\\[\\'"?abfnrtv])*\"
white_space          [ \t\r\f\v]+

newline              \n

invalid_token        .

%x multiline_comment_body
%x singleline_comment_body
%%

"void"                         { return VOID; }
"int"                          { return INT; }
"char"                         { return CHAR; }
"if"		                   { return IF; }
"else"                         { return ELSE; }
"for"                          { return FOR; }
"return"                       { return RETURN; }

{identifier}                   { return IDENTIFIER;}
{char_constant}                { return CHAR_CONSTANT;}
{int_constant}                 { return INT_CONSTANT;}
{string_constant}              { return STRING; }

"->"			               { return POINTER; }
"<="			               { return LESSTHANEQUAL; }
">="			               { return GREATERTHANEQUAL; }
"=="			               { return EQUALEQUAL; }
"!="			               { return NOTEQUAL; }
"&&"			               { return AND; }
"||"			               { return OR; }
"["                            { return '['; }
"]"                            { return ']'; }
"("                            { return '('; }
")"                            { return ')'; }
"{"                            { return '{'; }
"}"                            { return '}'; }
"+"                            { return '+'; }
"-"                            { return '-'; }
"*"                            { return '*'; }
"/"                            { return '/'; }
"%"                            { return '%'; }
"="                            { return '='; }
";"                            { return ';'; }
","                            { return ','; }
"<"                            { return '<'; }
">"                            { return '>'; }
"&"                            { return '&'; }
"!"                            { return '!'; }
"?"                           { return '?'; }
":"                           { return ':'; }

"/*"                            { BEGIN(multiline_comment_body); }
<multiline_comment_body>"*/"   { BEGIN(INITIAL); }
<multiline_comment_body>.      { }
<multiline_comment_body>"\n"   { line_count++; printf("\n At line number .....%d ......\n\n", line_count); }

"//"                            { BEGIN(singleline_comment_body); }
<singleline_comment_body>"\n"  { BEGIN(INITIAL); line_count++; printf("\n At line number .....%d ......\n\n", line_count); }
<singleline_comment_body>.     { }

{white_space}                    { }
{newline}                       { line_count++; printf("\n At line number .....%d ......\n\n", line_count); }
{invalid_token}                  { printf("ERROR [Line %d] : Invalid token %s\n", line_count, yytext); return INVALID_TOKEN; }

%%