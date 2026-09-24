# COMANDO NCFTP - NEW CLIENT FTP**

Sube arquivos a um site por linha de comando. (Como se fosse subir ao cPanel, mas via terminal)

- Uso: Pode ser usado em caso de Agente na VPS precisa criar uma página html dinâmica e subí-la para a hospedagem do site (Hostgator) na pasta public_html, por ex.


- Instala comando na VPS (Hermes):
` sudo apt install ncftp ` 


- Executa o comando para enviar arquivo (arq.html) da máquina para o site: 
` ncftpput -u "nome_usuario" -p "senha" ftp.nome_site.com.br /public_html ./arq.html `


- Para subir uma pasta inteira (relatorios) para o site:
` ncftpput -R -u "usuario_ftp" -p "senha123" ftp.seusite.com.br /public_html ./relatorios/ `


- Para ocultar as credenciais: 

	- Crie o arquivo: `login.cfg`:
	```
	host ftp.seusite.com.br
	user usuario_ftp
	pass senha123
	```
	
	- Restinja a leitura de login.cfg para que somente o dono consiga lê-lo:
	`chmod 600 login.cfg` 
	
	
	- Rode o nfftbput com a flag -f:
	`ncftpput -f login.cfg /public_html ./nome_do_arquivo.html` 
	`ncftpput -R -f login.cfg /public_html ./pasta/`
	
	
	- Ou use senhas no .bashrc

---

## OUTROS USOS: 

-   `ncftp`: Abre o terminal interativo para navegar no servidor. Tipo TUI 

`ncftp -u USUÁRIO -p SENHA ftp.seusite.com.br /public_html`

    
-   `ncftpls`: Serve especificamente para listar arquivos remotamente (daí o "ls" no final, igual ao comando do Linux).
    
-   `ncftpget`: Serve exclusivamente para baixar (fazer download) de arquivos.
    
-   `ncftpput`: Serve exclusivamente para enviar (fazer upload) de arquivos

---

## FAZER LS DOS ARQUIVOS DA HOSPEDAGEM COMPARTILHADA:

Sim, é totalmente possível listar o conteúdo de um diretório FTP usando as ferramentas do pacote NcFTP.
A depender de como você deseja executar essa tarefa, existem duas formas principais de realizar a listagem:

## 1. Usando o comando dedicado ncftpls (Sem entrar no terminal interativo)

O pacote NcFTP traz um utilitário exclusivo chamado [ncftpls](https://www.ncftp.com/ncftp/doc/ncftpls.html), perfeito para scripts ou consultas rápidas de arquivos diretamente pelo terminal. [1] 

Para utilizá-lo, use a sintaxe abaixo:

`ncftpls -u USUARIO -p SENHA ftp://IP_OU_DOMINIO/caminho/do/diretorio`

- Listar arquivos:
` ncftpls -l -u "usuario" -p "senha" [-P 21] ftp://site.com.br/public_html/ `

	([opcional])


Dicas úteis de parâmetros para o ncftpls:


* Listagem detalhada (equivalente ao ls -l): Adicione a flag -l:
`ncftpls -l -u USUARIO -p SENHA ftp://IP_OU_DOMINIO/`

* Exibir um arquivo por linha: Use a flag -1. [1, 2]:
`ncftpls -1 -u USUARIO -p SENHA ftp://IP_OU_DOMINIO/`
 

------------------------------

## 2. Usando o ncftp interativo (Interface de comandos)

Se você preferir abrir uma sessão interativa com o servidor, conecte-se normalmente via terminal: [3] 

`ncftp -u USUARIO -p SENHA IP_OU_DOMINIO`

Assim que você estiver logado no console do ncftp>, use os comandos clássicos de navegação: [4, 5] 


* ls ou dir: Lista os arquivos e pastas do diretório remoto atual.

* ls -l: Lista os arquivos mostrando detalhes como permissões, tamanho e data de modificação.

* cd nome_da_pasta: Altera para o diretório que deseja listar. [4, 5, 6] 
 




[1] [https://www.ncftp.com](https://www.ncftp.com/ncftp/doc/ncftpls.html)
[2] [https://man.archlinux.org](https://man.archlinux.org/man/extra/ncftp/ncftpls.1.en)
[3] [https://www.ncftp.com](https://www.ncftp.com/ncftp/)
[4] [https://www.cs.colostate.edu](https://translate.google.com/translate?u=https://www.cs.colostate.edu/helpdocs/ftp.html&hl=pt&sl=en&tl=pt&client=sge)
[5] [https://suporte.inter.net.br](https://suporte.inter.net.br/knowledgebase/89/Comandos-FTP.html)
[6] [https://www.linuxquestions.org](https://www.linuxquestions.org/questions/linux-software-2/ncftp-with-ls-with-wildcard-4175731904/)













