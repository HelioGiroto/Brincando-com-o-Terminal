# EXEMPLOS SED

sed 's/foo/bar/'             # troca somente a 1a instância de uma linha
sed 's/foo/bar/4'            # troca somente a 4a instância de uma linha
sed 's/foo/bar/g'            # troca TODAS as instâncias de uma linha


## substitui "foo" por "bar" SOMENTE nas linhas que contem "baz" 
sed '/baz/s/foo/bar/g'

## substitui "foo" por "bar" EXCETO nas linhas que contem "baz"
sed '/baz/!s/foo/bar/g'

seq 10 19 | sed '/10/ s/1/0/'	# troca 1 por 0 somente nas linhas que contem 10.

seq 10 19 | sed '/10/ !s/1/0/'	# troca 1 por 0 somente nas linhas que NAO contem 10.

seq 10 19 | sed 's/10\|11/00/'  # troca 10 *ou* 11 por 00.

seq 12 | sed 'N;a---'		# a cada duas linhas, adiciona -----

seq 10 | sed '0~2a---'		# o mesmo

seq 10 20 | sed '/0/a--- '	# acrescenta um --- abaixo das linhas que contenha 0

seq 10 | sed '0~5d'		# apaga cada 5a linha.

seq 12 | sed 'N;a\\n'		# a cada duas linhas, adiciona uma quebra de linha

seq 20 | sed '0~2a\ '		# melhor que acima.

seq 20 |  sed -n '/13/{n;p;}'	# imprime a linha posterior ao 13.

seq 20 |  sed -n '/13/{g;p;};h'	# imprime a linha anterior ao 13.

sed -n '/^.\{65\}/p'		# imprime as linhas que tenham mais de 65 caracteres.

sed -n '/^.\{65\}/!p'		# imprime as linhas que tenham MENOS de 65 caracteres.

sed '/^.\{65\}/d'		# o mesmo de acima.



sed -n '45,50p' arquivo           # imprime as linhas nos. 45-50
sed -n '51q;45,50p' arquivo       # mesma coisa, mas faz muito mais rapidamente


sed 's/foo/bar/g' arquivo         # comando de substituição padrão
sed '/foo/ s/foo/bar/g' arquivo   # executa de forma mais rápida
sed '/foo/ s//bar/g' arquivo      # sintaxe mais sucinta


# https://www.linuxforce.com.br/comandos-linux/comandos-linux-comando-sed/


