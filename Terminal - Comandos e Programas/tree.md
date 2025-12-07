# TREE

Exibe todo a árvore do diretório com seus subdiretórios e arquivos a partir da pasta em que for executado no terminal.

## Instalação:
`sudo apt install tree`


## Alternativas de uso:

Para que o comando `tree` exiba o tamanho de cada arquivo e diretório, você deve usar as opções -h (para tamanhos legíveis por humanos) e -s (para exibir o tamanho de cada arquivo ou o tamanho acumulado dos diretórios). 

Ex.:

`tree -hs`


**Opções Adicionais Úteis**

    -h: Mostra os tamanhos em um formato legível por humanos (ex: 1K, 600M, 1G).
    -s: Exibe o tamanho em bytes de cada arquivo, ou o tamanho total acumulado de cada subdiretório (semelhante ao du).
    --du: Semelhante a -s, mas força o cálculo do tamanho total de cada diretório, o que pode demorar um pouco mais para árvores grandes, mas fornece o tamanho real em disco de cada pasta.
    -a: Inclui arquivos ocultos (aqueles que começam com um ponto) na listagem
    
    
