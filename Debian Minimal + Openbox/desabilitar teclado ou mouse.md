# Como habilitar e desabilitar teclado/mouse:


# MELHOR OPÇÃO - para travar tela:

xtrlock


=======

Comando de Terminal: xinput

https://askubuntu.com/questions/160945/is-there-a-way-to-disable-a-laptops-internal-keyboard#:~:text=To%20disable%20the%20keyboard%2C%20execute,second%20number%20we%20noted%20down.
https://superuser.com/questions/1433720/how-to-disable-whole-keyboard-in-linux/1433863
https://askubuntu.com/questions/160945/is-there-a-way-to-disable-a-laptops-internal-keyboard/178741#178741

						id			master number
						 v			  v
$ xinput list
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳         USB Keyboard Consumer Control   	id=13	[slave  pointer  (2)]
⎜   ↳ YSPRINGTECH USB OPTICAL MOUSE           	id=10	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Power Button                            	id=6	[slave  keyboard (3)]
    ↳ Video Bus                               	id=7	[slave  keyboard (3)]
    ↳ Power Button                            	id=8	[slave  keyboard (3)]
    ↳ Sleep Button                            	id=9	[slave  keyboard (3)]
    ↳         USB Keyboard                    	id=11	[slave  keyboard (3)]
    ↳         USB Keyboard System Control     	id=12	[slave  keyboard (3)]
    ↳ USB 2.0 Camera: USB Camera              	id=14	[slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard            	id=15	[slave  keyboard (3)]
    ↳         USB Keyboard Consumer Control   	id=16	[slave  keyboard (3)]


$ xinput float 10
$ xinput reattach 10 2


## Problema: Se o usuário desconectar e reconectar da USB o periférico volta a funcionar.


