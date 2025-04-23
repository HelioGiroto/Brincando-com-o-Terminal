# COMO [DES]COMPACTAR ARQUIVOS/PASTAS:

Para instalar: 

`sudo apt install zip`

## Para compactar:
`zip arquivo.zip *`

	- nome.zip	: Arquivo de saída
	- *		: Arquivos origem
	
	
Exemplo:
`zip projetos.zip *.pdf`

Porém, para incluir os diretórios recursivos, que por padrão não são incluidos, adicionamos a flag -r:

`zip -r projeto.zip Projetos/`


## Adicionar mais um arquivo ao arquivo zip:

`zip pasta arq_novo.odt`


## Ver a Lista de arquivos que está compactado numa pasta zip:

`unzip -l projetos.zip `


## Deletar um arquivo de dentro da pasta zipada:

`zip pasta -d arquivo.md`


## Para descompactar:

`unzip nome.zip`




