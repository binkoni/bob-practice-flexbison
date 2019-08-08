%{
#include "calc.h"
#include "calc.tab.h"
%}

%option noyywrap
EXP ([Ee][-+]?[0-9]+)
%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
"(" { return OP; }
")" { return CP; }

[0-9]+"."[0-9]*{EXP}? |
"."?[0-9]+{EXP}? { yylval = atoi(yytext); return NUM; }
\n { return EOL; }
[ \t]
"//".*
. { printf("UNKNOWN character %s\n", yytext); }
%%

