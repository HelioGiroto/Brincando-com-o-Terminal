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

Caso não se autorize acessar o pendrive, chamar o programa como root:

`sudo gnome-multi-writer`



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

Próximo passo: [2 - Instalar pacotes essenciais para o Openbox](2-Pacotes-essenciais.md)


