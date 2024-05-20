%{
#include <stdio.h>
int word_count = 0;
int space_count = 0;
int line_count = 0;
int number_count = 0;
%}
%%
[a-zA-Z]+ { word_count++; }
[ \t] { space_count++; }
\n { ++line_count; }
[0-9]* { number_count++; }
. { /* ignore other characters */ }
%%
int main() {
 FILE *file = fopen("input.txt", "r");
 if (file == NULL) {
 perror("Error opening file");
 return 1;
 }
 yyin = file;
 yylex();
 yywrap();
 fclose(file);
 printf("Words: %d\nSpaces: %d\nLines: %d\nnumbers :%d\n",
word_count, space_count, line_count , number_count);
 return 0;
}
int yywrap()
{
return 1;
}
