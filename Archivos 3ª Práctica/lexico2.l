%{
#include "lexico1.h"
%}
digito              [0-9]
letra               [a-zA-Z]
entero              {digito}+
%x COM

%%
[ \n\t]+                                    ;
"//"(.*)[\n]                                ;
main                                        return MAIN;
printf                                      return PRINT;
({letra}|\$|_)({letra}|{digito}|_|\$)*      return ID;
{entero}                                    return INTLITERAL;
"("                                         return LPAREN;		
")"                                         return RPAREN;
";"                                         return SEMICOLON;
","                                         return COMMA;
":="                                        return ASSIGNOP;
"+"                                         return PLUSOP;
"-"                                         return MINUSOP;
"/*"                                        {BEGIN COM;yymore();}
<COM>"*"+"/"                                {BEGIN 0;printf("COMENTARIO:%s\n",yytext);}
<COM>[^*]*                                  yymore();
<COM>"*"+[^/*]*;                            yymore();
.                                           printf("Error en car�cter %s",yytext );
%%