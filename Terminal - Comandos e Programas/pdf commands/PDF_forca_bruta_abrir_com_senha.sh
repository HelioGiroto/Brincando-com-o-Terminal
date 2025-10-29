#!/bin/bash
# Script: Para descobrir a senha de um documento PDF (desde que seja numérica)
# Autor: Helio Giroto
# Data: 29/10/2025

# aqui vai o nome do arquivo:
ARQ="exemplo.pdf"


for SENHA in $(seq 0001 999)
do 
	# echo "TESTANDO SENHA: $SENHA"
	pdfgrep -i "." "--password=$SENHA" "$ARQ" 2>/dev/null
	if [[ $? -eq 0 ]]
	then 
		echo "Senha do documento PDF: $SENHA"
		echo
		break
	fi
done &



for SENHA in $(seq 1000 1999)
do 
	# echo "TESTANDO SENHA: $SENHA"
	pdfgrep -i "." "--password=$SENHA" "$ARQ" 2>/dev/null
	if [[ $? -eq 0 ]]
	then 
		echo "Senha do documento PDF: $SENHA"
		echo
		break
	fi
done &


for SENHA in $(seq 2000 2999)
do 
	# echo "TESTANDO SENHA: $SENHA"
	pdfgrep -i "." "--password=$SENHA" "$ARQ" 2>/dev/null
	if [[ $? -eq 0 ]]
	then 
		echo "Senha do documento PDF: $SENHA"
		echo
		break
	fi
done &


for SENHA in $(seq 3000 3999)
do 
	# echo "TESTANDO SENHA: $SENHA"
	pdfgrep -i "." "--password=$SENHA" "$ARQ" 2>/dev/null
	if [[ $? -eq 0 ]]
	then 
		echo "Senha do documento PDF: $SENHA"
		echo
		break
	fi
done &


for SENHA in $(seq 4000 4999)
do 
	# echo "TESTANDO SENHA: $SENHA"
	pdfgrep -i "." "--password=$SENHA" "$ARQ" 2>/dev/null
	if [[ $? -eq 0 ]]
	then 
		echo "Senha do documento PDF: $SENHA"
		echo
		break
	fi
done &


for SENHA in $(seq 5000 5999)
do 
	# echo "TESTANDO SENHA: $SENHA"
	pdfgrep -i "." "--password=$SENHA" "$ARQ" 2>/dev/null
	if [[ $? -eq 0 ]]
	then 
		echo "Senha do documento PDF: $SENHA"
		echo
		break
	fi
done &



for SENHA in $(seq 6000 6999)
do 
	# echo "TESTANDO SENHA: $SENHA"
	pdfgrep -i "." "--password=$SENHA" "$ARQ" 2>/dev/null
	if [[ $? -eq 0 ]]
	then 
		echo "Senha do documento PDF: $SENHA"
		echo
		break
	fi
done &



for SENHA in $(seq 7000 7999)
do 
	# echo "TESTANDO SENHA: $SENHA"
	pdfgrep -i "." "--password=$SENHA" "$ARQ" 2>/dev/null
	if [[ $? -eq 0 ]]
	then 
		echo "Senha do documento PDF: $SENHA"
		echo
		break
	fi
done &



for SENHA in $(seq 8000 8999)
do 
	# echo "TESTANDO SENHA: $SENHA"
	pdfgrep -i "." "--password=$SENHA" "$ARQ" 2>/dev/null
	if [[ $? -eq 0 ]]
	then 
		echo "Senha do documento PDF: $SENHA"
		echo
		break
	fi
done &



for SENHA in $(seq 9000 9999)
do 
	# echo "TESTANDO SENHA: $SENHA"
	pdfgrep -i "." "--password=$SENHA" "$ARQ" 2>/dev/null
	if [[ $? -eq 0 ]]
	then 
		echo "Senha do documento PDF: $SENHA"
		echo
		break
	fi
done &

echo "Aguarde..."


