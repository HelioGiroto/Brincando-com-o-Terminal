# Mudando as cores do Terminal

## MUDANDO A COR DO PROMPT:

- Para cor ciano no path atual:
`PS1='\[\e[0;32m\]\u@\h:\[\e[1;36m\]\w\$\[\e[0m\] '`

- Para cor amarela no path atual:
`PS1='\[\e[0;32m\]\u@\h:\[\e[1;33m\]\w\$\[\e[0m\] '`

Adicione a linha acima no `.bashrc` se quiser que persista o resultado.

Acima foram escolhidas as cores: 
- 0;32 para usuário e computador
- 0;33 para diretório atual

### Número das cores PARA PROMPT:

**Estilos (primeiro número):**
0 → normal
1 → negrito / brilhante
4 → sublinhado
7 → inversão de cores

**Cores (segundo número — foreground):**
30 → preto
31 → vermelho
32 → verde
33 → amarelo
34 → azul
35 → magenta
36 → ciano
37 → branco
90–97 → cores neon/brilhantes (cinzas e cores fosforescentes)


---



## MUDANDO A COR DA SAÍDA DA LISTAGEM (LS) DE DIRETÓRIOS (LS COLORS):

Teste de cores para ls-colors:
```
for c in "30 Preto" "31 Vermelho" "32 Verde" "33 Amarelo" "34 Azul" "35 Magenta" "36 Ciano" "37 Branco" "90 Preto-brilhante" "91 Vermelho-brilhante" "92 Verde-brilhante" "93 Amarelo-brilhante" "94 Azul-brilhante" "95 Magenta-brilhante" "96 Ciano-brilhante" "97 Branco-brilhante"; do     code=$(echo $c | awk '{print $1}');     name=$(echo $c | cut -d' ' -f2-);     echo -e "\e[${code}m${name} (${code})\e[0m"; done
```

- Teste: 

` LS_COLORS="di=37;44" && export LS_COLORS `


### Exemplos:

Mudando a cor dos diretórios para fundo azul: 
LS_COLORS="di=37;44" && export LS_COLORS

Mudando a cor dos diretórios para fundo amarelo: 
LS_COLORS="di=37;43" && export LS_COLORS

Mudando a cor dos diretórios para fundo amarelo + letra preta: 
LS_COLORS="di=30;43" && export LS_COLORS

Mudando a cor dos diretórios para fundo amarelo brilhante + letra preta: 
LS_COLORS="di=30;103" && export LS_COLORS


### Cores do texto - foreground

**Cores Padrão:**

| Código | Cor do Texto         |
| ------ | -------------------- |
| **30** | Preto                |
| **31** | Vermelho             |
| **32** | Verde                |
| **33** | Amarelo              |
| **34** | Azul                 |
| **35** | Magenta              |
| **36** | Ciano                |
| **37** | Branco (cinza claro) |

**Cores Brilhantes:**

| Código | Cor do Texto                   |
| ------ | ------------------------------ |
| **90** | Preto brilhante / cinza escuro |
| **91** | Vermelho brilhante             |
| **92** | Verde brilhante / neon         |
| **93** | Amarelo brilhante (ouro claro) |
| **94** | Azul brilhante / neon          |
| **95** | Magenta brilhante              |
| **96** | Ciano brilhante                |
| **97** | Branco brilhante               |


### Cores de fundo - Background

**Cores Padrão:**

| Código | Cor de Fundo         |
| ------ | -------------------- |
| **40** | Preto                |
| **41** | Vermelho             |
| **42** | Verde                |
| **43** | Amarelo              |
| **44** | Azul                 |
| **45** | Magenta              |
| **46** | Ciano                |
| **47** | Branco (cinza claro) |


**Cores Brilhantes:**

| Código  | Cor de Fundo                   |
| ------- | ------------------------------ |
| **100** | Preto brilhante / cinza escuro |
| **101** | Vermelho brilhante             |
| **102** | Verde brilhante                |
| **103** | Amarelo brilhante              |
| **104** | Azul brilhante                 |
| **105** | Magenta brilhante              |
| **106** | Ciano brilhante                |
| **107** | Branco brilhante               |


