#!/bin/bash

# DOWNLOAD DE ARQUIVOS DE CONFIGURAÇÃO PARA OPENBOX
# USO SOMENTE QUANDO FOR INSTALAR OPENBOX NUMA MÁQUINA NOVA.

# Após instalar todos os pacotes/programas, rodar este script
# na máquina nova para baixar as configurações dos principais programas.


# Clona repositório para a pasta da máquina que será instalada:
# git clone caso nao tenha feito:
cd
git clone https://github.com/HelioGiroto/Brincando-com-o-Terminal.git


# conky
cd
cd Brincando-com-o-Terminal/Debian\ Minimal\ +\ Openbox/arquivos-de-configuracao
cd conky
sudo cp * /etc/conky


# lxterminal
cd
cd Brincando-com-o-Terminal/Debian\ Minimal\ +\ Openbox/arquivos-de-configuracao
cd lxterminal
sudo cp * ~/.config/lxterminal
# Arquivos copiados para: ~/.config/lxterminal
# lxterminal.conf	- arquivo de configuração para o lxterminal


# openbox
cd
cd Brincando-com-o-Terminal/Debian\ Minimal\ +\ Openbox/arquivos-de-configuracao
cd openbox
sudo cp * ~/.config/openbox
# Arquivos copiados para ~/.config/openbox da máquina:
	# rc.xml 	- responsável por teclas de atalho
	# menu.xml	- responsável por configurar o menu
	# autostart	- script de inicialização



# rofi
cd
cd Brincando-com-o-Terminal/Debian\ Minimal\ +\ Openbox/arquivos-de-configuracao
cd rofi
sudo cp * ~/.config/rofi




# Thunar:
cd
cd Brincando-com-o-Terminal/Debian\ Minimal\ +\ Openbox/arquivos-de-configuracao
cd rofi
sudo cp * ~/.config/Thunar



# Tint2
cd
cd Brincando-com-o-Terminal/Debian\ Minimal\ +\ Openbox/arquivos-de-configuracao
cd tint2
sudo cp * ~/.config/tint2


cd
echo
echo "Configurações modificadas."
echo "Pode reiniciar a máquina..."
echo

# fontes
# ????

# themes
# cd ~/.themes
# wget...




