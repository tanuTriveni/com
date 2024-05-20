%{
#include<stdio.h>
int sl=0;
int ml=0;
%}

%%
"/*"[a-zA-Z0-9' '\t\n]+"*/"  ml++;
"//".*  sl++;
%%

int yywrap()
{ 
return 1;
}

int main(){
yyin=fopen("in.txt","r");
yyout=fopen("ou.txt","w");
yylex();
fclose(yyin);
fclose(yyout);
return 0;
}
