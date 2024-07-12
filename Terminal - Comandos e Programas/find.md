# FIND

Procura arquivos ou diretórios dentro do sistema e executa ou não algum bloco de comandos.

Sintaxe:

`find diretorio/ -iname arq`

- iname: Nome do arquivo (i)gnore case.

`find Download/ -iname *.jpg -exec mv {} images/ \;`

- -exec: indica o conteúdo encontrado se executará comandos 
- mv: comando para mover todos os arquivos .jpg para a pasta images/
- {}: obrigatório o uso quando usa -exec
- \;: Fecha sempre com barra invertida e ponto e vírgula.

Exemplo:
```
	# procura e lista todos os arquivos a partir de home/ com extensão .webp: 
	find ~/ -iname '*.webp' -ls
	
	# ou apenas (sem muitos dados dos arquivos):
	find ~/ -iname '*.webp'
	
	# move todos os arquivos com o pre|su-fixo ((fatima)) para a pasta correspondente:
	find ~/ -iname '*((fatima))*' -exec mv {} ~/2-Trabalhos/Nutri\ Fatima/ \;


```


ver tb:
https://duckduckgo.com/?q=command+find+to+move+files+to+another+names&ia=web
https://stackoverflow.com/questions/2372719/using-sed-to-mass-rename-files
https://stackoverflow.com/questions/17368872/how-to-move-or-copy-files-listed-by-find-command-in-unix
https://askubuntu.com/questions/1210692/find-files-and-rename-and-move-to-another-directory


Move Files From Subfolders To Parent Folder
Command:
find . -mindepth 2 -type f -exec mv "{}" . \;

Description: Moves files from subfolders to parent (current) folder.
Requires:
find . -mindepth 2 -type f -exec mv "{}" . \;

Delete All Empty Folders
Command:
find . -type d -empty -delete

Description: Deletes all empty folders in current directory.
Requires:
find . -type d -empty -delete



