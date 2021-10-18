# COMO INSTALAR O SLAX LINUX

### https://www.youtube.com/watch?v=xftpN7K04Sg
### https://www.slax.org/starting.php

1. Baixar iso em slax.org
2. No computador em que foi baixado, extrair (clicar 2 vezes) 
3. Copia a pasta *slax* para um pendrive formatado FAT32 (para Windows)
4. Num Windows, clicar duas vezes no arquivo bootinst.bat e esperar rodar a tela verde.
5. Desconecta o USB e o conecta na máquina que será iniciado como SLAX


# como mudar o idioma do teclado no SLAX Linux:

~~~ bash
setxkbmap br
~~~

FONTE:
https://www.linuxquestions.org/questions/slackware-14/slax-5-1-8-how-to-change-keyboard-layout-at-command-line-499375/



# como mudar o horário para hora local:

## descubra o nome apropriado da sua localidade:
~~~ bash 
dpkg-reconfigure tzdata
~~~

## passe o seguinte comando conforme o nome da localidade:
~~~ bash
timedatectl set-timezone America/Sao_Paulo
~~~


FONTE: 
https://askubuntu.com/questions/323131/setting-timezone-from-terminal



# como mudar o wallpaper

## salvar outra imagem com o nome de:
## slax_wallpaper.jpg  no caminho:
/usr/share/wallpaper







