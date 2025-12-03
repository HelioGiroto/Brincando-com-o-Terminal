#!/bin/bash
# Script para rodar no aplicativo de celular Termux
# Este programa tira uma foto a cada 3 segundos e compara com a anterior
# Caso seja diferente, houve alteração no ambiente e...
# ... e assim liga para um número definido

# Mova este script para dentro da pasta que o Termux irá executá-lo:
# bash spy_cell_cam.sh


# é preciso instalar o imagemagick:
# pkg install imagemagick


# espera 5 segundos para iniciar:
sleep 5 

# Define o nro de telefone:
NRO="11999999999"

# data:
TEMPO=$(date +"%T" | sed 's/:/_/g')

# variável
FOTO_ANT="foto-$TEMPO.jpg"

# tira primeira foto:
termux-camera-photo -c1 ./$FOTO_ANT


# laço até mudar o ambiente:
while :
do
	# espera 3 segundos:
	sleep 3
	
	# novo nome da foto
	TEMPO=$(date +"%T" | sed 's/:/_/g')
	
	
	# variável para foto-nova
	FOTO_NOVA="foto-$TEMPO.jpg"
	
	
	# tira nova foto:
	termux-camera-photo -c1 ./$FOTO_NOVA

	# compara fotos:
	TOLERANCIA=$(compare -fuzz 50% -quiet -metric ae $FOTO_ANT $FOTO_NOVA null: 2>&1 | awk -F' ' '{print $1}' )
	
	echo "Foto: $FOTO_NOVA - tolerância: $TOLERANCIA"
	
	
	if [[ $TOLERANCIA -ne 0 ]]
	then
		termux-telephony-call $NRO
		break
	fi

	FOTO_ANT="$FOTO_NOVA"

done

