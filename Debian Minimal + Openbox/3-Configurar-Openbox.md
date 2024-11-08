# Configuração do Openbox 

A seguir algumas configurações necessárias para o funcionamento do sistema:

## 1- Habilitar os cliques no pad do touchpad (mouse) 

- Instalar se não foi feito: `sudo apt install xserver-xorg-input-synaptics`

- Vá atá a pasta seguinte: `cd /usr/share/X11/`

- Crie um diretório (verificar se já não existe) de nome: *xorg.cof.d*: `mkdir xorg.cof.d`

(Se quiser verificar antes: `ls /usr/share/X11/xorg.conf.d/`)

- Copiar o arquivo 70-synaptics... para a sua pasta correta, com o seguinte comando: `sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/`


- Editar o arquivo 70-synaptics: `sudo gedit /etc/X11/xorg.conf.d/70-synaptics.conf`

- Acrescenta aí as linhas (Option "TapButton1"... etc) para que esteja desta forma as linhas:

```bash
Section "InputClass"
	Identifier "touchpad catchall"
	Driver "synaptics"
	MatchIsTouchpad "on"
	Option "TapButton1" "1"
	Option "TapButton2" "3"
```

## 2- Configuração do Wifi:

(Mais informações no arquivo: [wifi-bluetooth](wifi-bluetooth.md))

### Para ativar o Wifi do seu computador sempre que inicie:

_(Não é necessário caso na instalação do Debian foi colocada a senha do wifi)_

**Comando TLP**

Este comando controla recursos do computador como wifi, bluetooth, etc...
Servirá para habilitar o wifi sempre quando inicie o computador.

- Em seguida, configure o arquivo de configuração do TLP...:

`sudo gedit /etc/tlp.conf`

- **Des**-comente a linha:

`DEVICES_TO_ENABLE_ON_STARTUP="bluetooth wifi wwan"`


### Comando para conectar-se com um roteador wifi:

- Encontre wifi´s por perto, escolha e digite a senha:

`nmtui-connect`

- Para editar a senha já salva de uma wifi: 

`nmtui-edit`

ou:

`nmtui`



## 3- Configuração do comando history:

Mudar a configuração do comando **history** para sem fim e mergeado:

(Como fazer um merge dos histories de todos os terminais (inclusive do tmux))

No arquivo **.bashrc** procure as linhas abaixo e as edite desta forma:

Código:

```bash

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

```bash
history -a ou -r  # e em seguida
history
```

Fonte - https://github.com/HelioGiroto/Brincando-com-o-Terminal/blob/master/history%20ilimitado%20e%20fusionado.txt


## 4- Configurar o ambiente do Openbox

Neste ponto serão configurados o ambiente gráfico do Openbox, ou seja, os comandos: conky, tint2, lxterminal, ...

Duas opções: Por script ou manualmente:

**Instalar via script:**

Se recomenda já ter clonado o repositório "Brincando com o Terminal" do Github na própria máquina, na pasta "home" ou equivalente.

`git clone https://github.com/HelioGiroto/Brincando-com-o-Terminal.git`

E rode o seguinte comando no Terminal:

`curl https://raw.githubusercontent.com/HelioGiroto/Brincando-com-o-Terminal/refs/heads/master/Debian%20Minimal%20%2B%20Openbox/arquivos_de_configuracao/configura_openbox.sh | bash`


**Instalar "manualmente":**

 - Vá até a pasta dos arquivos de configuração, no repositório:
`cd Brincando-com-o-Terminal/Debian\ Minimal\ +\ Openbox/arquivos-de-configuracao`

 - Em cada pasta copie todo seu conteúdo para as pastas correspondentes da máquina. A saber:

 - Conky: ~/etc/conky
 - LxTerminal:  ~/.config/lxterminal
 - Openbox: ~/.config/openbox
 - Rofi: ~/.config/rofi
 - Thunar: ~/.config/Thunar
 - Tint2: ~/.config/tint2
 


## 5- Configurar Slim:
```bash
	sudo gedit /etc/slim.conf
	cd /usr/share/slim/themes/default
```



## 6- Configurar os temas do rofi:
 - Salve o arquivo .rasi em usr/share/rofi/themes 
 - No Terminal abra: rofi-theme-selector
 - Escolha o theme com as fechas e pressionando ENTER
 - Para definir como tema atual pressione: Alt + A.
 - O padrão era o default



## 7- Instalar fontes:

 - Instruções em:
https://raw.githubusercontent.com/HelioGiroto/Brincando-com-o-Terminal/master/COMO-INSTALAR-FONTES.md

*Opção - Fazer pull das fontes que estão nesse repósitorio.*

Código:

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


## 8- Módulos do python:

Tentar primeiramente isto:
```bash
	sudo apt install python3-\[nome-do-módulo]
	sudo apt install python3-pip	# para instalar pip
```

Instalar módulos para automação. Só aceita este formato de comando:
```bash
	pip install python3-pyautogui		
```

**ERRO**: Se aparece a mensagem de erro: *"...externally-managed-environment..."*, usar esta sintaxe:

```bash
	pip install --break-system-packages pyautogui
```

(Fonte: https://stackoverflow.com/questions/75608323/how-do-i-solve-error-externally-managed-environment-every-time-i-use-pip-3)


Módulos essenciais:
```bash
	pip install --break-system-packages pyautogui python3-pynput python3-tk python3-dev 
```

Descrição dos módulos:

- Para obter posições do mouse na tela: `sudo apt install python3-pynput`

- Necessário para pyautogui: `sudo apt install python3-tk`

- Ver tb: `sudo apt install python3-dev`


Listar os módulos instalados (no Terminal - fora do Python):
```bash
	pip list
```

**Módulo ScreenCopy - scrcpy - Instalação e Habilitação:**

ver: [Instalação de scrcpy](Instalação de scrcpy.md)



## 9- Instale e ative o firewall

Deixe ativada o estado de firewall da sua máquina:

`sudo gufw`

Para configurar e mais informações de comandos para segurança, ver em: 
"Terminal - Comandos e Programas" o arquivo: "comandos-para-seguranca.md"

---


**Próximo passo: [4 - Instalar programas]()**



