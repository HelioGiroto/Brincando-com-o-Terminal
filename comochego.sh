#!/bin/bash
echo

echo -n "Destino: "
read d
destino=$(sed 's/ /+/g'<<<$d)

echo -n "Cidade: "
read c
cidade=$(sed 's/ /+/g'<<<$c)

echo; echo "Abrindo https://www.google.com/maps/dir/here/${destino},${cidade} ....."; echo

chromium-browser https://www.google.com/maps/dir/here/${destino},${cidade} &> /dev/null


