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
[0-9]+ { yylval = atoi(yytext); return NUM; }
\n { return EOL; }
[ \t] { }
. { printf("UNKNOWN character %s\n", yytext); }
%%

/*int main(int argc, char** argv)
{
  int tok;
  while(tok = yylex()) {
    printf("%d", tok);
    if(tok == NUM)
      printf(" = %d\n", yylval);
    else
      printf("\n");
  }
}
*/
