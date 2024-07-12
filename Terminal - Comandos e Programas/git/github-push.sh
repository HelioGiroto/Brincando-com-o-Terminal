#!/bin/bash
# Script para realizar um push ao Github automático
# Salvar em /bin sem a extensão .sh
# Autor: Hélio Giroto

if [ -z "$1" ] 
then
	echo "Falta parâmetro entre áspas para nomear o commit"
	echo
fi

git add .
git commit -m "$1"
echo
echo "==========="
echo
git push

echo
echo "Feito o commit '$1' e Github já atualizado." 
echo
