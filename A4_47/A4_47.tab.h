/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     AND = 258,
     EQUALEQUAL = 259,
     OR = 260,
     LESSTHANEQUAL = 261,
     GREATERTHANEQUAL = 262,
     NOTEQUAL = 263,
     POINTER = 264,
     VOID = 265,
     CHAR = 266,
     INT = 267,
     IF = 268,
     ELSE = 269,
     FOR = 270,
     RETURN = 271,
     INT_CONSTANT = 272,
     CHAR_CONSTANT = 273,
     IDENTIFIER = 274,
     STRING = 275,
     INVALID_TOKEN = 276
   };
#endif
/* Tokens.  */
#define AND 258
#define EQUALEQUAL 259
#define OR 260
#define LESSTHANEQUAL 261
#define GREATERTHANEQUAL 262
#define NOTEQUAL 263
#define POINTER 264
#define VOID 265
#define CHAR 266
#define INT 267
#define IF 268
#define ELSE 269
#define FOR 270
#define RETURN 271
#define INT_CONSTANT 272
#define CHAR_CONSTANT 273
#define IDENTIFIER 274
#define STRING 275
#define INVALID_TOKEN 276




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 9 "A4_47.y"
{
	int intval;
}
/* Line 1529 of yacc.c.  */
#line 95 "A4_47.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

