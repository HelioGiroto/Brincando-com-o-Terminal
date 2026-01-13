# GUIA DEFINITIVO — PyAutoGUI (PT-BR)
## Mouse • Teclado • Mensagens • Screenshot • Reconhecimento por Imagem

Este documento reúne **TODOS os comandos essenciais do PyAutoGUI**,
com **comentários explicativos em cada comando**, servindo como
guia final para estudos, RPA e automação profissional.

---

## 📦 IMPORTAÇÃO

```python
import pyautogui  # Importa a biblioteca PyAutoGUI
```

---

## 🖥️ INFORMAÇÕES DA TELA E DO MOUSE

```python
# Retorna a largura e altura da tela principal
screenWidth, screenHeight = pyautogui.size()

# Retorna a posição atual do cursor do mouse (X, Y)
currentMouseX, currentMouseY = pyautogui.position()
```

---

## 🖱️ MOVIMENTAÇÃO DO MOUSE

```python
# Move o mouse para a posição absoluta (100, 150)
pyautogui.moveTo(100, 150)

# Move o mouse 10 pixels para baixo mantendo o eixo X atual
pyautogui.move(None, 10)

# Move suavemente o mouse até (500, 500) em 2 segundos
pyautogui.moveTo(500, 500, duration=2, tween=pyautogui.easeInOutQuad)

# Scroll para cima
pyautogui.scroll(10)        

# Scroll para baixo
pyautogui.scroll(-10)       

# Scroll horizontal (Linux/macOS)
pyautogui.hscroll(10)       

```

---

## 🎯 CLIQUES DO MOUSE

```python
# Clica na posição atual do mouse
pyautogui.click()

# Move o mouse até (200, 220) e executa o clique
pyautogui.click(200, 220)

# Executa um duplo clique
pyautogui.doubleClick()

# Clique direito:
pyautogui.click(button='right')      

# Pressiona botão
pyautogui.mouseDown()                      

# Solta botão
pyautogui.mouseUp()                        

# Arrasta até posição absoluta
pyautogui.dragTo(300, 300, duration=1)     

# Arrasta 100px à direita
pyautogui.drag(100, 0, duration=1)         
```

---

## ⌨️ DIGITAÇÃO E TECLADO

```python
# Digita o texto com intervalo entre as teclas
pyautogui.write('Hello world!', interval=0.25)
pyautogui.typewrite("Hello, world!") 

# Pressiona a tecla ESC
pyautogui.press('esc')

# Mantém a tecla SHIFT pressionada
pyautogui.keyDown('shift')

# Pressiona a seta esquerda várias vezes
pyautogui.write(['left', 'left', 'left', 'left', 'left', 'left'])

# Pressiona 3 vezes:
pyautogui.press("left", presses=3)           

# Solta a tecla SHIFT
pyautogui.keyUp('shift')

# Executa o atalho Ctrl + C
pyautogui.hotkey('ctrl', 'c')

# Executa atalho com 3 teclas:
pyautogui.hotkey("ctrl", "shift", "esc")

# Shift mais setas:
with pyautogui.hold("shift"):
    pyautogui.press(["left", "left", "left"])
```


### Monitorar Posição do Mouse em Tempo Real

```python
import pyautogui

print("Pressione Ctrl+C para sair")
try:
    while True:
        x, y = pyautogui.position()   # Captura posição atual do mouse
        print(f"X: {x:4}  Y: {y:4}", end="\r")
except KeyboardInterrupt:
    print("\nFinalizado")
```

### Desenho em Espiral

```python
distance = 200
while distance > 0:
    pyautogui.drag(distance, 0, 0.5)       # Direita
    distance -= 5
    pyautogui.drag(0, distance, 0.5)       # Baixo
    pyautogui.drag(-distance, 0, 0.5)      # Esquerda
    distance -= 5
    pyautogui.drag(0, -distance, 0.5)      # Cima
```

### Desenho em Círculo

