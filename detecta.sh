#!/bin/bash

read
cd /home/h/Descargas/detecta

sufixo=1

while :
do
	foto_atual=$sufixo.jpg
	foto_ant=$((sufixo-1)).jpg

	fswebcam -b -q -r 320x240 --jpeg 50 --save $foto_atual
	diff $foto_atual $foto_ant > /dev/null
	[ $? -eq 0 ] && echo '' || cvlc beep.mp3  

	sufixo=$((sufixo+1))
	sleep 1


done
