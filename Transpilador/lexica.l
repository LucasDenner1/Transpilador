%{
#include <string.h>
#include "sintatica.tab.h"
void yyerror(const char* erro);
%}

%option noyywrap
LETRA [A-Za-z]
PALAVRAS {LETRA}+
DIGITO [0-9]
NUMEROS {DIGITO}+
ESPACO [ ]
IDENTACAO {ESPACO}{ESPACO}
STRING \"[^"]*\"
ESPACOEMBRANCO {ESPACO}
%%
"+" { return MAIS; }
"-" { return MENOS; }
"*" { return VEZES; }
"/" { return DIVIDIDO; }
"=" { return RECEBE; }
">" { return MAIORQUE; }
"<" { return MENORQUE; }
"==" { return IGUALIGUAl; }
">=" { return MAIORIGUAL; }
"<=" { return MENORIGUAL; }
":" { return DOISPONTOS; }
"if" { return IF; } 
"else" { return ELSE; }
"(" { return ABREP; }
")" { return FECHAP; }
"and" { return E; }
"or" { return OU; }
"while" { return WHILE; }
"for" { return FOR; }
"def" { return DEF; }
"return" { return RETURN; }
"," { return VIRGULA; }
"break" { return BREAK; }
"in" { return IN; }
"range" { return RANGE; }
{PALAVRAS} { yylval.str = strdup(yytext); return VARIAVEIS; }
{NUMEROS} { yylval.str = strdup(yytext); return NUMEROS; }
{STRING} { yylval.str = strdup(yytext); return STRING; }
{IDENTACAO} { yylval.str = strdup(yytext); return IDENTACAO; }
{ESPACOEMBRANCO} { yylval.str = strdup(yytext); return ESPACO; }
. { printf("Token desconhecido: %s\n", yytext); yyerror("Token desconhecido."); }
<<EOF>> { return FIM_ENTRADA; }
"\n" { yylineno++; return FIM_DE_LINHA; }
%%
