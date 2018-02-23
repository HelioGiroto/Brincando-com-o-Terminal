#!/bin/bash

function abre {
	destino=$(sed 's/ /+/g'<<<$d)
	cidade=$(sed 's/ /+/g'<<<$c)
	echo; echo "Abrindo https://www.google.com/maps/dir/here/${destino},${cidade} ....."; echo
	chromium-browser https://www.google.com/maps/dir/here/${destino},${cidade} &> /dev/null
	exit
}

[[ $1 ]] && { d=$*; abre; }

echo
echo -n "Destino: "
read d

echo -n "Cidade: "
read c
abre

# Autor: H.G.
