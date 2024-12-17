# Automação em Wayland

## AUTOMATIZANDO O TECLADO

### wtype
https://man.uex.se/1/wtype

Instalar:
`sudo apt install wtype`

 


## AUTOMATIZANDO O TECLADO E MOUSE

###  ydotool
https://www.mankier.com/1/ydotool
https://man.archlinux.org/man/ydotool.1
https://www.gsp.com/cgi-bin/man.cgi?topic=YDOTOOL
https://github.com/ReimuNotMoe/ydotool
https://gist.github.com/shellheim/e35c44ad0426f37550b68ad1082be15c
https://gabrielstaples.com/ydotool-tutorial/#gsc.tab=0

Instalar:
`sudo apt install ydotool`


Currently implemented command(s):

```
	click - Click on mouse buttons
	mousemove - Move mouse pointer to absolute position
	type - Type a string
	key - Press keys
	debug - Print the socket, number of parameters and parameter values
	bakers - Show the honorable bakers
	stdin - Sends the key presses as it was a keyboard (i.e from ssh) See PR #229
```


**Script para Whatsapp Web**


- Pega as coordenadas
`wev -g`

1. Coloca a tela xadrez sobre a tela que vai ser clicada
2. Super+Flecha-acima:	Para crescer a tela xadrez.
3. Clica sobre a posição e observa no terminal qual a coordenada.



Clica em Grupos
385X224
ydotool mousemove --absolute 385 224
	Ctrl + Alt + / 		37:1 64:1 97:1
Digita nome do grupo
Enter
Entra com a mensagem
Enter

Teste: 
`sleep 3; ydotool key "ctrl+alt+/" && sleep 2 &&  ydotool type "J24h" && ydotool key enter`

`sleep 3; ydotool mousemove --absolute 385 224 && sleep 2 &&  ydotool type "J24h" && ydotool key enter`


**Examples**

Syntax: 
`<keycode>:<pressed>`

(where :1 for pressed means the key is down and then :0 means the key is released)


### Keyboard Commands
`key [-d,--key-delay <ms>] [<KEYCODE:PRESSED> ...]`

Type a given keycode.

e.g. 28:1 28:0 means pressing on the Enter button on a standard US keyboard. (where :1 for pressed means the key is down and then :0 means the key is released)

42:1 38:1 38:0 24:1 24:0 38:1 38:0 42:0 - "LOL"

Non-interpretable values, such as 0, aaa, l0l, will only cause a delay.

See `/usr/include/linux/input-event-codes.h' for available key codes (KEY_*).

You can find the key name/number your keyboard is sending to libinput by running `sudo libinput record` and then selecting your keyboard from the list it will show you the libinput proper key name and number for each key you press.

Options: -d,--key-delay <ms>

Delay time between keystrokes. Default 12ms.

*Examples*

Start the ydotool daemon in the background:
`ydotoold`

Perform a left click input:
`ydotool click 0xC0`

Perform a right click input:
`ydotool click 0xC1`

Input Alt+F4:
`ydotool key 56:1 62:1 62:0 56:0`

ydotool key "42:1 38:1 38:0 24:1 24:0 38:1 38:0 42:0"

ydotool type "testandooo"

---


*Syntax (mouse click):*
`ydotool click -h # help`


How to specify buttons:
Now all mouse buttons are represented using hexadecimal numeric values, with an optional bit mask to specify if mouse up/down needs to be omitted.
 
```     
	-r, --repeat=N             Repeat entire sequence N times
	-D, --next-delay=N         Delay N milliseconds between input events (up/ own, a complete click means doubled time)
	-h, --help                 Display this help and exit
	
	0x00: chooses left button, but does nothing (you can use this to implement extra sleeps)
	0xC0: left button click (down then up)
	0x41: right button down
	0x82: middle button up
	0x00 - LEFT
	0x01 - RIGHT
	0x02 - MIDDLE
	0x03 - SIDE
	0x04 - EXTR
	0x05 - FORWARD
	0x06 - BACK
	0x07 - TASK
	0x40 - Mouse down
	0x80 - Mouse up
```

*Syntax (Mouse move):*
`ydotool mousemove -h`

```
	 Options:
	   -w, --wheel                Move mouse wheel relatively
	   -a, --absolute             Use absolute position, not applicable to wheel
	   -x, --xpos                 X position
	   -y, --ypos                 Y position
	   -h, --help                 Display this help and exit
```


Switch to tty1 (Ctrl+Alt+F1), wait 2 seconds, and type some words:
`ydotool key 29:1 56:1 59:1 59:0 56:0 29:0; sleep 2; ydotool type 'echo Hey guys. This is Austin.'`

Close a window in graphical environment (Alt+F4):
`ydotool key 56:1 62:1 62:0 56:0`

Relatively move mouse pointer to -100,100:
`ydotool mousemove -x -100 -y 100`

Move mouse pointer to 100,100:
`ydotool mousemove --absolute -x 100 -y 100`

Mouse right click:
`ydotool click 0xC1`

Mouse repeating left click:
`ydotool click --repeat 5 --next-delay 25 0xC0`

Repeat the keyboard presses from stdin:
`ydotool stdin`

Aguarda 5 segundos e escreve Ubuntu: 
`sleep 5; ydotool type "Ubuntu"`



