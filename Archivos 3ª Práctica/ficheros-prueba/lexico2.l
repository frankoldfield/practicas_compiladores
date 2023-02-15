%{
#include "lexico1.h"
void error_id();
%}
digito              [0-9]
letra               [a-zA-Z]
entero              {digito}+
%x COM

%%
[ \n\t]+                                    ;
"//"(.*)[\n]                                ;
void                                        return VOID;
var                                         return VAR;
print                                       return PRINT;
if                                          return IF;
else                                        return ELSE;
while                                       return WHILE;
read                                        return READ;
({letra}|_)({letra}|_|{digito}){0,15}       return ID;
({letra}|_)({letra}|_|{digito}){16,}        return ERRORID;
"({digito}|{letra}|(\\"))"                  return STRING;
{entero}                                    return INTLITERAL;
"("                                         return LPAREN;		
")"                                         return RPAREN;
"{"                                         return LKEY;
"}"                                         return RKEY;
";"                                         return SEMICOLON;
","                                         return COMMA;
"+"                                         return PLUSOP;
"-"                                         return MINUSOP;
"*"                                         return PRODOP;
"="                                         return EQUAL;
"/*"                                        {BEGIN COM;yymore();}
<COM>"*"+"/"                                {BEGIN 0;printf("COMENTARIO:%s\n",yytext);}
<COM>[^*]*                                  yymore();
<COM>"*"+[^/*]*;                            yymore();
.                                           printf("Error en car�cter %s",yytext );
%%

void error_id()
{
    printf("\nERROR, LONGITUD DEL ID INCORRECTO: %s\n",yytext);
}