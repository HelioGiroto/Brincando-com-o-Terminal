# Instalação do Debian Minimal e Openbox - OPENBOX RAIZ 

Guia de passo a passo para instalação mínima do Linux Debian com Openbox:

## 1. Baixar ISO Debian Netinst:
	Site para baixar a ISO do Debian (2 alternativas):
	https://www.debian.org/distrib/index.pt.html
	https://www.debian.org/CD/netinst/

*Para 64 bits: amd64*

	https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.4.0-amd64-netinst.iso
	
*Para 32 bits: i386*

	https://cdimage.debian.org/debian-cd/current/i386/iso-cd/debian-12.4.0-i386-netinst.iso


## 2. Criar USB instalador (desde outra máquina)

	- Instalar programa para criar USB instalador. No Terminal:
		sudo apt install gnome-multi-writer

	- Insere o Pendrive na máquina
	- Abre desde o Terminal: gnome-multi-writer
	- Clica no ícone de abrir pasta
	- Escolhe a imagem ISO baixada de Debian para que seja copiada no pendrive.



## 3. Instalar o Debian Minimal na máquina nova: 

- Verificar se a BIOS está configurada para iniciar o sistema desde o USB.
- Conectar cabo de rede (Ethernet).
- Conectar USB com a ISO do Debian na máquina e ligá-la.


Telas da instalação:

- País, idiomas do sistema e teclado
![](imgs/localechooser_shortlist_0.png)
![](imgs/localechooser_languagelist_0.png)
![](imgs/keyboard-configuration_xkb-keymap_0.png)


- Conectando rede (ethernet ou wifi)
![](imgs/netcfg_choose_interface_0.png)

- Nome da máquina
![](imgs/netcfg_get_hostname_0.png)

- Nome do dominio = vazio
![](imgs/netcfg_get_domain_0.png)

- Senha do root (opcional) 
 *-Não colocando senha no Root, a senha do usuário que se cadastrará primeiro, será a mesma para root e não será necessário configurar o sudo su.
![](imgs/passwd_root-password_0.png)

- Nome do usuário
![](imgs/passwd_user-fullname_0.png)

- Senha do usuário
![](imgs/passwd_user-password_0.png)

- Estado do Brasil - para configuraçao de horário.
![](imgs/time_zone_0.png)


- Particionar discos (Sim/Nao) = N
![](imgs/partman-efi_non_efi_system_0.png)

- Particionar discos - Usar disco o inteiro
![](imgs/partman-auto_init_automatically_partition_0.png)

- Escolhe o disco (NÃO o USB!!)
![](imgs/partman-auto_select_disk_0.png)

- Todos os arquivos em uma partição
![](imgs/partman-auto_choose_recipe_0.png)

- Finalizar o particionamento e escrever as mudanças no disco
![](imgs/partman_choose_partition_0.png)

- Confirma a partição (formatação e criação do disco com Debian) = Sim
![](imgs/partman_confirm_0.png)
(Começa a instalação do sistema).

- Configurar o gerenciador de pacotes = país (EEUU) + url + proxy (vazio)
![](imgs/mirror_http_countries_0.png)
![](imgs/mirror_http_mirror_0.png)
![](imgs/mirror_http_proxy_0.png)


- Participar da pesquisa sobre pacotes = não
![](imgs/popularity-contest_participate_0.png)

- Seleção de software/interface gráficas - XFCE, etc... = somente utilitários de sistema padrão.
![](imgs/tasksel_first_0.png)
(Prossegue a instalação do sistema)...


- Grub: Instalar no disco primário? = Sim
![](imgs/grub-installer_only_debian_0.png)

- Local do Grub = SSD
![](imgs/grub-installer_choose_bootdev_0.png)

- Finalizar instalação = Continuar (REMOVER O USB APÓS TELA PRETA DE REBOOT)
![](imgs/finish-install_reboot_in_progress_0.png)

Próximo arquivo: **Pós-instalação**

## 4. Pós-instalação

### 4.1 - Configurando o sources.list
- No Terminal abre o sources list:
sudo nano /etc/apt/sources.list

