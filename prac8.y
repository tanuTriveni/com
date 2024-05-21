%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
void ThreeAddressCode();
char AddToTable(char ,char, char);
int ind=0;//count number of lines
char temp = '1';//for t1,t2,t3.....
struct incod
{
char opd1;
char opd2;
char opr;
};
%}
%union
{
char sym;
}
%token <sym> LETTER NUMBER
%type <sym> expr
%left '+'
%left '*''/'
%left '-'
%%
statement: LETTER '=' expr ';' {AddToTable((char)$1,(char)$3,'=');}
| expr ';'
;
expr:
expr '+' expr {$$ = AddToTable((char)$1,(char)$3,'+');}
| expr '-' expr {$$ = AddToTable((char)$1,(char)$3,'-');}
| expr '*' expr {$$ = AddToTable((char)$1,(char)$3,'*');}
| expr '/' expr {$$ = AddToTable((char)$1,(char)$3,'/');}
| '(' expr ')' {$$ = (char)$2;}
| NUMBER {$$ = (char)$1;}
| LETTER {$$ = (char)$1;}
|'-' expr {$$ = AddToTable((char)$2,(char)'\t','-');}
;
%%
int yyerror(char *s)
{
return 1;
}
struct incod code[20];
char AddToTable(char opd1,char opd2,char opr)
{
code[ind].opd1=opd1;
code[ind].opd2=opd2;
code[ind].opr=opr;
ind++;
return temp++;
}
void ThreeAddressCode()
{
int cnt = 0;
char temp = '1';
printf("\n\n\t THREE ADDRESS CODE\n\n");
while(cnt<ind)
{
 if(code[cnt].opr != '=')
 printf("t%c = ",temp++);
 if(isalpha(code[cnt].opd1))
 printf("%c ",code[cnt].opd1);
 else if(code[cnt].opd1 >='1' && code[cnt].opd1 <='9')
 printf("t%c ",code[cnt].opd1);
 printf("%c ",code[cnt].opr);
 if(isalpha(code[cnt].opd2))
 printf("%c\n",code[cnt].opd2);
 else if(code[cnt].opd2 >='1' && code[cnt].opd2 <='9')
 printf("t%c\n",code[cnt].opd2);
 cnt++;
}
}
void main()
{
printf("\n Enter the Expression : ");
yyparse();
ThreeAddressCode();
}
