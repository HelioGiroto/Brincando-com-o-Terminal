#!/bin/bash
sleep 3
cd /home/h/Descargas/detecta
fswebcam -bqr 320x240 --no-banner --png --save 0.png

sufixo=1

while :
do
	foto_atual=$sufixo.png
	foto_ant=$((sufixo-1)).png
	fswebcam -bqr 320x240 --no-banner --png --save $foto_atual
	sleep 5
	#diff $foto_atual $foto_ant > /dev/null
	
	tolerancia=$(compare -fuzz 50% -metric ae $foto_atual $foto_ant null: 2>&1)
	[ $tolerancia -eq 0 ] || cvlc --play-and-exit beep.mp3

	# cp $foto_atual DETECT-$foto_atual  # No caso de IF em vez de ternário acrescente essa linha		
	# Acima SE tolerancia NAO é 0 - Pq tem os pipes || 
	# [ $? -eq 0 ] && echo '' || cvlc --play-and-exit beep.mp3  
	sufixo=$((sufixo+1))
done
