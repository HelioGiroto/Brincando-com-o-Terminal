# AWK

AWK é mais do que um comando do Bash, na verdade é uma linguagem de programação que opera em **cada linha** de um arquivo, normalmente CSV. É utilizada frequentemente por desenvolvedores para processar textos e manipular arquivos.

O uso de AWK se adapta perfeitamente para as necessidades de Análise de Dados e da grande demanda do Big Data. Devido sua velocidade de processamento, facilidade de programação e do pouco uso de recursos de memória, o AWK pode superar qualquer outra ferramenta, seja o Python, o Power Bi, e muitos outros. 

A linguagem de programação AWK foi criada em 1977 pelos cientistas Alfred Aho, Peter J. Weinberger e Brian Kernighan no laboratório Bell Labs. A palavra AWK é uma abreviatura das iniciais dos sobrenomes dos criadores da linguagem (**A**ho, **W**einberger e **K**ernighan).

Trabalha com variáveis, laços, condicionais, comandos de impressão e outros. 

O que você quer realizar linha por linha em um arquivo? O AWK realiza isso muito bem! Ele lê cada linha e faz um certo processamento que você define, seja um cálculo, uma ordenação, uma soma de algumas/todas as colunas da linha (soma horizontalmente) ou soma de "células" de uma coluna (soma verticalmente), tudo isso, dependendo ou não de condições pré-estabelecidas, etc...

A vantagem do AWK é que ele trabalha "tranquilamente" com arquivos de um grande número de linhas. Ao contrário de um Excel, por exemplo, que travaria se (tentasse) abrir uma planilha ou CSV com mais de 20.000 linhas, o AWK processa milhares de linhas usando pouquíssima memória.

(No Excel, o tamanho máximo comportado para uma planilha é de 1.048.576 linhas por 16.384 colunas. )


## 1 - Sintaxe básica:

` awk -F';' '{print $0}' arq.csv `

Sendo:

```
arq.csv	- Define o nome do arquivo-origem em que os dados serão usados para processar.

-F 	- Define o delimitador/separador usado no arq.csv. Normalmente ';' ou ','. Deve estar entre áspas (simples ou duplas).

{}	- Bloco de comandos que se executarão em cada linha de arq.csv. Deve estar entre áspas (simples ou duplas).

(áspas)	- Um bloco não pode ser colocado entre áspas duplas, apenas dentro de simples.

$0	- Linha inteira (se verá mais adiante).
```

## 2 - Conceito de colunas 

O AWK é voltado ao processamento de linhas. Porém, cada linha ele a divide em colunas (ou campos) exatamente como a ideia de uma planilha. Por isso que o AWK é uma das ferramentas mais eficientes, leves e rápidas para lidar com arquivos CSV, especialmente os gigantes.

As colunas de cada linha são definidas pelos delimitadores, ou separadores, que normalmente são ';' ou ',' ou mesmo o TAB em caso de arquivos TSV. 

As colunas são os campos e as linhas os registros. De forma que, assim como cada registro tem seus campos, cada linha tem suas colunas.

O número das colunas são interpretados como de `$1` até `$X` (sendo X o número de colunas que uma linha possa ter).

Para saber a quantidade de colunas de uma linha se usa a variável `NF` (Number of Fields, campos).

Para se imprimir todas as colunas, ou melhor, a linha inteira, se usa o `$0`.

Para se imprimir qualquer informação em AWK é usado o comando `print` no bloco.

Com os exemplos se torna mais fácil:

```bash
	# Imprime cada linha inteira do arquivo na tela do terminal:
	awk -F';' '{print $0}' arq.csv

	# Imprime o número de campos de cada linha:
	awk -F';' '{print NF}' arq.csv

	# Imprime o número da linha de cada linha:
	awk -F';' '{print NL}' arq.csv

	# Imprime apenas a coluna 1 de cada linha:
	awk -F';' '{print $1}' arq.csv

	# Imprime as colunas 1 e 2 de cada linha (se exibirão concatenadas/separadas por um espaço):
	awk -F';' '{print $1, $2}' arq.csv

	# Imprime as colunas 1 e 2 de cada linha (se exibirão concatenadas/separadas por uma vírgula):
	awk -F';' '{print $1 "," $2}' arq.csv

	# Imprime as colunas 1 e 2 de cada linha (se exibirão concatenadas/separadas por um ponto e vírgula):
	awk -F';' '{print $1 ";" $2}' arq.csv

	# O mesmo de acima mas com saída para um novo arquivo csv:
	awk -F';' '{print $1 ";" $2}' arq.csv > novo.csv

	# Para que saia tanto em tela como em um arquivo novo:
	awk -F';' '{print $1 ";" $2}' arq.csv | tee novo.csv

```

