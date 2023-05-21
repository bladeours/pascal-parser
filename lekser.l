%{
  #include <stdio.h>
  #include <stdlib.h>
  #include "y.tab.h"


  int ignore = 0;
  char *variables[1024];

%}
digit[-]?[0-9]
number [-]?[1-9]{digit}*
real_number [-]?([0-9]+(\.[0-9]*)?|\.[0-9]+)([eE][+-]?[0-9]+)?
variable [A-Za-z][A-Za-z0-9]*
semicolon ";"
colon ":"
comma ","
assignment ":="
dot "\."
open_bracket "\("
close_bracket "\)"
comment ({open_bracket}{asterisk_symbol}.*{asterisk_symbol}{close_bracket})|"{".*"}"
plus_symbol "+"
minus_symbol "-"
asterisk_symbol "*"
slash_symbol "/"
equal_symbol "="
not_equal_symbol "<>"
less_equal_symbol "<="
more_equal_symbol ">="
less_symbol "<"
more_symbol ">"
apostrophe "'"
string \'([^\'\n\r])*\'|\"([^\"\n\r])*\"


%option yylineno
%option caseless

%%

{digit}               {return DIGIT;}
{number}              {return NUMBER;}
{real_number}         {return REAL_NUMBER;}
{string}              {return STRING;}
{semicolon}           {return SEMICOLON;}
{colon}               {return COLON;}
{comma}               {return COMMA;}
{dot}                 {return DOT;}
{open_bracket}        {return OPEN_BRACKET;}
{close_bracket}        {return CLOSE_BRACKET;}

{plus_symbol}         {return PLUS;}
{minus_symbol}        {return MINUS;}
{asterisk_symbol}     {return ASTERISK;}
{slash_symbol}        {return SLASH;}
{equal_symbol}        {return EQUALS;}
{not_equal_symbol}    {return REL_OPERATOR;}
{less_equal_symbol}   {return REL_OPERATOR;}
{more_equal_symbol}   {return REL_OPERATOR;}
{less_symbol}         {return REL_OPERATOR;}
{more_symbol}         {return REL_OPERATOR;}
{apostrophe}          {return APOSTROPHE;}
{assignment}          {return ASSIGNMENT;}
\n                    {}
[ \t]                 {}

program               {return PROGRAM_NAME;}
stop                  {return STOP;}
uses                  {return USES;}
var                   {return VAR;}
Real                  {return REAL;}
String                {return STRING_TYPE;}
Integer               {return INTEGER;}
Boolean               {return BOOLEAN;}
function              {return FUNCTION;}
procedure             {return PROCEDURE;}
if                    {return IF;}
then                  {return THEN;}
do                    {return DO;}
else                  {return ELSE;}
begin                 {return BEGIN_;}
end                   {return END;}
repeat                {return REPEAT;}
until                 {return UNTIL;}
while                 {return WHILE;}
or                    {return OR;}
and                   {return AND;}
continue              {return CONTINUE;}
break                 {return BREAK;}
True                  {return TRUE;}
False                 {return FALSE;}

{variable}            {return WORD;}
{comment}             {}


%%

