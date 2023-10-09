%{
#include <stdio.h>

// Tokens
#define keyword 1
#define identifier 2
#define integer_constant 3
#define char_constant 4
#define string_literal 5
#define punctuator 6
#define single_line_comment 7
#define multi_line_comment 8
#define white_space 9
#define newline 10
#define wrong_token 11

%}


keyword              "char"|"else"|"for"|"if"|"int"|"return"|"void"

non-digit            [a-zA-Z_]
digit                [0-9]
identifier           {non-digit}({non-digit}|{digit})*

sign                 [+-]
non_zero             [1-9]
zero                 0
integer_constant     {sign}?{non_zero}{digit}*|{zero}

c_char               [^'\\\n]
escape_sequence      \'|\"|\?|\\|\[abfnrtv]
char_constant        \'({c_char}|{escape_sequence})\'

s_char               [^"\\\n] 
s_char_sequence      {s_char}*  
string_literal       \"({s_char_sequence}|{escape_sequence})*\"

punctuator           "["|"]"|"("|")"|"{"|"}"|"->"|"&"|"*"|"+"|"-"|"/"|"%"|"!"|"?"|"<"|">"|"<="|">="|"=="|"!="|"&&"|"||"|"="|":"|";"|"|"|","

single_line_comment  \/\/.*           

multi_line_comment   \/\*([^*]|\*+[^*\/])*\*+\/

white_space          [ \t\r\f\v]+

newline              \n

wrong_token          .

%%

{keyword} { 
    return keyword; 
}
{identifier} { 
    return identifier; 
}
{integer_constant} { 
    return integer_constant; 
}
{char_constant} { 
    return char_constant; 
}
{string_literal} { 
    return string_literal; 
}
{punctuator} { 
    return punctuator; 
}
{single_line_comment} { 
    return single_line_comment; 
}
{multi_line_comment} { 
    return multi_line_comment; 
}
{white_space} ;   
{newline} ;
{wrong_token} {
    return wrong_token; 
}

%%

int yywrap() {
    return 1;
}