# WIFI E BLUETOOTH NO DEBIAN MINIMAL

## WIFI

### Comando para conectar-se com um roteador wifi:

- Encontre wifi´s por perto, escolha e digite a senha:

`nmtui-connect`

- Para editar a senha já salva de uma wifi: 

`nmtui-edit`

ou:

`nmtui`


### Para ligar/desligar o wifi/bluetooth do seu computador:

- Para ativar/desativar o wifi (pode colocar em tecla de atalho!):
`wifi toggle`

- Para ativar/desativar o bluetooth (pode colocar em tecla de atalho!)
`bluetooth toggle`


### Para verificar em que Wifi está conectado:

- Comando: 
`nmcli connection show --active`

- Para ver as mais próximas (via linha de comando):
`nmcli connection show`

- Mais especificações da conexão ativa:
`sudo nmcli device show`

	*Fonte: https://computingforgeeks.com/install-and-use-networkmanager-nmcli-on-ubuntu-debian/*


### Para ativar o Wifi do seu computador sempre que inicie:

_(Não é necessário caso na instalação do Debian foi colocada a senha do wifi)_

**Comando TLP**

Este comando controla recursos do computador como wifi, bluetooth, etc...
Servirá para habilitar o wifi sempre quando inicie o computador.

- Para instalar

`sudo apt install tlp tlp-rdw`

- Para ver todos os recursos que ele controla:

`sudo tlp-stat`

- Em seguida, configure o arquivo de configuração do TLP...:

`sudo gedit /etc/tlp.conf`

- **Des**-comente a linha:

`DEVICES_TO_ENABLE_ON_STARTUP="bluetooth wifi wwan"`

(Pode aparecer assim:)

`DEVICES_TO_ENABLE_ON_STARTUP="bluetooth nfc wifi wwan"`


*Fontes:*
- https://linuxconfig.org/how-to-optimize-laptop-battery-life-with-tlp-on-linux
- https://linrunner.de/tlp/usage/tlp-stat.html
- https://linrunner.de/tlp/usage/radio.html
- https://unix.stackexchange.com/questions/127705/automatically-run-rfkill-unblock-on-startup


---

## ANTIGO:

### Instalar gerenciadores de Wifi (para encontrar roteadores, etc): (???)
`sudo apt install network-manager-gnome`

- Habilite ou desabilite as placas de interface de rede (só Ethernet ?):
`sudo systemctl enable NetworkManager.service`

**nm-connection-editor**  ??

Agora: Com o cabo Ethernet plugado, verifica se a senha está correta... 
	(SSID = Nome da wifi (que aparece nos celulares) = CLARONOVO, por ex.)


*Ou:*
- Para instalar
`sudo apt install network-manager`

- Para iniciar e ativar: (?)
`sudo systemctl start NetworkManager.service`
`sudo systemctl enable NetworkManager.service`


### Para ligar o wifi do seu computador:
(Caso apresente o erro de *não aparecer os wifis*, entre com os comandos)

- Digite para ver o que se pode ser \[des]ativado:
`sudo rfkill`

- Conectar wifi, bluetooth, etc:
`sudo rfkill unblock all`

- Para desativar o wifi e bluetooth (ver tb `wifi toggle`):
`sudo rfkill block all`


---

## BLUETOOTH

- Liga o bluetooth da máquina:
`	`

- Liga o controlador:
`bluetoothctl power on`

- Torna a máquina "descobrível" para outros dispositivos:
`bluetoothctl discoverable on`

- Torna a máquina "pareável":
`bluetoothctl pairable on`

- Busca dispositivos abertos:
`bluetoothctl scan on`

(Capture o endereço MAC do dispositivo, ex.: Device E4:F3:C4:2B:29:07)

- Paree:
`bluetoothctl pair E4:F3:C4:2B:29:07`

- Quem está pareado:
`bluetoothctl paired-devices`
`bluetoothctl devices`

- Conecte:
`bluetoothctl connect E4:F3:C4:2B:29:07`

- Disconecte:
`bluetoothctl disconnect E4:F3:C4:2B:29:07`

- Envie arquivos:  ??
`bluetooth-sendto`

- Remover um dispositivo:
`bluetoothctl remove FC:69:47:7C:9D:A3`

- Bloquear um dispositivo:
`bluetoothctl block FC:69:47:7C:9D:A3`


- Fontes:
https://www.baeldung.com/linux/bluetooth-via-terminal
https://askubuntu.com/questions/144655/how-to-check-bluetooth-status-via-terminal
https://tecnoguia.istocks.club/como-gerenciar-dispositivos-bluetooth-no-linux-usando-bluetoothctl/2021-05-15/

- vet tb:
https://convertlive.com/pt/u/converter/microgramas/em/mg#1000
https://duckduckgo.com/?q=linux+terminal+send+a+file+to+mobile+from+bluetooth&ia=web
https://askubuntu.com/questions/432740/how-to-send-receive-files-via-bluetooth-using-commands-terminal
https://help.ubuntu.com/stable/ubuntu-help/bluetooth-send-file.html.en
https://unix.stackexchange.com/questions/577097/how-to-transfer-files-from-a-bluetooth-connected-device-using-the-command-line
https://web.whatsapp.com/
https://www.facebook.com/bpwiliamoliveira


---
### ANTIGO

- Criei o script executável (ligawifi) em /bin que executa o comando:

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

**MAIS ANTIGO**

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



__sudo dhclient wlp3s0__ 	# não é necessário.

---

**Fonte: https://www.youtube.com/watch?v=dGHo1TeDi88**



---

wifi

https://www.howtogeek.com/devops/how-to-manage-linux-wi-fi-networks-with-nmtui/

https://packages.debian.org/source/oldstable/network-manager

Para instalar:
sudo apt install network-manager

Para abrir o wireless manager gui:
nmtui



