#!/bin/bash

# Como adicionar no NAUTILUS a função de ao pressionar F4 abre o Terminal na pasta atual.

# Autor: Hélio Giroto

# sudo touch ~/.local/share/nautilus/scripts/Terminal

sudo echo "#!/bin/bash" >> ~/.local/share/nautilus/scripts/Terminal
sudo echo "gnome-terminal" >> ~/.local/share/nautilus/scripts/Terminal

sudo chmod +x ~/.local/share/nautilus/scripts/Terminal

sudo echo "F4 Terminal" >> ~/.config/nautilus/scripts-accels

nautilus -q


# PEQUENOS BUGS:

# Para funcionar: 
# 	1. Abra o nautilus
# 	2. Clique com o botão direito do mouse sobre uma pasta
#	3. Selecione: Scripts > Terminal 
# 	4. Volte ao nautilus
# 	5. E agora pressione F4 e funciona!

# Dependendo do teclado (se for de laptop por exemplo), talvez seja necessário pressionar: Tecla Fn + F4.


# FONTES: 
# https://askubuntu.com/questions/680016/keyboard-shortcut-for-open-terminal-nautilus-3-16/696901#696901
# https://askubuntu.com/questions/1060616/keyboard-shortcut-for-open-terminal-nautilus-in-bionic-18-04/1062263#1062263