- Muda as linhas para os seguintes valores:

Apaga todas as linhas comentadas.
Comenta todas as linhas que começam com: deb-src http... (sobre pacotes de códigos fonte - desnecessários).
\[Acrescenta a entre main e non-free-firmware: contrib non-free nas três linhas]

O arquivo tem que estar assim:
![](imgs/sources-list.png)

- Salva e sai.

- Atualiza tudo:

**sudo apt update**


### 4.2 - Instalando pacotes mínimos

Para informações dos pacotes acima, dar comando:
	sudo apt show ...

FONTE: https://raw.githubusercontent.com/HelioGiroto/Brincando-com-o-Terminal/master/openbox/como-instalar-openbox.md

Os pacotes indispensáveis para o funcionamento do Openbox são:

```bash
sudo apt install xorg xinit openbox obconf lxterminal aptitude slim tint2 menu nitrogen compton thunar arandr rofi git xterm
```

Depois, comando:

```bash
startx
```

- No Terminal clonar o meu 
	git clone https://github.com/HelioGiroto/Brincando-com-o-Terminal.git

- Copiar as pastas de .config do repositório para .config da máquina

- Pacotes essenciais: 

```bash
sudo apt install vim tmux ranger gedit chromium simplescreenrecorder audacity gcc cheese conky bc gawk sed grep lynx curl wget html-xml-utils xclip googler ffmpeg imagemagick speedtest-cli youtube-dl nmap numix-icon-theme-circle espeak mbrola gnumeric galculator abiword shotwell htop mc mupdf mpack ssmtp mplayer alpine wkhtmltopdf gpick gnome-tweaks gnome-sushi gnome-multi-writer wdiff colordiff tint2 feh fswebcam dialog jq xtrlock mate-utils pavucontrol calendar whois bsdmainutils onboard pdfgrep numlockx lxappearance lxappearance-obconf vlc python3-pip mirage plank xserver-xorg-input-synaptics nodejs npm pandoc gnome-control-center mediainfo mp3info mpv openjdk-18-jre default-jre xdotool youtube-dl neofetch
``


(lxappearance-obconf = $ obconf)


### 4.3 - Instalação de programas essenciais:
	

#### scrcpy - instalação e habilitação:
	ver scrcpy.txt

[[Instalação de scrcpy]]


#### Módulos do python:

	sudo apt install python3-\[nome-do-módulo]
	sudo apt install python3-pip		# para instalar módulos
	
	pip install python3-pyautogui		# instalar módulos para automação. Só aceita este formato de comando.

Se aparece a mensagem de erro: externally-managed-environment
	
			pip install --break-system-packages pyautogui

Fonte: https://stackoverflow.com/questions/75608323/how-do-i-solve-error-externally-managed-environment-every-time-i-use-pip-3
		
	sudo apt install python3-pynput		# para obter posições do mouse na tela
	sudo apt install python3-tk		# Necessário para pyautogui
	pip list				# Lista os módulos instalados
	sudo apt install python3-dev
	

#### Conky

Instalação do conky
   
Vá até o diretório conky da máquina:

		cd /etc/conky/
	
Baixe neste diretório os dois arquivos de configuração do conky:

		wget https://raw.githubusercontent.com/HelioGiroto/Brincando-com-o-Terminal/master/conky/conky_info
		wget https://raw.githubusercontent.com/HelioGiroto/Brincando-com-o-Terminal/master/conky/conky_shortcuts
	
 Estes dois arquivos de configuração acima já são chamados dentro do autostart de openbox.

#### VSCodium

Não instalar mais o VS Code - Filtragem de dados pessoais.

Fonte - https://vscodium.com/
	
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg  | gpg --dearmor | \
	'sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
		    
Em seguida:

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
		    | sudo tee /etc/apt/sources.list.d/vscodium.list
		    
E, por fim:		    

sudo apt update && sudo apt install codium


#### Libreoffice - versão mais nova:

Se for preciso eliminar uma versão anterior instalada:
Terminal:
	sudo apt remove --purge Libreoffice*

Em seguida, para instalar: 

	1- Ir a https://pt-br.libreoffice.org/baixe-ja/libreoffice-novo/
	2- Selecionar o sistema operacional = .deb
	3- botão baixar
	4- Baixar tb: Interface traduzida e ajuda.
	5- Ir até a pasta que baixou
	6- Comando no Terminal para descompactar: tar -xf nome.tar.gz
	7- Abre pasta até onde está uma sub-pasta com os arquivos .deb
	8- No Terminal: sudo dpkg -i *.deb

Repetir os passos de 5 a 8 para os arquivos de ajuda e interface em português que foram baixados.

Fonte: https://www.youtube.com/watch?v=9xM5zDM7HcQ

#### pandoc: 
		ver erros em: https://stackoverflow.com/questions/29240290/pandoc-for-windows-pdflatex-not-found
		https://pandoc.org/installing.html
	


### 4.4 - Configuração do comando history:

Mudar a configuração do comando **history** para sem fim e mergeado:

COMO FAZER UM MERGE DOS HISTORIES DE TODOS OS TERMINAIS (INCLUSIVE DO TMUX):

No arquivo ./bashrc procure as linhas abaixo e as edite desta forma:

Código:

``` bash

	# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
	export HISTCONTROL=ignoredups:erasedups  # no duplicate entries

	# don't put duplicate lines or lines starting with space in the history.
	export HISTSIZE=-1                  	 # unlimite history
	export HISTFILESIZE=-1               	 # unlimited history

	# append to the history file, don't overwrite it
	shopt -s histappend                      # append to history, don't overwrite it

	# Save and reload the history after each command finishes
	export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

