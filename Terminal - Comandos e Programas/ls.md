# LS

Lista diretórios

Lista com informações (l)ongas sobre tamanho em formato humano (inteligível)
`ls -lh`

Lista agrupados por tipo:
`ls -lX`

Lista de modo recursivo (quase um tree):
`ls -lhR`

Lista fazendo aparecer os arquivos e pastas ocultas:
`ls -lha`




## Ver também comando `du`:

Mostra quantos arquivos e pastas contém cada pasta do diretório atual e coloca em ordem alfabética:
`du --inodes | sort`

Há um porém: O comando `du` faz aparecer um número a mais do total de arquivos que existe dentro de cada pasta. Por isso, ser pode usar este formato:
`du --inodes  | awk '{print $1 - 1, $2}'`

ou:
`    du --inodes  | awk '{print $2 " - " $1 - 1}'   `


ou:
` du --inodes| awk '{print $2 " - " $1 - 1}' | sort `







