%{ 
	#include <string.h>
	#include <stdio.h>
	extern int yylex();
	void yyerror(char *s);
	extern int line_count;
%}

%union {
	int intval;
}

// Punctuators and operators
%token AND EQUALEQUAL OR LESSTHANEQUAL GREATERTHANEQUAL
%token NOTEQUAL POINTER 

// Keywords
%token VOID CHAR INT
%token IF ELSE FOR RETURN

// Extras 
%token INT_CONSTANT CHAR_CONSTANT IDENTIFIER STRING
%start translation_unit

// Invalid tokens
%token INVALID_TOKEN

%%
// 1. Expressions
primary_expression : IDENTIFIER | CHAR_CONSTANT | INT_CONSTANT | STRING | '(' expression ')' { printf("PRIMARY_EXPRESSION . \n");};

postfix_expression : primary_expression | postfix_expression '[' expression ']' | postfix_expression '(' ')' | postfix_expression '(' argument_expression_list ')' | postfix_expression POINTER IDENTIFIER {printf("POSTFIX_EXPRESSION . \n");};

argument_expression_list : assignment_expression | argument_expression_list ',' assignment_expression {printf("ARGUMENT EXPRESSION LIST . \n");};

unary_expression : postfix_expression | unary_operator unary_expression {printf("UNARY EXPRESSION . \n");};

unary_operator: '&' | '*' | '+' | '-' | '.' {printf("UNARY OPERATOR . \n");};

multiplicative_expression : unary_expression | multiplicative_expression '*' unary_expression | multiplicative_expression '/' unary_expression | multiplicative_expression '%' unary_expression
{printf("MULTIPLICATIVE EXPRESSION . \n");};

additive_expression : multiplicative_expression | additive_expression '+' multiplicative_expression | additive_expression '-' multiplicative_expression {printf("ADDITIVE EXPRESSION . \n");};

relational_expression : additive_expression | relational_expression '<' additive_expression | relational_expression '>' additive_expression | relational_expression LESSTHANEQUAL additive_expression | relational_expression GREATERTHANEQUAL additive_expression {printf("RELATIONAL EXPRESSION . \n");};

equality_expression : relational_expression | equality_expression EQUALEQUAL relational_expression | equality_expression NOTEQUAL relational_expression {printf("EQUALITY EXPRESSION . \n");};

logical_AND_expression : equality_expression | logical_AND_expression AND equality_expression {printf("LOGICAL AND EXPRESSION . \n");};

logical_OR_expression : logical_AND_expression | logical_OR_expression OR logical_AND_expression {printf("LOGICAL OR EXPRESSION  . \n");};

conditional_expression : logical_OR_expression | logical_OR_expression '?' expression ':' conditional_expression {printf("CONDITIONAL EXPRESSION . \n");};

assignment_expression : conditional_expression | unary_expression '=' assignment_expression {printf("ASSIGNMENT EXPRESSION . \n");};

expression : assignment_expression {printf("EXPRESSION . \n");};

// 2. Declarations
declaration : type_specifier init_declarator ';' {printf("DECLARATION . \n");};

init_declarator : declarator | declarator '=' initializer {printf("INIT DECLARATOR . \n");};

type_specifier : VOID | CHAR | INT {printf("TYPE SPECIFIER . \n");};

declarator : pointer direct_declarator | direct_declarator {printf("DECLARATOR . \n");};

pointer: '*' | '*' pointer {printf("POINTER . \n");};

direct_declarator : IDENTIFIER | IDENTIFIER '[' ']' | IDENTIFIER '[' INT_CONSTANT ']' | IDENTIFIER '(' ')' | IDENTIFIER '(' parameter_list ')' {printf("DIRECT DECLARATOR . \n");};

parameter_list : parameter_declaration | parameter_list ',' parameter_declaration {printf("PARAMETER LIST . \n");};

parameter_declaration : type_specifier pointer declarator | type_specifier declarator | type_specifier pointer | type_specifier {printf("PARAMETER DECLARATION . \n");};

initializer : assignment_expression {printf("INITIALIZER . \n");};

// 3. Statements
statement : compound_statement | expression_statement | selection_statement | iteration_statement | jump_statement {printf("STATEMENT . \n");};

compound_statement : '{' '}' | '{' block_item_list '}' {printf("COMPOUND STATEMENT . \n");};

block_item_list : block_item | block_item_list block_item {printf("BLOCK ITEM LIST . \n");};

block_item : declaration | statement {printf("BLOCK ITEM . \n");};

expression_statement : ';' | expression ';' {printf("EXPRESSION STATEMENT . \n");};

selection_statement : IF '(' expression ')' statement | IF '(' expression ')' statement ELSE statement {printf("SELECTION STATEMENT . \n");};

expression_opt: expression | {printf("EXPRESSION OPT . \n");};

iteration_statement : FOR '(' expression_opt ';' expression_opt ';' expression_opt ')' statement {printf("ITERATION STATEMENT . \n");};

jump_statement : RETURN ';' | RETURN expression ';' {printf("JUMP STATEMENT . \n");};

// 4. Translation unit
translation_unit : external_declaration | translation_unit external_declaration {printf("TRANSLATION UNIT . \n");};

external_declaration : function_definition | declaration {printf("EXTERNAL DECLARATION . \n");};

function_definition : type_specifier declarator declaration_list compound_statement | type_specifier declarator compound_statement  {printf("FUNCTION DEFINITION . \n");};

declaration_list : declaration | declaration_list declaration {printf("DECLARATION LIST  . \n");};

%%

void yyerror(char *s) {
	printf ("ERROR IS : %s",s);
}