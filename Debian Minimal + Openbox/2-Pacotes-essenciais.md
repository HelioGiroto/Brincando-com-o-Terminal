# Pós-instalação

### 1 - Configurando o sources.list
No Terminal abre o sources list:

```bash
sudo nano /etc/apt/sources.list
```

Muda as seguintes linhas para os valores:

- Apaga todas as linhas comentadas.
- Comenta todas as linhas que começam com: deb-src http... (sobre pacotes de códigos fonte - desnecessários).
- Acrescenta *contrib non-free* entre: main e non-free-firmware nas três linhas.

**A versão final do arquivo tem que estar assim:**
![](imgs/sources-list.png)

- Salva e sai.

- Atualiza tudo:

```bash
sudo apt update
```

### 2 - Instalando pacotes mínimos

Para informações dos pacotes a seguir, dar comando:
```bash
	sudo apt show ...
```

FONTE: https://raw.githubusercontent.com/HelioGiroto/Brincando-com-o-Terminal/master/openbox/como-instalar-openbox.md

Os pacotes indispensáveis para o funcionamento do Openbox são:

```bash
sudo apt install xorg xinit openbox obconf lxterminal aptitude slim tint2 menu nitrogen compton thunar arandr rofi git xterm
```

Depois, comando:

```bash
startx
```

- No Terminal clonar o repositorio (??) 
	git clone https://github.com/HelioGiroto/Brincando-com-o-Terminal.git

- Copiar as pastas de .config do repositório para .config da máquina

- Pacotes essenciais: 

```bash
sudo apt install vim tmux ranger gedit chromium simplescreenrecorder audacity gcc cheese conky bc gawk sed grep lynx curl wget html-xml-utils xclip googler ffmpeg imagemagick speedtest-cli youtube-dl nmap numix-icon-theme-circle espeak mbrola gnumeric galculator abiword shotwell htop mc mupdf mpack ssmtp mplayer alpine wkhtmltopdf gpick gnome-tweaks gnome-sushi gnome-multi-writer wdiff colordiff tint2 feh fswebcam dialog jq xtrlock mate-utils pavucontrol calendar whois bsdmainutils onboard pdfgrep numlockx lxappearance vlc python3-pip mirage plank xserver-xorg-input-synaptics nodejs npm pandoc gnome-control-center mediainfo mp3info mpv xdotool youtube-dl neofetch default-jre detox obs-studio network-manager tlp tlp-rdw rfkill wmctrl detox obconf jpmenu

``


# openjdk-18-jre    # JDonwloader: não aceita instalar via apt

Pronto!

OBS.: Configurar: lxappearance e obconf (?)


Próximo passo: ![3 - Configurar sistema](3-Configurar-Openbox.md)

