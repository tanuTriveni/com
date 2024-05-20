%{
#include<stdio.h>
#include<stdlib.h>

extern int yylex();
extern int yyerror(char *);

int yyparse();

%}

%token NUMBER NL
%left '+' '-'
%left '*' '/'

%%
stmt: exp NL {printf("VALUE= %d\n",$1); exit(0);}
;
exp: exp '+' exp {$$ = $1 + $3 ;} | 
     exp '-' exp {$$ = $1 - $3 ; } | 
     exp '*' exp {$$ = $1 * $3 ;}| 
     exp '/' exp { if ($3 == 0) {printf("cannot divide by 0\n"); exit(0);} else {$$ = $1 / $3 ;}} |
     '(' exp ')' { $$ = $2 ; } |
      NUMBER { $$ = $1 ; }
;

%%

int yyerror(char *msg)
{
 printf("Invalid expression\n");
 exit(0);
}

int main()
{
 printf("enter the expression: \n");
 yyparse();
 return 0;
}