Observe que:
- O comando `print` sempre estará dentro de um bloco de comandos e será realizado o mesmo número de vezes de linhas que contém o arquivo csv. Ou seja, será repetida enquanto haja linhas no arquivo csv. (Veja exemplo abaixo)
- Se for colocado alguma mensagem antes, entre ou ao final de algum campo da linha, tal mensagem é colocada em áspas (diferente das áspas que envolvem o bloco, i. é: simples se as primeiras são duplas e vice-versa).

Exemplo:
` awk '{print "Olá mundo!"}' arq.csv `

No exemplo acima, se imprimirá a frase entre áspas duplas o mesmo número de vezes que tenha de linhas o arquivo csv. E nesse caso, não precisou definir o tipo de separador com -F, já que não se usaria algo relacionado às colunas (campos) das linhas do arquivo.


## 3 - Condições para filtrar linhas

Podemos usar condições dentro do AWK. Não só podemos, como devemos, para filtrar melhor os resultados que buscamos dentro de um arquivo csv. Para isso, precisamos...

**Imprimir linha conforme condição**

```bash
	# Imprime todas as linhas que contêm a string (nome) 'Maria' em qualquer parte da linha:
	# abaixo: os colchetes do bloco são obrigatórios:
	awk -F';' '/Maria/ {print $0}' clientes.csv

	# Imprime todas as linhas inteiras que a coluna 8 for exatamente "2023":
	# observe que os colchetes são opcionais apenas para print... :
	# e que o valor em que se busca na coluna está entre áspas duplas
	awk -F';' '{ if ($8 == "2023") print $0 }' arq.csv
	awk -F';' '{ if ($8 == "2023") {print $0} }' arq.csv
	
	# Imprime todas as linhas inteiras que a coluna 8 FOR DIFERENTE de '2023':
	awk -F';' '{ if ($8 != "2023") print $0 }' arq.csv
	
	# Imprime todas as linhas que NÃO tenham o nome Maria em qualquer parte delas:
	awk -F';' '! /Maria/ {print $0}' clientes.csv

```

OBS.: 
- Sempre com muita atenção com o uso das áspas simples e duplas na mesma linha de comando!
- Sempre que usar a instrução `if`, ela deve estar dentro de colchetes (de um bloco de comandos).



**Usando VARIÁVEIS do Bash e OPERADORES dentro de uma condição:**

A variável do Bash deve estar entre áspas simples:

```bash
	
	# imprime todas as linhas em que aparece o ano = 1999 na coluna 3
	ano="1999"
	awk -F';' '{ if($3 == '$ano') print $0}' arq.csv
	
	# imprime todas as linhas em que o salario (coluna 5) é maior que 2000 (usando variáveis)
	salario="2000"
	awk -F';' '{ if($5 > '$salario') print $0}' arq.csv
	
```

Os operadores de comparação são: ==, !=, >, >=, <, <=.

Ver tb.: https://www.thegeekstuff.com/2010/02/unix-awk-operators


**Usando REGEX dentro de uma condição (em vez de == se usa ~):**

Condiciona a impressão de acordo com a coluna, usando o if com expressões regulares:

