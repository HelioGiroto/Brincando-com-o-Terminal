# Configurar fontes para que saiam os emojis em tela 

Duas alternativas:
```
sudo apt update
sudo apt install fonts-noto-color-emoji
```

Ou:

```
cd /usr/share/fonts/truetype/noto/
sudo wget https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
sudo fc-cache -f -v
```

E após isso:

` sudo nano /etc/fonts/local.conf `

E insira isso, para configurar o Fontconfig para priorizar emojis: 

```

<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
  <alias><family>sans-serif</family><prefer><family>Noto Color Emoji</family></prefer></alias>
  <alias><family>serif</family><prefer><family>Noto Color Emoji</family></prefer></alias>
  <alias><family>monospace</family><prefer><family>Noto Color Emoji</family></prefer></alias>
</fontconfig>

```

E novamente: 

` sudo fc-cache -f -v `


Reinicie o sistema.


ver: https://askubuntu.com/questions/1495102/is-there-a-debug-guide-to-solve-emojis-not-dislaying-in-terminal-tilix-or-guake


