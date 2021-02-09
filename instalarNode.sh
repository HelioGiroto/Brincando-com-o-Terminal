#!/bin/bash
#COMO INSTALAR O NODE JS - ÚLTIMA VERSÃO NO UBUNTU, DEBIAN E DERIVADOS:

   sudo apt remove nodejs
   sudo apt -f install
   sudo apt-get autoremove
   sudo apt clean
 
   curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
   sudo apt-get install nodejs
   node -v
   npm -v

# agradecimentos a : https://tecadmin.net/install-latest-nodejs-npm-on-ubuntu/
# Helio Giroto
