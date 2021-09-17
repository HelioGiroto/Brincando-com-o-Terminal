# COMO INSTALAR O OPENBOX

1. Baixar a ISO do Debian minimal e criar disco de instalação no USB
	- Para 64 bits: amd64
	- Para 32 bits: i386

2. Arrancar o computador pelo USB já conectado na máquina a ser formatada:
	- Lenovo: F11 e/ou TAB
	- Mudar para iniciar boot pelo USB

3. Instalar de modo visual e restartar sem o USB de instalação

4. Reiniciar a máquina digitando nome do usuário e senha

5. Comando su com senha do administrador:
	~~~ su ~~~

6. Instalar por apt os principais pacotes para funcionamento do openbox:
	~~~ apt install openbox xinit aptitude slim lxterminal menu obconf nitrogen compton tint2 thunar arandr rofi ~~~

7. Reiniciar a máquina

8. Ao abrir inicia com o slim, então digita o usuário e senha

9. Abre o terminal usando o botão mouse direito e aplications até encontrar lxterminal...

10. Instalar sudo
	~~~ 
	su
	# passa senha 
	apt install sudo
	~~~

11. Configura sudo
	~~~ 
	su
	vim /etc/sudoers
	# acrescenta abaixo à linha root ALL...
	usuario ALL=(ALL:ALL) ALL
	# salva forçando - :w!
	~~~

12. Instala outros pacotes essenciais:
	~~~ sudo apt install lxapperance conky bc gawk sed lynx curl wget html-xml-utils xclip ffmpeg imagemagick youtube-dl nmap gnumeric abiword htop mc ranger mupdf alpine colordiff feh fswebcam dialog jq numix-icon-theme-circle git gimp hugo ~~~ 


13. Instala o VSCode:
	- Entra no site, baixa e instala como se fosse pacote apt install (na pasta onde o arq foi baixado). 


14. Configura o openbox usando o script abaixo
	~~~ bash configura-openbox.sh ~~~


 

