# Vim configurações

## COMO INSTALAR PLUGINS NO VIM

### 1.Clona repositório do Vundle:
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

### 2. Cola o conteúdo indicado em .vimrc:
- Vá até o site: https://github.com/VundleVim/Vundle.vim
- Em "3. Configure Plugins:" copia todo o conteúdo para o arquivo .vimrc
- Pode comentar (com ") todos as linhas que iniciam com "Plugin" exceto:
    Plugin 'VundleVim/Vundle.vim'
- Salva e sai
- Resumindo: Copia o arquivo `vimrc` deste repositório para a home da sua máquina.


### 3. Reabra o vim e execute o seguinte comando:
:PluginInstall

**Terminado!**

Fonte: https://www.youtube.com/watch?v=gvigqbKeScw
Fonte: https://www.youtube.com/watch?v=S7Yis6-5K9w
Fonte: https://github.com/VundleVim/Vundle.vim/blob/v0.10.2/doc/vundle.txt


### 4. Para instalar um plugin
- Basta acrescentar no arquivo .vimrc o comando `Plugin 'nomePlugin'`, conforme o site Vim Awesome, por exemplo.
- Em seguida, os comandos:
     
```
        :source %
        :PluginInstall
```

### Plugins interessantes:
- Site: https://vimawesome.com/
https://vimawesome.com/plugin/emmet-vim
https://vimawesome.com/plugin/nerdtree-red
https://vimawesome.com/plugin/lightline-vim



## COMO INSTALAR UM TEMA NO VIM
- Encontre e baixe o tema para seu computador. (Geralmente é um arquivo .vim)
- Vá até a pasta `~/.vim/colors/` e copie o arquivo dentro dela.
- Acrescente no arquivo `~/.vimrc`, os seguintes comandos:

```
    syntax enable
    colorscheme nomeDoTema
```



## Problemas com o register do Linux/Mac:

**Não aparece o registro + de clipboard (de transferir para outros programas)**
*(O registro + é o unnamed register)*

(No Mac OS é o "*)

Testar:

- Copia algo do vim (yy, por exemplo)
- :registers
- Observa se aparece o conteúdo da linha em "+
	- Se não: instala no Terminal: sudo apt install vim-gtk3
- Depois comando:
	- set clipboard=unnamedplus
- Faz nova tentativa de copiar a linha e verifica que se copiou para o buffer de transferência.


---

Fontes:
https://stackoverflow.com/questions/18385084/vim-system-register-and-not-working#54269104
https://superuser.com/questions/235505/compiling-vim-with-xterm-clipboard-support




