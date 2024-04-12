#!/bin/bash

# Este script compara dois arquivos e apenas responde se há diferença ou não entre os dois.
# É útil para saber se um documento foi alterado ou não.

# Sintaxe:
# bash compara.sh arq1.txt arq2.txt


diff $1 $2 &> /dev/null
[[ $? == "0" ]] && echo "Não tem diferença" || echo "Tem diferença"


# Autor: Helio Giroto
