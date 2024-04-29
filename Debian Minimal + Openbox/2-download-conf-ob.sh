#!/bin/bash

# DOWNLOAD DE ARQUIVOS DE CONFIGURAÇÃO PARA OPENBOX
# USO SOMENTE QUANDO FOR INSTALAR OPENBOX NUMA MÁQUINA NOVA.
# Após instalar todos os programas, rodar este script
# na máquina nova para baixar as configurações dos principais programas.

# Baixa arquivos necessários de Github para a máquina (na pasta correta) onde o Openbox está sendo instalado:

# Clona repositório para a pasta da máquina que será instalada:
git clone ...

# Abre a pastado repositório clonado para a máquina:
cd Brincando-com-o-Termianl
cd Debian\ Minimal\ +\ Openbox
cd arquivos-de-configuracao
cd openbox

# openbox
cp * ~/.config/openbox
# Arquivos copiados para ~/.config/openbox da máquina:
	# rc.xml 	- responsável por teclas de atalho
	# menu.xml	- responsável por configurar o menu
	# autostart	- script de inicialização



# lxterminal
# volta uma pasta do repositório clonado. Abre lxterminal e copia para a máquina:
cd ..
cd lxterminal
cp * ~/.config/lxterminal
# Arquivos copiados para: ~/.config/lxterminal
# lxterminal.conf	- arquivo de configuração para o lxterminal


# conky
# volta uma pasta do repositório clonado. Abre conky e copia tudo para a máquina:
cd ..
cd conky
sudo cp * /etc/conky


# Thunar:
# volta uma pasta do repositório clonado. Abre Thunar e copia para a máquina:
cd ..
cd thunar
cp * ~/.config/Thunar


# Tint2
# volta uma pasta do repositório clonado. Abre tint2 e copia para a máquina:
cd ..
cd tint2
cp * ~/.config/tint2
# falta colocar o tint.conf correto = ???



# rofi
cd ~/.config/rofi
# arquivo de configuração do rofi
# wget



# fontes
# ????

# themes
# cd ~/.themes
# wget...




