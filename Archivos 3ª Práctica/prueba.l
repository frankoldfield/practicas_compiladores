%option yylineno
%start PR
%%
\n                              BEGIN PR;
<PR>compiladores                {printf("Reconocida en línea %d\n" ,yylineno);BEGIN 0;}
.                               BEGIN 0;
%%