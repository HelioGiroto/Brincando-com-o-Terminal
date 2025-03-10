# GREP 

## Cores na saída
` grep -Ls --color=always -e "cut" -e 'sort' * `

Sendo:
 -L: Mostra apenas o nome dos arquivos
 -s: Silence - omite os arquivos com erro que não aparece ocorrência

 -e: é como se fosse dois grep's separados por pipe (aparece ocorrências mesmo que tenha os dois termos de busca).

--color=always ou auto: Ativa as cores nas duas ocorrências.



## Varre todos os arquivos txt em busca do termo, excepto de history.txt
`grep 'termo' *.txt --exclude history.txt`

grep -ircl --exclude=*.{png,jpg} "termo" *

