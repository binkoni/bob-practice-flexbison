%{
#include "calc.tab.h"
%}

%option noyywrap

%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
"(" { return OP; }
")" { return CP; }
[0-9]+ { yylval = atoi(yytext); return NUM; }
\n { return EOL; }
[ \t]
"//".*
. { printf("UNKNOWN character %s\n", yytext); }
%%

/*
3장 끝까지
*/