```bash
	# Imprime todas as linhas inteiras que contenha a string 'ista' em qualquer parte da coluna 4:
	awk -F';' '{ if($4 ~ /ista/) print $0 }' arq.csv
	
	# Imprime todas as linhas inteiras que NÃO contenha a string 'ista' em qualquer parte da coluna 4 (for diferente):
	awk -F';' '{ if($4 !~ /ista/) print $0 }' arq.csv

	# Imprime todas as linhas inteiras que na coluna 1 o conteúdo comece com a letra 'J':
	awk -F';' '{ if($1 ~ /^J/) print $0 }' arq.csv
	
	# Imprime todas as linhas inteiras que a coluna 5 o conteúdo termine com 'br':
	awk -F';' '{ if($5 ~ /br$/) print $0 }' arq.csv
	
	# Imprime todas as linhas inteiras em que o segundo caracter tenha um número na coluna 3
	awk -F';' '{ if($3 ~ /.[0-9]/) print $0 }' arq.csv
	
	# Imprime todas as linhas inteiras em que tenha a string "Março" na coluna 2:
	awk -F';' '{ if($2 ~ /Março/) print $0 }' arq.csv
	
	# Igual ao de cima, porém sem importar se começa com maiúscula ou minúscula:
	awk -F';' '{ if($2 ~ /[Mm]arço/) print $0 }' arq.csv
	
	# Em casos que de ignorar se tem ou não maiúsculas...:
	# observe que as instruções são separadas por ';' e dentro de colchetes - bloco:
	awk -F';' '{ IGNORECASE=1; if($2 ~ /março/) print $0 }' arq.csv
	
	# Escapando (\) caracteres em caso que uma coluna contenha strings com áspas, $, barras, ';', etc....:
	# abaixo: escapamos as barras da data 25/12
	awk -F';' '{ if($2 ~ /25\/12/) print $0 }' arq.csv
	
	# Imprime linhas inteiras em que se encontra o número '12345' entre o começo e fim da palavra/número (\y):
	# ou seja, a string e nada mais (em volta)
	awk -F';' '{ if($5 ~ /\y12345\y/) print $0 }' arq.csv
	
	# Imprime linhas inteiras em que se encontra o número '12345' entre dois outros números/palavras (\B):
	awk -F';' '{ if($5 ~ /\B12345\B/) print $0 }' arq.csv
	
	# Imprime linhas inteiras em que se encontra o regex '199x' na coluna $2 (usando variáveis):
	ano='199.'
	awk -F';' '{ if( $2 ~ /'$ano'/ ) print $0 }' arq.csv
		
```



**Se cumprir com as duas condições (_e_ = &&):**

```bash

	# Se cumprir com as duas condições, imprime a linha:
	awk -F';' '{ if( $2 ~ /200./ && $3 == "M" ) print $0 }' arq.csv
	
	# se cumprir com as duas condições (usando variáveis):
	ano='199.'
	sexo='M'
	awk -F';' '{ if( $2 ~ /'$ano'/ && $3 ~ /'$sexo'/ ) print $0 }' arq.csv

```


**Se cumprir com uma de duas condições (_ou_ = ||):**

```bash
	
	# se a coluna 2 tiver ano de 19xx OU 201x será impressa:
	awk -F';' '{ if( $2 ~ /19../ || $2 ~ /201./ ) print $0 }' arq.csv
	
```


**Usando if e else:**

```bash
	# Se corresponder imprime linha inteira, caso contrário, imprime apenas coluna 1
	awk -F';' 'n=/Maria/ {print $0} !n {print $1}' arq.csv

	# Se corresponder à condição imprime a coluna 2, caso contrário, imprime a coluna 3
	awk -F';' 'cond=/sim/ {print $2} !cond {print $3}' arq.csv
	
	# Usando a mesma lógica acima, mas com o resultado melhor elaborado - imprime a linha inteira mais uma coluna extra:
	awk -F';' 'cond=/sim/ {print $0 ";Sim"} !cond {print $0 ";Não"}' arq.csv
	
	# Usando a mesma lógica, porém aprimorando as condições conforme coluna 3:
	awk -F';' '{ if($3 ~ /br/) {print $0 ";Sim"} else {print $0 ";Não"} }' arq.csv
```



## 4 - Realizando cálculos na horizontal 

**Realizando um cálculo de dois campos em cada linha:**

Suponhamos que temos a necessidade de, em cada linha, somar apenas dois campos (colunas) do arquivo csv e imprimí-lo numa coluna extra. Como isso é possível usando o AWK?

As colunas a serem somadas são a 2 e a 4, por ex.:

`awk -F';' '{tot = $2 + $4; print $0 ";" tot}' planilha.csv`

E caso fosse uma divisão, multiplicação ou subtração:

```
	awk -F';' '{tot = $2 / $4; print $0 ";" tot}' planilha.csv
	awk -F';' '{tot = $2 * $4; print $0 ";" tot}' planilha.csv
	awk -F';' '{tot = $2 - $4; print $0 ";" tot}' planilha.csv
```

Explicando o código:

A cada linha de planilha.csv:
- A variável `tot` recebe o valor do cálculo das colunas 2 e 4
- Se imprime toda a linha, concatenando o valor da variável `tot`


