%{
#include "y.tab.h"
%}

%%
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n { return NL; }
[ \t]+ ; /* Ignore whitespace */
"+" { return '+'; }
"-" { return '-'; }
"*" { return '*'; }
"/" { return '/'; }
"(" { return '('; }
")" { return ')'; }
. { printf("Unexpected character: %s\n", yytext); exit(1); }
%%

int yywrap() {
    return 1;
}
