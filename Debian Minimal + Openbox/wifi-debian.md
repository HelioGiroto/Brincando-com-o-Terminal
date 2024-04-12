# Ligar o wifi
**Fonte: https://www.youtube.com/watch?v=dGHo1TeDi88**

##########

sudo apt install network-manager-gnome

sudo systemctl enable NetworkManager.service

**nm-connection-editor**

Agora: Como cabo Ethernet plugado, verifica se a senha está correta... 
	(SSID = Nome da wifi (que aparece nos celulares) = CLARONOVO, por ex.)

## Em seguida:
nmtui

ou: 
nmtui-connect

## Caso apresente o erro de *não aparecer os wifis* (entre com os comandos):
### só este e basta! <- mas tem que ser inicializado sempre:
sudo rfkill unblock all  

__sudo dhclient wlp3s0__ 	# não é necessário.

# Criei o script executável (ligawifi) em /bin que executa o comando:

```bash
	#!/bin/bash
	echo
	echo Ligando Wifi.....
	echo
	sudo rfkill unblock all

	# Salva este script en /bin
	# e dá acesso de execução:
	# sudo chmod 777 ligawifi
```


FONTE:
https://askubuntu.com/questions/517467/how-to-display-network-manager-icon-on-the-xfce-panel

https://pt.linux-console.net/?p=15598

ver solução para problema de *não aparecer a wifi* quando roda o comando nmtui: 
	https://duckduckgo.com/?q=lnux+comando+como+configurar+rfkill&ia=web
	https://linuxconfig.org/how-to-manage-wifi-interfaces-with-rfkill-command-on-linux
	https://pt.linux-console.net/?p=10213
	http://www.linux-commands-examples.com/rfkill
	
	*Habilitar rkkill ao iniciar a máquina:*
	https://unix.stackexchange.com/questions/127705/automatically-run-rfkill-unblock-on-startup
	https://duckduckgo.com/?q=rfkill+on+start+linux&ia=web



############################################

## Instala o wpasuplicant:
sudo apt install wpasupplicant 

## Vá até o diretório que será salvo o arq de configuração:
cd /etc/

## Passa o nome da rede wifi e a senha (blablabla) e salva num arq (wpa.conf):
sudo wpa_passphrase CLARONOVO blablabla > wpa.conf

## Chama o programa:
sudo wpa_supplicant

## Copia o nome abaixo de drivers:
## 	drivers:
##   		nl80211 = Linux nl80211/cfg80211 - Neste caso é nl80211
ip a 


## Copia o nome da placa de rede wifi (wlp3s0)
## 	valid_lft forever preferred_lft forever
## 	wlp3s0: <NO-CARRIER,BROADCAST,MULTICAST,DYNAMIC,UP>  # no caso é wlp3s0
sudo wpa_supplicant -D nl80211 -i wlp3s0 -c /etc/wpa.conf 


	# Caso apresente erro do tipo: ... rfkill: WLAN soft blocked ...:
	sudo apt install rfkill
	sudo rfkill unblock all


	# E novamente:
	sudo wpa_supplicant -D nl80211 -i wlp3s0 -c /etc/wpa.conf 

## Verifica:
ip a 

# ERRO: Caso apresente um ip estranho, diferente de "inet 192.168.0.15/24" (p.ex):
# Entrar com o comando:

sudo dhclient wlp3s0 	# onde wlp3s0 é o -i do wpa_supplicant.

## Em seguida verifica novamente
ip a 

*(e o ip em inet estará iniciado com 192.168...)*


## O último passo é salvar o comando abaixo na inicialização do Linux (com &):
sudo wpa_supplicant -D nl80211 -i wlp3s0 -c /etc/wpa.conf &



