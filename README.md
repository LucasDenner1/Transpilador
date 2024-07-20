# Transpilador

Transpilador de Python para C

É necessário a instalação do FLEX, BISON e GCC para rodar o código. Após a intalação de tudo isso, vá no terminal e rode os seguintes comandos: ``flex lexica.l && bison -d sintatica.y``,``gcc sintatica.tab.c lex.yy.c -o teste -lfl`` e ``./teste teste.txt``
