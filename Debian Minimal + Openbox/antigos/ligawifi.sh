#!/bin/bash
echo
echo Ligando Wifi.....
echo
sudo rfkill unblock all

# anteriormente este script era chamado no Openbox no autostart
# mas agora não usamos mais.

# para bloquear:
# sudo rfkill block all


# Salva este script en /bin
# e dá acesso de execução:
# sudo chmod 777 ligawifi


# ver tb: 
# sobre o tlp :
# https://linuxconfig.org/how-to-optimize-laptop-battery-life-with-tlp-on-linux
# https://unix.stackexchange.com/questions/127705/automatically-run-rfkill-unblock-on-startup
# https://linrunner.de/tlp/settings/radio.html