```python
import math

raio = 100
centro_x, centro_y = pyautogui.position()

for angulo in range(0, 360, 5):
    x = centro_x + raio * math.cos(math.radians(angulo))
    y = centro_y + raio * math.sin(math.radians(angulo))
    pyautogui.dragTo(x, y, duration=0.01)
```

---

## 🪟 CAIXAS DE DIÁLOGO (GUI - MESSAGE BOX)

```python
# Exibe uma caixa de alerta simples
pyautogui.alert('Esta é uma caixa de alerta')

# Exibe uma caixa de confirmação
pyautogui.confirm('Confirma?')

# Caixa de confirmação com botões personalizados
pyautogui.confirm('Entre com uma opção:', buttons=['A', 'B', 'C'])

# Solicita entrada de texto
pyautogui.prompt('Qual o seu nome?')

# Solicita senha com caracteres ocultos
pyautogui.password('Entre com a senha (será ocultado):')
```

---

## 📸 CAPTURA DE TELA (SCREENSHOT)

```python
# Captura a tela inteira
im1 = pyautogui.screenshot()

# Salva a captura em arquivo
im1.save('my_screenshot.png')

# Captura e salva diretamente no arquivo
im2 = pyautogui.screenshot('my_screenshot2.png')
```

---

## 🔍 LOCALIZAÇÃO DE ELEMENTOS POR IMAGEM

```python
# Localiza uma imagem na tela (left, top, width, height)
button7location = pyautogui.locateOnScreen('button.png')

# Calcula o centro da imagem encontrada
buttonx, buttony = pyautogui.center(button7location)

# Clica no centro da imagem localizada
pyautogui.click(buttonx, buttony)

# Localiza todas as ocorrências da imagem na tela
todos_botoes = pyautogui.locateAllOnScreen('someButton.png')
```

---


## LISTA DE TODAS AS TECLAS COM SEUS NOMES: 
```
['\t', '\n', '\r', ' ', '!', '"', '#', '$', '%', '&', "'", '(',
')', '*', '+', ',', '-', '.', '/', '0', '1', '2', '3', '4', '5', '6', '7',
'8', '9', ':', ';', '<', '=', '>', '?', '@', '[', '\\', ']', '^', '_', '`',
'a', 'b', 'c', 'd', 'e','f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '|', '}', '~',
'accept', 'add', 'alt', 'altleft', 'altright', 'apps', 'backspace',
'browserback', 'browserfavorites', 'browserforward', 'browserhome',
'browserrefresh', 'browsersearch', 'browserstop', 'capslock', 'clear',
'convert', 'ctrl', 'ctrlleft', 'ctrlright', 'decimal', 'del', 'delete',
'divide', 'down', 'end', 'enter', 'esc', 'escape', 'execute', 'f1', 'f10',
'f11', 'f12', 'f13', 'f14', 'f15', 'f16', 'f17', 'f18', 'f19', 'f2', 'f20',
'f21', 'f22', 'f23', 'f24', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9',
'final', 'fn', 'hanguel', 'hangul', 'hanja', 'help', 'home', 'insert', 'junja',
'kana', 'kanji', 'launchapp1', 'launchapp2', 'launchmail',
'launchmediaselect', 'left', 'modechange', 'multiply', 'nexttrack',
'nonconvert', 'num0', 'num1', 'num2', 'num3', 'num4', 'num5', 'num6',
'num7', 'num8', 'num9', 'numlock', 'pagedown', 'pageup', 'pause', 'pgdn',
'pgup', 'playpause', 'prevtrack', 'print', 'printscreen', 'prntscrn',
'prtsc', 'prtscr', 'return', 'right', 'scrolllock', 'select', 'separator',
'shift', 'shiftleft', 'shiftright', 'sleep', 'space', 'stop', 'subtract', 'tab',
'up', 'volumedown', 'volumemute', 'volumeup', 'win', 'winleft', 'winright', 'yen',
'command', 'option', 'optionleft', 'optionright']
```
---




Fontes: 
----
https://pyautogui.readthedocs.io/en/latest/quickstart.html
https://pypi.org/project/PyAutoGUI/



