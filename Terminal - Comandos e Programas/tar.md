# Comando TAR


## Criar um Arquivo .tar no Linux

Você pode criar compressões .tar para arquivos e diretórios. Um exemplo de um arquivo deste tipo é:

`tar -cvf sampleArchive.tar /home/sampleArchive`

O comando usa as opções –cvf, que significam:

- c – cria um novo arquivo .tar.
- v – mostra uma descrição do progresso de compactação.
- f – nome do arquivo.



## Como Descompactar Arquivos .tar no Linux

O comando Tar também pode ser utilizado na descompactação de arquivos. O comando abaixo é um exemplo de como extrair arquivos no diretório atual:

`tar -xvf sampleArchive.tar`

Se você deseja realizar a extração para um diretório diferente, pode usar a opção -C:

`tar -xvf sampleArchive.tar -C /home/ExtractedFiles/`


## Como Listar os Conteúdos de um Arquivo no Linux

Depois que o arquivo tiver sido construído, você pode listar seus conteúdos com o comando:

`tar -tvf sampleArchive.tar`

Com o arquivo compactado criado, é possível extrair **um único item** dele, como mostra o exemplo abaixo:

`tar -xvf sampleArchive.tar example.sh`

Para extrair itens que sigam um mesmo padrão, por exemplo, extrair apenas itens .jpg, utilize wildcards. Veja o exemplo abaixo:

`tar -xvf sampleArchive.tar --wildcards '*.jpg'`


## Como Adicionar Arquivos em um .tar
Além de poder extrair itens de um arquivo .tar, você também pode adicionar novos. Para isso, utilize a opção -r. O Tar Linux permite adicionar arquivos e diretórios.

Abaixo temos um exemplo de como adicionar o arquivo example.jpg ao arquivo compactado sampleArchive.tar.

`tar -rvf sampleArchive.tar example.jpg`

Também é possível adicionar um diretório. No exemplo abaixo iremos inserir o diretório image_dir dentro de sampleArchive.tar

`tar -rvf sampleArchive.tar image_dir`


## Como Verificar um Arquivo .tar

Com o tar você pode verificar um arquivo. Esta é uma das maneiras em que isto é possível:

`tar -tvf sampleArchive.tar` 


## Como Verificar o Tamanho de Arquivos no Linux

Depois de criar um arquivo é possível verificar seu tamanho, que será mostrado em KB (Kilobytes).

Abaixo temos exemplos deste comando em diferentes tipos de arquivos:

`tar -czf - sampleArchive.tar | wc -c`











