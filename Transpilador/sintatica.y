%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sintatica.tab.h"

extern FILE *yyin;
extern int yylex(void);
void yyerror(const char *s);  // Corrigido de 'chars' para 'char *'
%}

%union {
    char *str;  // Corrigido de 'char' para 'char *'
}

%token<str> VARIAVEIS NUMEROS STRING IDENTACAO MAIS MENOS VEZES DIVIDIDO RECEBE IN RANGE ESPACO MAIORQUE MENORQUE IGUALIGUAl MAIORIGUAL MENORIGUAL DOISPONTOS IF ELSE ABREP FECHAP E OU WHILE FOR DEF RETURN VIRGULA FIM_ENTRADA  BREAK FIM_DE_LINHA

%type<str> COMECO ATRIBUICAO EXPRESSAO CONDICIONAl OPERADORES LOOP FUNCAO FINAL 
%start COMECO

%%

COMECO : FINAL COMECO 
        | FIM_ENTRADA { return 0; };

FINAL : ATRIBUICAO{printf("%s",$1);}  | EXPRESSAO{printf("%s",$1);}  | CONDICIONAl {printf("%s",$1);} | LOOP {printf("%s",$1);} | FUNCAO {printf("%s",$1);};

CONDICIONAl : IF ABREP NUMEROS OPERADORES NUMEROS FECHAP DOISPONTOS VARIAVEIS RECEBE NUMEROS  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("if(%s %s %s){\nint %s = %s\n}\n",$3,$4,$5,$8,$10);
            }
            |IF ABREP NUMEROS OPERADORES NUMEROS FECHAP DOISPONTOS VARIAVEIS RECEBE STRING  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("if(%s %s %s){\nstring %s = %s\n}\n",$3,$4,$5,$8,$10);
            }
            |IF ABREP NUMEROS OPERADORES NUMEROS FECHAP DOISPONTOS VARIAVEIS ESPACO RECEBE ESPACO NUMEROS  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("if(%s %s %s){\nint %s = %s\n}\n",$3,$4,$5,$8,$12);
            }
            |IF ABREP NUMEROS OPERADORES NUMEROS FECHAP DOISPONTOS VARIAVEIS ESPACO RECEBE ESPACO STRING FIM_DE_LINHA {
            $$ = malloc(100);
            printf("if(%s %s %s){\nstring %s = %s\n}\n",$3,$4,$5,$8,$12);
            }
            |ELSE ABREP NUMEROS OPERADORES NUMEROS FECHAP DOISPONTOS VARIAVEIS RECEBE NUMEROS  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("else(%s %s %s){\nint %s = %s\n}\n",$3,$4,$5,$8,$10);
            }
            |ELSE ABREP NUMEROS OPERADORES NUMEROS FECHAP DOISPONTOS VARIAVEIS RECEBE STRING  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("else(%s %s %s){\nstring %s = %s\n}\n",$3,$4,$5,$8,$10);
            }
            |ELSE ABREP NUMEROS OPERADORES NUMEROS FECHAP DOISPONTOS VARIAVEIS ESPACO RECEBE ESPACO NUMEROS  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("else(%s %s %s){\nint %s = %s\n}\n",$3,$4,$5,$8,$12);
            }
            |ELSE ABREP NUMEROS OPERADORES NUMEROS FECHAP DOISPONTOS VARIAVEIS ESPACO RECEBE ESPACO STRING FIM_DE_LINHA {
            $$ = malloc(100);
            printf("else(%s %s %s){\nstring %s = %s\n}\n",$3,$4,$5,$8,$12);
            }
            |IF ABREP VARIAVEIS OPERADORES VARIAVEIS FECHAP DOISPONTOS VARIAVEIS RECEBE NUMEROS  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("if(%s %s %s){\nint %s = %s\n}\n",$3,$4,$5,$8,$10);
            }
            |IF ABREP VARIAVEIS OPERADORES VARIAVEIS FECHAP DOISPONTOS VARIAVEIS RECEBE STRING  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("if(%s %s %s){\nstring %s = %s\n}\n",$3,$4,$5,$8,$10);
            }
            |IF ABREP VARIAVEIS OPERADORES VARIAVEIS FECHAP DOISPONTOS VARIAVEIS ESPACO RECEBE ESPACO NUMEROS  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("if(%s %s %s){\nint %s = %s\n}\n",$3,$4,$5,$8,$12);
            }
            |IF ABREP VARIAVEIS OPERADORES VARIAVEIS FECHAP DOISPONTOS VARIAVEIS ESPACO RECEBE ESPACO STRING FIM_DE_LINHA {
            $$ = malloc(100);
            printf("if(%s %s %s){\nstring %s = %s\n}\n",$3,$4,$5,$8,$12);
            }
            |ELSE ABREP VARIAVEIS OPERADORES VARIAVEIS FECHAP DOISPONTOS VARIAVEIS RECEBE NUMEROS  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("else(%s %s %s){\nint %s = %s\n}\n",$3,$4,$5,$8,$10);
            }
            |ELSE ABREP VARIAVEIS OPERADORES VARIAVEIS FECHAP DOISPONTOS VARIAVEIS RECEBE STRING  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("else(%s %s %s){\nstring %s = %s\n}\n",$3,$4,$5,$8,$10);
            }
            |ELSE ABREP VARIAVEIS OPERADORES VARIAVEIS FECHAP DOISPONTOS VARIAVEIS ESPACO RECEBE ESPACO NUMEROS  FIM_DE_LINHA {
            $$ = malloc(100);
            printf("else(%s %s %s){\nint %s = %s\n}\n",$3,$4,$5,$8,$12);
            }
            |ELSE ABREP VARIAVEIS OPERADORES VARIAVEIS FECHAP DOISPONTOS VARIAVEIS ESPACO RECEBE ESPACO STRING FIM_DE_LINHA {
            $$ = malloc(100);
            printf("else(%s %s %s){\nstring %s = %s\n}\n",$3,$4,$5,$8,$12);
            }
            ;
            

