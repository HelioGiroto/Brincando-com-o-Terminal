#!/bin/bash

# Este comando abre o acesso de um servidor com usuário e senha (007) que abre a porta 8888 para todo computador da rede local:

# Requer instalar módulo Node:
# $ npm install -g http-server 

# Digite isso na pasta do Terminal do computador que deseja compartilhar:

$ http-server -p 8888 . --username MAQ33 --password 007


# COMO EXECUTAR ESTE SCRIPT DE MANEIRA INVISÍVEL:
# nohup bash servidor.sh >> server.log & disown


# Para matar o processo invisível (dois comandos):
# $ ps -ef

# ou:
# ps -ef | grep 'http-server'


# Resultado:
# ...
# computador+ 13999 13998  0 17:56 ?        00:00:00 http-server
#...

# $ kill 13999

