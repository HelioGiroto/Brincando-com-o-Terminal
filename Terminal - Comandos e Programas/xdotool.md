# xdotools

## Pega a posição na tela:
	watch -n0.3 -t xdotool getmouselocation --shell
	xdotool getmouselocation --shell
	 xdotool search --onlyvisible . behave %@ mouse-enter getmouselocation


(Para descobrir as coordenadas da tela, use: `watch -t -n 0.0001 xdotool getmouselocation `)

# ver - https://jualabs.com/2015/07/06/utilizando-o-xdotool-para-manipular-arquivos/
# https://stackoverflow.com/questions/8480073/how-would-i-get-the-current-mouse-coordinates-in-bash#13907499
# https://pt.linux-console.net/?p=16675

 #abrir o libreoffice  
	 # xdotool exec loffice --writer  
 #procurar pela janela  
	# xdotool --sync --name "Sem título 1"   
 #sem título 1 é o nome da janela padrão que o libreoffice abre  
 #digita o texto  
	# xdotool type --delay 215 "texto"  
 #espera 1 segundo  
 # xdotool type --delay 500 "Hello world"
	# xdotool sleep 1  
 #salva o arquivo  
	# xdotool key "ctrl+s"  
 #espera 1 segundo para garantir que a janela de salvamento irá abrir antes do próximo comando  
	#  xdotool sleep 1  
 #pressiona enter para confirmar e salvar o arquivo  
	# xdotool key "KP_Enter"