OPERADORES: MAIORQUE {$$ = ">";}| MENORQUE {$$ = "<";} | OU {$$ = "or";} |
 IGUALIGUAl {$$ = "==";} | E {$$ = "and";} | MENORIGUAL {$$ = "<=";}| 
 MAIORIGUAL {$$ = ">=";};


ATRIBUICAO : VARIAVEIS ESPACO RECEBE ESPACO NUMEROS FIM_DE_LINHA{ 
    $$ = malloc(100);
    printf("int %s = %s;\n", $1, $5); }
            | VARIAVEIS ESPACO RECEBE ESPACO STRING FIM_DE_LINHA { 
                $$ = malloc(100);
                printf("string %s = %s;\n", $1, $5); } |

                VARIAVEIS RECEBE NUMEROS FIM_DE_LINHA{ 
    $$ = malloc(100);
    printf("int %s = %s;\n", $1, $3); }
            | VARIAVEIS RECEBE STRING FIM_DE_LINHA { 
                $$ = malloc(100);
                printf("string %s = %s;\n", $1, $3); }
                ;

EXPRESSAO : VARIAVEIS ESPACO RECEBE ESPACO NUMEROS ESPACO MAIS ESPACO NUMEROS FIM_DE_LINHA{
            $$ = malloc(100);
            printf("%s = %s + %s; \n",$1,$5,$9);} 
            | VARIAVEIS ESPACO RECEBE ESPACO NUMEROS ESPACO MENOS ESPACO NUMEROS FIM_DE_LINHA{
            $$ = malloc(100);
            printf("%s = %s - %s; \n",$1,$5,$9);} 
            | VARIAVEIS ESPACO RECEBE ESPACO NUMEROS ESPACO VEZES ESPACO NUMEROS FIM_DE_LINHA{
            $$ = malloc(100);
            printf("%s = %s * %s; \n",$1,$5,$9);} 
            | VARIAVEIS ESPACO RECEBE ESPACO NUMEROS ESPACO DIVIDIDO ESPACO NUMEROS FIM_DE_LINHA{
            $$ = malloc(100);
            printf("%s = %s / %s; \n",$1,$5,$9);} 

            | VARIAVEIS RECEBE NUMEROS MAIS NUMEROS FIM_DE_LINHA{
            $$ = malloc(100);
            printf("%s = %s + %s; \n",$1,$3,$5);} |
            VARIAVEIS RECEBE NUMEROS MENOS NUMEROS FIM_DE_LINHA{
            $$ = malloc(100);
            printf("%s = %s - %s; \n",$1,$3,$5);} |
            VARIAVEIS RECEBE NUMEROS VEZES NUMEROS FIM_DE_LINHA{
            $$ = malloc(100);
            printf("%s = %s * %s; \n",$1,$3,$5);} |
            VARIAVEIS RECEBE NUMEROS DIVIDIDO NUMEROS FIM_DE_LINHA{
            $$ = malloc(100);
            printf("%s = %s / %s; \n",$1,$3,$5);};


LOOP:WHILE ABREP VARIAVEIS OPERADORES VARIAVEIS FECHAP DOISPONTOS FIM_DE_LINHA IDENTACAO BREAK FIM_DE_LINHA{
            $$ = malloc(100);
            printf("while(%s %s %s){\n return break;}\n",$3,$4,$5);}
    | FOR ESPACO VARIAVEIS ESPACO IN ESPACO RANGE ABREP NUMEROS FECHAP DOISPONTOS FIM_DE_LINHA IDENTACAO VARIAVEIS RECEBE VARIAVEIS FIM_DE_LINHA{
        $$ = malloc(100);
        printf("for(%s;%s<=%s;%s++){\n%s = %s}\n",$3,$3,$9,$3,$14,$16);
};

FUNCAO:DEF ESPACO VARIAVEIS ABREP FECHAP DOISPONTOS FIM_DE_LINHA{
    $$ = malloc(100);
    printf("void %s (){\n};\n",$3);
}

%%

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Modo de uso: ./transpilador arquivo.print\n");
        return 1;
    }

    FILE *arquivo = fopen(argv[1], "r");  
    if (!arquivo) {
        printf("Arquivo %s não encontrado!\n", argv[1]);
        return 1;
    }

    yyin = arquivo;
    yyparse();

    fclose(arquivo);
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}
