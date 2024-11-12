
https://github.com/HelioGiroto/noticias.git


*** …or create a new repository on the command line *** 

echo "# noticias" >> README.md

git init

git add README.md

git commit -m "first commit"

git remote add origin https://github.com/HelioGiroto/noticias.git

git push -u origin master


…or push an existing repository from the command line

git remote add origin https://github.com/HelioGiroto/noticias.git
git push -u origin master



https://help.github.com/articles/cloning-a-repository/

https://help.github.com/articles/adding-a-file-to-a-repository-using-the-command-line/

https://youtu.be/QGKTdL7GG24

VER tb:

http://fenix.nied.unicamp.br/redmine/projects/teleduc/wiki/Como_atualizar_o_seu_reposit%C3%B3rio_local_de_desenvolvimento_(GitHub_-_novo)

Para aqueles que não têem a versão do TelEduc, baixá-lo direto do repositório de desenvolvimento que fica no GitHub, tendo, assim, a versão mais atual do TelEduc:
git clone https://github.com/nied-unicamp/TelEduc
Para aqueles que já possuem o TelEduc no computador, mas precisam atualizá-lo com as alterações que outros desenvolvedores fizeram, usar o comando:
git pull

Esse comando "pega" as alterações do Github e coloca no seu repositório local.
Para ver as alterações que você fez localmente, usar o comando:
git status
Caso haja arquivos alterados que queira adicionar ao próximo commit, usar o comando:
git add <file>
Para aqueles que querem commitar as alterações feitas localmente, usar o comando:
git commit -m "MENSAGEM A SER ESCRITA PARA FACILITAR O NOSSO GERENCIAMENTO DE TICKETS. Fecha #NUMERO_DO_TICKET_RELACIONADO (OPCIONAL)" <file>
Caso queira commitar um arquivo específico, passe o nome no final do comando. Caso contrário, serão commitados todos os arquivos.

Após commitado, dar o comando para "colocar" as alterações no servidor do GitHub:
git push
Para ver a lista de todos os commits que foram feitos ultimamente, usar o comando:
git log
Tenham o hábito de diariamente atualizar o seu repositório.


git show --summary  # para ver dados do último commit
