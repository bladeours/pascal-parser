/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    DIGIT = 258,
    NUMBER = 259,
    WORD = 260,
    SEMICOLON = 261,
    COLON = 262,
    COMMA = 263,
    DOT = 264,
    PLUS = 265,
    MINUS = 266,
    ASTERISK = 267,
    SLASH = 268,
    EQUALS = 269,
    REL_OPERATOR = 270,
    APOSTROPHE = 271,
    ASSIGNMENT = 272,
    PROGRAM_NAME = 273,
    OPEN_BRACKET = 274,
    CLOSE_BRACKET = 275,
    STRING = 276,
    STOP = 277,
    USES = 278,
    VAR = 279,
    REAL = 280,
    STRING_TYPE = 281,
    INTEGER = 282,
    BOOLEAN = 283,
    FUNCTION = 284,
    PROCEDURE = 285,
    IF = 286,
    THEN = 287,
    DO = 288,
    ELSE = 289,
    BEGIN_ = 290,
    END = 291,
    REPEAT = 292,
    UNTIL = 293,
    WHILE = 294,
    OR = 295,
    AND = 296,
    CONTINUE = 297,
    BREAK = 298,
    REAL_NUMBER = 299,
    TRUE = 300,
    FALSE = 301
  };
#endif
/* Tokens.  */
#define DIGIT 258
#define NUMBER 259
#define WORD 260
#define SEMICOLON 261
#define COLON 262
#define COMMA 263
#define DOT 264
#define PLUS 265
#define MINUS 266
#define ASTERISK 267
#define SLASH 268
#define EQUALS 269
#define REL_OPERATOR 270
#define APOSTROPHE 271
#define ASSIGNMENT 272
#define PROGRAM_NAME 273
#define OPEN_BRACKET 274
#define CLOSE_BRACKET 275
#define STRING 276
#define STOP 277
#define USES 278
#define VAR 279
#define REAL 280
#define STRING_TYPE 281
#define INTEGER 282
#define BOOLEAN 283
#define FUNCTION 284
#define PROCEDURE 285
#define IF 286
#define THEN 287
#define DO 288
#define ELSE 289
#define BEGIN_ 290
#define END 291
#define REPEAT 292
#define UNTIL 293
#define WHILE 294
#define OR 295
#define AND 296
#define CONTINUE 297
#define BREAK 298
#define REAL_NUMBER 299
#define TRUE 300
#define FALSE 301

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
