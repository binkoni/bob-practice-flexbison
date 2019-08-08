%{
#include <stdio.h>
int yylex();
int yyerror(char* s);
%}
%union {
  struct ast* a;
  double d;
}

%token <d> NUM
%token ADD SUB MUL DIV ABS EOL OP CP
%type <a> exp factor term

%%
calclist:
        | calclist EOL {
            printf("> ");
          }
        | calclist exp EOL {
            printf("= %4.4g\n", eval($2));
            treefree($2);
            printf("> ");
          }
        ;
exp: factor
   | exp ADD factor { $$ = newast('+', $1, $3); }
   | exp SUB factor { $$ = newast('-', $1, $3); }
   ;
factor: term
      | factor MUL term { $$ = newast('*', $1, $3); }
      | factor DIV term { $$ = newast('/', $1, $3); }
term: NUM { $$ = newnum($1); }
    | ABS term { $$ = newast('|', $2, NULL); }
    | OP exp CP { $$ = $2; }
    | '-' term { $$ = newast('M', $2, NULL); }
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
