#!/bin/bash

# CÁLCULO DE GEMATRIA DAS PALAVRAS
# sudo apt install libtranslate-bin



while :
do
	echo
	echo "DIGITE O NOME:"
	read palavra

	entrada=$(echo $palavra | translate-bin -s google -f en -t he 2> /dev/null | cut -d'>' -f2)
#	entrada=${palavra,,}					# Converte $palavra para todas minúsculas

	nome=($(echo $entrada | sed 's/ //g; s/./& /g'))	# Converte variável ($entrada) em array ($nome) !!!

	abecedario1=(א ב ג ד ה ו ז ח ט י כ ל מ נ ס ע פ צ ק ר ש ת ך ם ן ף ץ)		# Letras do abecedario
	numeros1=(1 2 3 4 5 6 7 8 9 10 20 30 40 50 60 70 80 90 100 200 300 400 500 600 700 800 900)	# Números correspondentes

	abecedario=(א ב ג ד ה ו ז ח ט י כ ך ל מ ם נ ן ס ע פ ף צ ץ ק ר ש ת)
	numeros=(1 2 3 4 5 6 7 8 9 10 20 20 30 40 40 50 50 60 70 80 80 90 90 100 200 300 400)


	total=0		# Cria variavel vazia que acumulará o valor total da gematria do nome.

	for letra_nome in ${nome[*]}	# Percorre cada letra do $nome
	do
		num_item=0		# Esse num é o num do item que está percorrendo no array $abecedario... 
					# ... (vai servir para o array $numeros que precisa ter o mesmo índice, i.é, o mesmo núm. de item)
		for letra_abecedario in ${abecedario[*]}	# Percorre cada letra do $abecedario
		do
			[[ "$letra_nome" == "$letra_abecedario" ]] && total=$(( total + ${numeros[$num_item]} )) # Compara cada item dos 2 arrays
			num_item=$((num_item + 1))		# Incrementa 1 a cada percorrida [do array] $abecedario.
		done
	done

	echo "A gematria de:" $palavra "que traduzido para o hebraico é: " $entrada "é:" $total 

done


