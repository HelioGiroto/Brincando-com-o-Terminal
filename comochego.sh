#!/bin/bash
# Funciona COM ou SEM parâmetros (no Terminal Linux ou Mac*) :)
# Ex.: $ bash comochego.sh Av. Paulista, 1000 São Paulo

function abre {
	destino=$(sed 's/ /+/g'<<<$d)
	cidade=$(sed 's/ /+/g'<<<$c)
	echo; echo "Abrindo https://www.google.com/maps/dir/here/${destino},${cidade} ....."; echo
	firefox https://www.google.com/maps/dir/here/${destino},${cidade} &> /dev/null
	# Usuários MAC*: Comente essa linha acima (Colocando #) e DESCOMENTE a linha abaixo:
	# open -a Safari https://www.google.com/maps/dir/here/${destino},${cidade} &> /dev/null
	exit
}

[[ $1 ]] && { d=$*; abre; }	# Tendo parâmetro o usará como variável e abrirá a função, se não...

echo
echo -n "Destino: "
read d

echo -n "Cidade: "
read c
abre

# Autor: H.G.
