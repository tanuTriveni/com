%{
#include<stdio.h>
int v=0, op=0, id=0;
%}
%%
[a-zA-Z]+[0-9A-Za-z]* { id++; }
[0-9]+ { id++; }
[\+\-\*/\=] { op++; }
"(" { v++; }
")" { v--; }
";" { /* Do nothing, used as delimiter */ }
.|\n { /* Ignore other characters */ }
%%
int yywrap() {
    return 1;
}

int main() {
    printf("Enter the expression:\n");
    yylex();
    if ((op + 1) == id && v == 0) {
        printf("\nExpression is Valid\n");
        printf("Number of identifiers = %d \nNumber of operators = %d \n", id, op);
    } else {
        printf("\nExpression is Invalid\n");
    }
    return 0;
}
