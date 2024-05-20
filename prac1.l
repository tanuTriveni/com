%{
#include <stdio.h>
%}
%%
[a-z] { printf("%c", 'A' + yytext[0] - 'a'); }
[A-Z] { printf("%c", 'a' + yytext[0] - 'A'); }
. { printf("%c", yytext[0]); }
%%
int main(void) {
 yylex();
 yywrap();
 return 0;
}
int yywrap(){
return 1;}
