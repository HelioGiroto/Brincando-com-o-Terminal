#!/bin/bash

# Script para comparar screenshots da mesma posição da tela em laço de determinado tempo

# Autor: Hélio Giroto

# cores
BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

BOLD=`tput bold`
RESET=`tput sgr0`

# exemplo:
# echo -e "hello ${RED}some red text${RESET} world"
# FONTE: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux


# pega argumentos passados na linha de comando:
# nro do quadrante para comparação
QUADRANTE=$1
# qtos segundos de intervalo de pausa para fazer o próximo screenshot
SEGUNDOS=$2


# se não há valores [numéricos] nos dois argumentos na linha de comando:
if [[ -z $QUADRANTE ]] || [[ -z $SEGUNDOS ]] || [[ ! -z "${QUADRANTE##[0-9]*}" ]] || [[ ! -z "${SEGUNDOS##[0-9]*}" ]]
then 
	echo -e ${RED}
	echo "==================================================="
	echo "   FALTA PASSAR O NRO DO QUADRANTE E OS SEGUNDOS "
	echo "       DE INTERVALO PARA FAZER O SCREENSHOT"
	echo "==================================================="
	echo -e ${RESET}
	
	# antes: 
	#echo -e "\033[31m==================================================="
	#echo -e "\033[0m"
	
	echo "ARGUMENTOS (obrigat.):"
	echo "----------------------"
	echo "   #1- Nro. Quadrante"
	echo "   #2- Qtos. Segundos"
	
	echo
	echo "QUADRANTE CONFORME TECLADO NUMÉRICO:"
	echo "------------------------------------"
	echo "   0 para tela inteira"
	echo "   8 para 1/2 da tela - metade superior"
	echo "   2 para 1/2 da tela - metade inferior"
	echo "   4 para 1/2 da tela - metade esquerda"
	echo "   6 para 1/2 da tela - metade direita"
	echo "   7 para 1/4 de tela - superior esquerdo"
	echo "   9 para 1/4 de tela - superior direito"
	echo "   1 para 1/4 de tela - inferior esquerdo"
	echo "   3 para 1/4 de tela - inferior direito"
	echo
	
else
	echo -e ${CYAN}
	 
	echo "==================================================="
	echo "           AGUARDANDO $SEGUNDOS SEGUNDOS PARA"
	echo "                FAZER SCREENSHOT"	
	echo
	echo "      Para cancelar basta pressionar CTRL + C"
	echo "==================================================="
	
	echo -e ${RESET}

	echo "  Quadrante : $QUADRANTE teclado numérico."
	echo "  Pausa     : $SEGUNDOS segundos de intervalo."
	
	echo 
	
	# pausa para usuário posicionar a tela
	sleep $SEGUNDOS

	# toma 1o. screenshot
	scrot 
	
	# corta a imagem gerada com imagemagick e salva:



	# aqui vai o while true....:
	
	# corta de acordo com o argumento passado na linha de comando (e deleta o original - para não confundir com [PEN]NULTIMO:
	
	
	# obtem o nome do último arquivo gerado nesta pasta:
	ULTIMO=$(ls -lht | head -n2 | tail -n1 | rev | cut -d' ' -f1 | rev) 
	PENULTIMO=$(ls -lht | head -n3 | tail -n1 | rev | cut -d' ' -f1 | rev)

	# espera X segundos - conforme passado tb na linha de comando
	# sleep $SEGUNDOS
	
	# toma outro screenshot
	# scrot

	# corta a imagem gerada com imagemagick e salva:
	
	
	# compara:

		# Se as duas fotos são diferentes, envia um alerta (abre Youtube ?):

		# Caso contrário, continua fazendo disparos 

fi


