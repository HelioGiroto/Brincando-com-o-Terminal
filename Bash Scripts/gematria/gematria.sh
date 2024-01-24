#!/bin/bash

# CÁLCULO DE GEMATRIA DAS PALAVRAS

echo DIGITE NOME
read palavra

entrada=${palavra,,}					# Converte $palavra para todas minúsculas

nome=($(echo $entrada | sed 's/ //g; s/./& /g'))	# Converte variável ($entrada) em array ($nome) !!!

abecedario=(a b c d e f g h i j l m n o p q r s t u v x z)		# Letras do abecedario
numeros=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23)	# Números correspondentes

total=0		# Cria variavel vazia que acumulará o valor total da gematria do nome.

for letra_nome in ${nome[*]}	# Percorre cada letra do $nome
do
	num_item=0		# Esse num é o num do item que está percorrendo no array $abecedario... 
				# ... (vai servir para o array $numeros que precisa ter o mesmo índice, i.é, o mesmo núm. de item)
	for letra_abecedario in ${abecedario[*]}	# Percorre cada letra do $abecedario
	do
		[[ "$letra_nome" == "$letra_abecedario" ]] && total=$(( total + ${numeros[$num_item]} ))  # Compara cada item dos 2 arrays
		num_item=$((num_item + 1))		# Incrementa 1 a cada percorrida [do array] $abecedario.
	done
done

echo "A SOMA DA GEMATRIA DE:" $palavra "é" $total
