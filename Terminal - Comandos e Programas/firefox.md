# Firefox

# O navegador Firefox não se instala fora do Flatpak, porém a versão extendida (ESR) isso é possível. Desta forma:
sudo apt install firefox-esr


É possível baixar a versão standard através do site:

https://www.firefox.com/pt-BR/

Em seguida: 

-  Vá até a pasta que descarregou e no Terminal digite:
```
   tar -xJvf firefox-145.0.1.tar.xz
   sudo mv firefox /opt
   sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox
   sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop -P /usr/local/share/applications
```

- Para chamá-lo desde o Terminal, digite: 
` firefox `

Caso não encontre, procure-o no caminho:

` which firefox ` ou: ` whereis firefox `






---

https://support.mozilla.org/pt-BR/kb/ia-chatbot?as=u&utm_source=inproduct


