# GREP 

- Imprime apenas o nome dos arquivos que contem as duas ocorrências, [de modo colorido nas duas ocorrências]:
` grep -ls --color=always -e "termo1" -e 'termo2' * `

Sendo:
 -l: Mostra apenas o nome dos arquivos que trazem a ocorrência.
 -s: Silence - omite os arquivos com erro [que não aparece ocorrência]

 -e: é como se fosse dois grep's separados por pipe (aparece ocorrências mesmo que tenha os dois termos de busca).

--color=always ou auto: Ativa as cores nas duas ocorrências.


- Imprime 2 pula uma até o fim:
`seq 12 | sed 'n;n;d'`

- Imprime 2 e pára:
`sed 12 | sed 'n;n;q'`

- Imprime linhas pares:
`seq 12 | sed -n "0~2p"`

- Imprime linhas ímpares (começa pela linha 1):
`seq 12 | sed -n "1~2p"`

- Imprime de 3 em 3 acrescentando uma linha branca entre os agrupamentos: 
`seq 12 | sed "n;n;G"`
`seq 12 | sed "0~3G"`

- Imprimir as 10 linhas seguintes e pula uma:
`seq 30 | sed "0~10G"`

- Imprime a sequência até encontrar o padrão buscado e em seguida, acrescenta uma linha em branco:
`seq 30 | sed "/7/G"`


ver tb:
	https://www.theunixschool.com/2012/12/sed-10-examples-to-print-lines-from-file.html#google_vignette

	https://superuser.com/questions/396536/how-to-keep-only-every-nth-line-of-a-file

	https://www.gnu.org/software/sed/manual/html_node/Multiline-techniques.html

	https://www.grymoire.com/Unix/Sed.html

	https://www.golinuxhub.com/2017/09/10-basic-examples-of-sed-to-perform-per/


- Mostra apenas o número de ocorrências 
`grep -c 'termo' *.txt`

- Mostra o número de linhas que NÃO aparece o termo:
`grep -vc 'termo' *.txt`




