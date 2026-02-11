# WMCTRL

Comando que interage com gerenciadores de janelas X11 no Linux.


wmctrl -l				- Lista as janelas abertas 
wmctrl -a "Firefox" 	- Dá foco a janela do navegador Firefox que esteja aberta
wmctrl -c "Gedit"		- Fecha a janela do Gedit que esteja aberta
wmctrl -a -x "Chrome"	- Dá foco 
wmctrl -Y "Thunar"		- Minimiza a janela do Thunar
wmctrl -a  "python3 como dar focus numa janela"	- Dá foco a janela que tenha esse título (não precisa ser a frase completa de título)


Não existe um substituto direto único para o
wmctrl no Wayland devido à sua arquitetura de segurança, mas alternativas como ydotool, wtype, e wlrctl oferecem funcionalidades similares de automação. 


## Uso no Python:

```python

import subprocess

def focus_window(window_title):
    # -a: Ativa (foca) a janela cujo título contém a string
    subprocess.run(["wmctrl", "-a", window_title])

# Exemplo: Focar no Firefox
focus_window("Firefox")

```
