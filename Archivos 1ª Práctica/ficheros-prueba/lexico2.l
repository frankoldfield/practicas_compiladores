%{
#include "lexico1.h"
%}
digito              [0-9]
letra               [a-zA-Z]
entero              {digito}+

%%
[ \n\t]+                                    ;
"//"(.*)[\n]                                ;
read                                        return READ;
main                                        return MAIN;
print                                       return PRINT;
[_$]($|{digito}|_)*                         return ID;
{entero}                                    return INTLITERAL;
"("                                         return LPAREN;		
")"                                         return RPAREN;
";"                                         return SEMICOLON;
","                                         return COMMA;
"+"                                         return PLUSOP;
"-"                                         return MINUSOP;
"="                                         return EQUAL;
"{"                                         return LKEY;
"}"                                         return RKEY;
.                                           printf("Error en car�cter %s",yytext );
%%