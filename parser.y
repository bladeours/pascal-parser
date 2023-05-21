%{
  #include <stdio.h>
  #include <string.h>
  #define YYERROR_VERBOSE 1
  int yyerror(const char* s);
  extern int yylineno;
  extern FILE *yyin;
  int var = 0;
  int if_statement = 0;
  int while_statement = 0;
  int procedure = 0;
  int function = 0;
  int repeat_statement = 0;


%}

/* %option yylineno */
%token DIGIT NUMBER WORD SEMICOLON COLON COMMA DOT PLUS MINUS ASTERISK SLASH EQUALS REL_OPERATOR APOSTROPHE ASSIGNMENT PROGRAM_NAME OPEN_BRACKET CLOSE_BRACKET STRING
%token STOP USES VAR REAL STRING_TYPE INTEGER BOOLEAN FUNCTION PROCEDURE IF THEN DO ELSE BEGIN_ END REPEAT UNTIL WHILE OR AND CONTINUE BREAK REAL_NUMBER TRUE FALSE

%%


program :
     program_head SEMICOLON blocks main_block {return 0;}
    |
;

program_head :
    PROGRAM_NAME WORD
;

blocks: 
    uses_block blocks
  | var_block blocks 
  | function_block blocks {function++;}
  | procedure_block blocks{procedure++;}
  | 
;
/*---------------------------USES---------------------------*/
uses_block:
    USES uses_list
;

uses_list:
    library_name COMMA uses_list
  | library_name SEMICOLON
;

library_name: WORD
;
/*--------------------------/USES---------------------------*/

/*---------------------------VAR----------------------------*/
var_block:
    VAR var_list
;

var_block_body:
    VAR var_list_body body
;

var_list_body:
    var_declaration SEMICOLON var_list_body
  | var_declaration SEMICOLON
  | var_declaration SEMICOLON body

var_list:
    var_declaration SEMICOLON var_list
  | var_declaration SEMICOLON
;

var_declaration:
    var_name_list COLON type
;

var_name_list:
    WORD COMMA var_name_list {var++;}
  | WORD {var++;}
;

/*---------------------------/VAR----------------------------*/
function_block:
    FUNCTION WORD OPEN_BRACKET argument_list CLOSE_BRACKET COLON type SEMICOLON BEGIN_ body END SEMICOLON
;

argument_list:
    argument SEMICOLON argument_list
  | argument
  |
;

argument:
  argument_name COLON type
;

argument_name:
    WORD COMMA var_name_list
  | WORD
;

procedure_block:
    PROCEDURE WORD OPEN_BRACKET argument_list CLOSE_BRACKET SEMICOLON BEGIN_ body END SEMICOLON
;

one_line_body:
    function_call_statement
  | assigment_statement
;


body:
    assigment_statement SEMICOLON body
  | function_call_statement SEMICOLON body
  | if_statement body {if_statement++;}
  | while_statement body {while_statement++;}
  | repeat_statement body {repeat_statement++;}
  | var_block_body
  |
;

function_call_statement:
    WORD OPEN_BRACKET call_argument CLOSE_BRACKET
;
call_argument:
    WORD
  | WORD COMMA call_argument
  | STRING
  | STRING COMMA call_argument
  | all_number_types
  | all_number_types COMMA call_argument
  | exspression 
  | exspression COMMA call_argument
  | TRUE
  | TRUE COMMA
  | FALSE
  | FALSE COMMA
  | function_call_statement
  |
;

exspression:
    expression_side math_operator expression_side
  | expression_side relaltion_operator expression_side
;

expression_side:
    OPEN_BRACKET exspression CLOSE_BRACKET
  | all_number_types
  | WORD
  | TRUE
  |FALSE
;

if_statement:
    IF condition THEN one_line_body
  | IF condition THEN BEGIN_ body END SEMICOLON
  | IF condition THEN BEGIN_ body END ELSE BEGIN_ body END SEMICOLON
  | IF condition THEN one_line_body ELSE BEGIN_ body END SEMICOLON
  | IF condition THEN one_line_body ELSE one_line_body SEMICOLON
  | IF condition THEN BEGIN_ body END ELSE one_line_body SEMICOLON
;

condition:
    condition_side relaltion_operator condition_side
;

condition_side:
    OPEN_BRACKET condition CLOSE_BRACKET
  | OPEN_BRACKET exspression CLOSE_BRACKET
  | all_number_types
  | WORD
  | TRUE
  | FALSE
;

assigment_statement:
    WORD ASSIGNMENT can_be_variable
;

can_be_variable:
    DIGIT
  | NUMBER
  | REAL_NUMBER
  | WORD
  | STRING
  | TRUE
  | FALSE
  | exspression
  | condition
;

repeat_statement:
    REPEAT body UNTIL condition SEMICOLON;
;

while_statement:
    WHILE condition DO BEGIN_ body END SEMICOLON;
;

math_operator:
    PLUS
  | MINUS
  | ASTERISK
  | SLASH
;

relaltion_operator:
    EQUALS
  | REL_OPERATOR
;


all_number_types:
    NUMBER
  | DIGIT
  | REAL_NUMBER

type :
    INTEGER
  | STRING_TYPE
  | REAL
  | BOOLEAN
;

/*MAIN*/

main_block:
  BEGIN_ body END DOT
%%

int main(int argc, char* args[]) {
    if (argc == 2) {
      yyin = fopen(args[1], "r");
    }
    yyparse();
    printf("\ncode lines: %d\n", yylineno);
    printf("variable: %d\n", var);
    printf("if: %d\n", if_statement);
    printf("while: %d\n", while_statement);
    printf("repeat: %d\n", repeat_statement);
    printf("function: %d\n", function);
    printf("procedure: %d\n", procedure);

    return 0;
}

int yyerror(const char* s) {
    printf("linia: %d\nBlad: %s\n",yylineno, s);
}