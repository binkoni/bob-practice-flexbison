%{
#include <stdio.h>
int yylex();
int yyerror(char* s);
%}
%token NUM ADD SUB MUL DIV ABS EOL
%%
calclist:
        | calclist exp EOL { printf("= %d\n", $2); }
        ;
exp: factor
   | exp ADD factor { $$ = $1 + $3; }
   | exp SUB factor { $$ = $1 - $3; }
   ;
factor: term
      | factor MUL term { $$ = $1 * $3; }
      | factor DIV term { $$ = $1 / $3; }
term: NUM
    | ABS term { $$ = $2 >= 0 ? $2 : - $2; }
    ;

%%
int main(int argc, char** argv)
{
  yyparse();
  return 0;
}
int yyerror(char* s)
{
  fprintf(stderr, "error: %s\n", s);
}