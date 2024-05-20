%{
 #include<stdio.h>
 int yylex(void);
 int yyerror(char *);
 
%}

%token A B   //tokens : the alphabets of language 'a' and 'b' 

%%
//production rules for grammar
expr: s B         
  ;
s : s A 
| A   

;

%%

int main()
{
 
 printf("Enter the string \n");
 yyparse(); 
printf("Valid string");


 return 0;
}

int yyerror(char *s)
{
 printf("Invalid: Not a part of the language - a^n b \n");
}
