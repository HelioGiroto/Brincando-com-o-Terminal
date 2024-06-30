#!/bin/bash

# Script para emparelhar o celular com este computador no kdenconnect
# Autor: Helio Giroto

# Procura o dispositivo para emparelhar:
# DEVICE=$(kdeconnect-cli -l | grep 'emparelhado' | cut -d' ' -f3)
DEVICE="7dbded3e605bbb1c"

# Faz o emparelheamento
kdeconnect-cli -d ${DEVICE} --pair

# tente tb:
# kdeconnect-cli -d ${DEVICE} --ring


# ver tb (SMS):
# https://clivejo.com/using-kde-connect-to-send-and-receive-sms/