```

 Agora, tente no terminal:
	 history -a ou -r  # e em seguida
	 history

Fonte - https://github.com/HelioGiroto/Brincando-com-o-Terminal/blob/master/history%20ilimitado%20e%20fusionado.txt


### 4.5 - Habilitar os cliques no pad do touchpad (mouse) 

- Instalar 
		sudo apt install xserver-xorg-input-synaptics
	- Verificar se tem a pasta xorg.conf.d em (se não, criá-la): 
		ls /usr/share/X11/
	- Copiar o arquivo 70-synaptics... a sua pasta de usuário:
		sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/
	- Editar o arquivo 70-synaptics
		sudo gedit /etc/X11/xorg.conf.d/70-synaptics.conf
	- Acrescenta as linhas (Option "TapButton1"... etc) para que esteja desta forma as primeiras linhas:
		```
			Section "InputClass"
				Identifier "touchpad catchall"
				Driver "synaptics"
				MatchIsTouchpad "on"
				Option "TapButton1" "1"
				Option "TapButton2" "3"
		```


### 4.6 - Instalar fontes:

 - Instruções em:
https://raw.githubusercontent.com/HelioGiroto/Brincando-com-o-Terminal/master/COMO-INSTALAR-FONTES.md

	```bash
		# Crie / navega para a seguinte pasta:
		 	cd /usr/local/share/fonts

		# Copie todas as fontes (extensao ttf...) para essa pasta

		# Dê permissões com estes comandos:
			 sudo chown root:staff /usr/local/share/fonts -R
			 sudo chmod 644 /usr/local/share/fonts/* -R
			 sudo chmod 755 /usr/local/share/fonts/


		# compile:  
			 sudo fc-cache -fv
	```



### 4.7 - Configurar a abertura de vídeos no Thunar:
	- Abre o Thunar
	- Seleciona o video 
	- Clic botão direito
	- Abrir com > Definir aplicação padrão > 
	- Digita no espaço correspondente: mplayer %f


  

### 4.8 - Path de Arquivos de configuração
	ver documentação do Bunsenlabs 	- https://forums.bunsenlabs.org/viewtopic.php?id=6461
					- https://gitlab.com/o9000/tint2/blob/master/doc/tint2.md#panel
					- https://forums.bunsenlabs.org/viewtopic.php?id=254
					- https://forums.bunsenlabs.org/search.php?search_id=1316581605&p=5

Conky:


Openbox:
	 - Abra o arquivo:
		.config/openbox/rc.xml


Tint2: 
	 - Salve o arquivo de configuração de tint2 na pasta .config/tint2rc com a extensão .tint2rc
	 - Abra o programa: tint2conf e escolha o tema.
	 - Clique no Visto Verde (canto superior esquerdo).

		https://gitlab.com/o9000/tint2/blob/master/doc/tint2.md
		https://github.com/search?q=tint2rc&type=repositories
		https://terminalroot.com.br/2021/12/os-12-melhores-temas-para-seu-tint2.html
		https://github.com/ututogit/tint2-configs
		ver !!! -> https://github.com/addy-dclxvi/tint2-theme-collections/tree/master/launchy

 
Lxappearance:


jgmenu:
	https://jgmenu.github.io/manual.html
		~/.config/jgmenu/jgmenurc
		
	https://github.com/mati75/jgmenu/blob/master/examples/ex07.sh
	https://arcolinux.com/adding-jgmenu-to-your-openbox-system/


### 4.9 - Configurar os temas do rofi
	 - Salve o arquivo .rasi em usr/share/rofi/themes 
	 - No Terminal abra: rofi-theme-selector
	 - Escolha o theme com as fechas e pressionando ENTER
	 - Para definir como tema atual pressione: Alt + A.
	 - O padrão era o default

### 4.10 - Configurar Slim
	sudo gedit /etc/slim.conf
	cd /usr/share/slim/themes/default


### 4.11 - Instalação de themes Openbox

https://github.com/topics/openbox-theme
https://github.com/zakuradev/openbox-themes
https://github.com/cath3ad/Openbox-Theme-Collections

 - Mover para a pasta: 
	git clone https://github.com/addy-dclxvi/openbox-theme-collections ~/.themes
	git clone https://github.com/addy-dclxvi/Openbox-Theme-Collections ~/.themes

Configurações gerais:
https://github.com/addy-dclxvi/conky-theme-collections
https://github.com/addy-dclxvi/openbox-theme-collections
https://github.com/addy-dclxvi/tint2-theme-collections


Vídeos: 
https://youtube.com/playlist?list=PLqFFYhp2jiyZDxOYBFEkc5oDNzrtlf7yi


ver - https://code.google.com/
 
 
===

## 5. ERROS NA INSTALAÇÃO:

(NA BIOS F2 ou F12 estava como UEFI e não Legacy. Tive que mudar para Legacy)

Pesquisei em: 
		https://answers.microsoft.com/pt-br/windows/forum/all/start-pxe-over-ipv6-e-depois-o-ipv4-antes/6dbf9111-8170-4dc8-b8b1-35daf5e22057
		https://thewindowsclub.blog/pt/start-pxe-over-ipv4-how-to-fix-this-boot-issue/
		https://geekblog.com.br/uefi-ou-legacy-entenda-as-diferencas/
		https://answers.microsoft.com/pt-br/windows/forum/all/qual-a-diferen%C3%A7a-entre-uefi-boot-e-legacy-os/f1405682-2f43-44bc-bb4b-3007d99d4649
		https://ojmoura.wordpress.com/2013/10/07/arranque-seguro-e-uefi/

===


ERRO AO INSTALAR O NPM

Fonte: 
https://sempreupdate.com.br/como-corrigir-os-erros-var-lib-dpkg-lock-ou-o-could-not-get-lock-var-lib-dpkg-lock-frontend/
https://askubuntu.com/questions/1438501/how-to-fix-this-waiting-for-cache-lock-could-not-get-lock-var-lib-dpkg-loc

	sudo rm -rf /var/lib/apt/lists/lock
	
	# Se não, tentar tb:
	sudo rm /var/lib/dpkg/lock
	sudo rm /var/cache/apt/archives/lock
	
	# Pode tb tentar:
	sudo rm /var/lib/dpkg/lock-frontend
	sudo dpkg --configure -a
	sudo apt update
	sudo apt-get -f install
	
	# Em seguida: 
	sudo kill -9 3321
	sudo kill -9 36696
	# sendo que 3321 pode ser outro nro que no Terminal seja indicado.

	
===
