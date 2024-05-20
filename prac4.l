%{
 #include "y.tab.h"
 extern int yylval;
%}
A [a]
B [b]
%%

{A} {yylval=yytext[0];return A;}
{B} {yylval=yytext[1];return B;}
\n {return 0;}
. {return yytext[0];}

%%
int yywrap()  
 {  
  return 1;  
}