Se quiséssemos somar mais que duas colunas, por exemplo a 3, 7, 11 e 23:

` awk -F':' '{ tot = $3 + $7 + $11 + $23; print $0 ";" tot }' arq.csv `

É possível realizar cálculos mais complexos, como:

` awk -F':' '{ tot = ($3 + $4) / $2; print $0 ";" tot }' arq.csv `

OBS.: Nunca esquecer dos colchetes (blocos de comandos).


**(Somando TODOS os campos de cada linha)**

Agora, num exemplo mais complexo, imagine uma planilha em que você precisa realizar em cada linha uma soma de TODOS os campos (colunas) e imprimir numa coluna extra o valor total (de cada linha). Como isso é possível usando o AWK?

Exemplo do arquivo valores_semanais.csv:

```
850;1320;1750;990;1115
380;950;2050;1090;580
500;790;1525;890;240
1000;850;1050;700;525
```

**Forma simples** 

Vamos imprimir apenas os totais de cada linha da forma mais simples:

`awk -F';' '{print $1+$2+$3+$4+$5}' valores_semanais.csv`

Resultado:

```
6025
5050
3945
4125
```

Agora, como adicionando uma coluna a mais com os totais:

`awk -F';' '{print $0 ";" $1+$2+$3+$4+$5}' valores_semanais.csv`

Resultado:

```
850;1320;1750;990;1115;6025
380;950;2050;1090;580;5050
500;790;1525;890;240;3945
1000;850;1050;700;525;4125
```

**Utilizando a instrução `for`:**

`awk -F';' '{ tot=0; for (c=1; c<=NF; c++) tot+=$c; print tot}' valores_semanais.csv`

Explicando o código:

A cada linha do arquivo csv (dentro do único bloco de comandos):
- Inicia a variável `tot` com valor 0;
- Cria um laço para percorrer todas as (c)olunas (até `NF` que é o número total de colunas)
- A cada iteração do laço, soma o valor da coluna acumulando em `tot`;
- Ao final do laço, imprime o valor de `tot`. 

O resultado é de apenas uma coluna com os valores totais, porém se prefere que se imprima toda a planilha com mais uma coluna de totais, será bem simples:

`awk -F';' '{ tot=0; for (c=1; c<=NF; c++) tot+=$c; print $0 ";" tot}' valores_semanais.csv`

Resultado:

```
850;1320;1750;990;1115;6025
380;950;2050;1090;580;5050
500;790;1525;890;240;3945
1000;850;1050;700;525;4125
```

**Calculando a média das colunas de cada linha - forma horizontal**

- Modo simples:
` awk -F';' '{media=($1+$2+$3+$4+$5)/NF; print $0 ";" media}' valores_semanais.csv `

- Usando a instrução `for`:
` awk -F';' '{ tot=0; for (c=1; c<=NF; c++) tot+=$c; media=tot/NF; print $0 ";" media}' valores_semanais.csv `







 		









--- 

```














```

https://stackoverflow.com/questions/14478722/awk-shortened-if-then-else-with-regex
https://unix.stackexchange.com/questions/512567/regex-in-if-condition-in-awk#512570
https://www.gnu.org/software/gawk/manual/gawk.html#Regexp-Usage
https://www.gnu.org/software/gawk/manual/html_node/Regexp.html
https://pt.wikipedia.org/wiki/AWK
https://pt.linux-console.net/?p=20206
https://www.thegeekstuff.com/2010/02/unix-awk-operators/
https://stackoverflow.com/questions/13067532/awk-and-operator#13067690
https://linux-audit.com/cheat-sheets/awk/
https://www.gnu.org/software/gawk/manual/html_node/Arrays.html
https://thelinuxcode.com/sum-column-awk/


soma vertical
awk -F';' '{sum+=$1} END {print sum}' valores_semanais.csv

média vertical
awk -F';' '{ total += $2; count++ } END { print total/count }' file.csv 


erro ao tentar gerar varias colunas na ultima linha e apendar medias:
awk -F';' '{ for (col=1;col<=NF;col++) total += $col; row++; print total/row }' valores_semanais.csv 



- Converte para minúscula a primeira coluna de um arquivo:
awk -F';' '{$1 = tolower($1)}' logins.csv
awk -F';' '{$1 = tolower($1); print $0}' logins.csv