---


## Configurando o bashrc para persistir as cores:


| Código | Significado                   | Quando aparece                              | Exemplo                             |
| ------ | ----------------------------- | ------------------------------------------- | ----------------------------------- |
| **di** | *directory* (diretório/pasta) | `ls` mostra uma pasta                       | `Documents/`                        |
| **fi** | *file* (arquivo comum)        | qualquer arquivo normal                     | `texto.txt`                         |
| **ln** | *link* (link simbólico)       | arquivos que apontam para outro             | `meu_link -> /path/real`            |
| **pi** | *pipe*, FIFO                  | comunicação entre programas                 | arquivos raros, ex.: `/tmp/pipe`    |
| **so** | *socket*                      | comunicação de rede entre processos         | `/var/run/docker.sock`              |
| **bd** | *block device*                | dispositivos de bloco                       | `/dev/sda`                          |
| **cd** | *character device*            | dispositivos de caractere                   | `/dev/tty`, `/dev/null`             |
| **or** | *orphan symlink* (link órfão) | link que aponta para um arquivo inexistente | `broken_link`                       |
| **mi** | *missing file*                | arquivo inexistente listado por script      | —                                   |
| **ex** | *executable*                  | arquivo com permissão de execução           | scripts, programas, `.sh`, binários |

- Appenda no bashrc:
(mas antes coloque tudo em uma linha (sem a barra de escape \):


export LS_COLORS='di=30;46:fi=0:ln=1;36:or=1;31:ex=1;32:*.mp3=36:*.ogg=36:*.wav=36:*.flac=36:*.m4a=36:*.aup3=36:*.mp4=35:*.mkv=35:*.mov=35:*.avi=35:*.wmv=35:*.jpg=94:*.jpeg=94:*.png=94:*.webp=94:*.gif=94:*.bmp=94:*.svg=94:*.md=93:*.MD=93:*.txt=97:*.html=97:*.css=32:*.pdf=91:*.PDF=91:*.csv=32:*.xls=32:*.xlsx=32:*.sh=1;92:*.bash=1;92:*.py=1;94:*.js=1;33:*.json=1;33:*.xml=1;33:*.tmp=90:*.zip=90:*.wpress=90:*.deb=90:*.rs=31'

```
export LS_COLORS='\
di=30;46:\
fi=0:\
ln=1;36:\
or=1;31:\
ex=1;32:\
*.mp3=36:\
*.ogg=36:\
*.wav=36:\
*.flac=36:\
*.m4a=36:\
*.aup3=36:\
*.mp4=35:\
*.wav=35:\
*.mkv=35:\
*.mov=35:\
*.avi=35:\
*.wmv=35:\
*.jpg=94:\
*.jpeg=94:\
*.png=94:\
*.webp=94:\
*.gif=94:\
*.bmp=94:\
*.svg=94:\
*.md=93:\
*.MD=93:\
*.txt=97:\
*.html=97:\
*.css=32:\
*.pdf=91:\
*.PDF=91:\
*.csv=32:\
*.xls=32:\
*.xlsx=32:\
*.sh=1;92:\
*.bash=1;92:\
*.py=1;94:\
*.js=1;33:\
*.json=1;33:\
*.xml=1;33:\
*.zip=90:\
*.tmp=90:\
*.wpress=90:\
*.deb=90:\
*.rs=31'

```



#### Definitivo (6/12/2025):

# para prompt:
PS1='\[\e[0;32m\]\u@\h:\[\e[1;36m\]\w\$\[\e[0m\] '

# para ls colors:
LS_COLORS="di=30;46:*.sh=1;92:*.mp3=36:*.m4a=36:*.aup3=36:*.py=1;94:*.js=1;33:\
*.json=1;33:*.xml=1;33:*.jpg=94:*.jpeg=94:*.png=94:*.pdf=91:\
*.wav=35:*.mp4=35:*.md=93:*.txt=97:*.html=97:*.csv=32:*.xls=32:\
*.xlsx=32:*.zip=90:*.wpress=90:*.deb=90" ls -lX












