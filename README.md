
# Trabalho Transpilador - 3ª avaliação

Um transpilador é uma ferramenta que converte o código-fonte de uma linguagem de programação para outra, mantendo o nível de abstração similar. No caso, o transpilador construido converte código Python para C.

## Grupo
- Bernardo José da Silveira Vieira
- Francisco Geibson Saraiva de Oliveira Frutuoso
- Lucas Denner Soares da Rocha
- Marcio Vinicius da Rocha Pereira

## Guia de instalação
É necessário ter instalado do FLEX, BISON e GCC para rodar o código. Após a intalação de tudo isso, vá no terminal e rode os seguintes comandos:

```
flex lexica.l && bison -d sintatica.y
```
```
gcc sintatica.tab.c lex.yy.c -o teste -lfl
```
```
./teste teste.txt
```

## Linguagem fonte e linguagem alvo

**Linguagem fonte**: Python

**Linguagem alvo**: C

## Link para documentação

[![documento](https://img.shields.io/badge/Link%20para%20o%20documento-0A66C2?style=for-the-badge&logo=googleDrive)](https://docs.google.com/document/d/1CfpsVKB-XnekMBKe6lXYqif_cOWDBy4340ybjHPlw98/edit)
