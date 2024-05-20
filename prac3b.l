%{
#include "y.tab.h"  // This is required to include the token definitions
%}

%%

[0-9]+    { yylval = atoi(yytext); return NUMBER; }
[\t ]+    { /* ignore whitespace */ }
\n        { return NL; }
"+"       { return '+'; }
"-"       { return '-'; }
"*"       { return '*'; }
"/"       { return '/'; }
"("       { return '('; }
")"       { return ')'; }
.         { printf("Unexpected character: %s\n", yytext); exit(1); }

%%

int yywrap() {
    return 1;
}
