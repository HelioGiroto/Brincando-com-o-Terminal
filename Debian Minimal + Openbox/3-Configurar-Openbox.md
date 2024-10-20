# Configuração do Openbox 

A seguir algumas configurações necessárias para o funcionamento do sistema:

## 1- Configuração do comando history:

Mudar a configuração do comando **history** para sem fim e mergeado:

(Como fazer um merge dos histories de todos os terminais (inclusive do tmux))

No arquivo **./bashrc** procure as linhas abaixo e as edite desta forma:

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



## 2- Habilitar os cliques no pad do touchpad (mouse) 

- Instalar se não foi feito:
```bash
sudo apt install xserver-xorg-input-synaptics
```

- Crie um diretório (verificar se já não existe) de nome: *xorg.cof.d* dentro de /usr/share/X11/ - para verificar:

```bash 
ls /usr/share/X11/xorg.conf.d/
```


- Copiar o arquivo 70-synaptics... a sua pasta de usuário, com o seguinte comando:
```bash
sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/
```


- Editar o arquivo 70-synaptics:
```bash
sudo gedit /etc/X11/xorg.conf.d/70-synaptics.conf
```


- Acrescenta as linhas (Option "TapButton1"... etc) para que esteja desta forma as primeiras linhas:

```bash
Section "InputClass"
	Identifier "touchpad catchall"
	Driver "synaptics"
	MatchIsTouchpad "on"
	Option "TapButton1" "1"
	Option "TapButton2" "3"
```


## 3- Instalar fontes:

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


## 4- Módulos do python:

Tentar primeiramente isto:
```bash
	sudo apt install python3-\[nome-do-módulo]
	sudo apt install python3-pip	# para instalar módulos
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
	- Para obter posições do mouse na tela:
	sudo apt install python3-pynput		
	- Necessário para pyautogui:
	sudo apt install python3-tk		
	-  
	sudo apt install python3-dev

Listar os módulos instalados (no Terminal - fora do Python):
```bash
	pip list
```


## 5- Configurar os temas do rofi:
 - Salve o arquivo .rasi em usr/share/rofi/themes 
 - No Terminal abra: rofi-theme-selector
 - Escolha o theme com as fechas e pressionando ENTER
 - Para definir como tema atual pressione: Alt + A.
 - O padrão era o default


## 6- Configurar Slim:
```bash
	sudo gedit /etc/slim.conf
	cd /usr/share/slim/themes/default
```


## 7- Baixar (wget) os arquivos de configuração deste repositório:
	para Lxterminal, Thunar, Conky, etc...




## scrcpy - Instalação e Habilitação:
	ver:
	![Instalação de scrcpy](Instalação de scrcpy.md)

**Próximo passo: ![4 - Instalar programas]()**

