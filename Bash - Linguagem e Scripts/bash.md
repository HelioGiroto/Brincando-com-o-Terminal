![](bash.png)
# BASH 

A linguagem Bourne-Again Shell (Shell Nascido de Novo) foi lançada inicialmente em 1989. Desenvolvida por Brian Fox e Chet Ramey. É o Shell Script padrão nas várias distribuições Linux. **Resumindo: o Bash é a linguagem do Linux!**

A documentação oficial da linguagem está em:
https://www.gnu.org/software/bash/manual/bash.html

## Índice:
	CLI ou GUI 
	Shebang: Inicio do Programa
	Comentários
	Extensão do Código
	Sintaxe de Comandos no Script
	Entrada de Dados 1: Variáveis
	Operações e Operadores Aritméticos
	Imprimir na Tela
	Concatenação
	Manipulação de Strings / Regex
	Curingas e Expansão de Chaves
	Entrada de Dados 2: Comando Read
	Entrada de Dados 3: Parâmetros Em Linha Do Terminal 
	Teste de Condições
	Operadores Ternários
	Condições If, Elif, Else
	Opções em Casos
	Listas / Arrays
	Manipulação de Listas
	Laços
	While
	Continue - Break
	Incrementos
	Funções 
	Tratamento de Erros: Except / Try 
	Módulos / Bibliotecas para Importar



## CLI OU GUI 
"Command-Line Interface" ou "Graphical User Interface"?
 
- Quase sempre os scripts em Bash são CLI.
- Mas há opções de GUI, como: Dialog, ...


## SHEBANG: INICIO DO PROGRAMA
```bash
	#!/bin/bash
```

## COMENTÁRIOS

`# comentários depois do símbolo: #`


## EXTENSÃO DO CÓDIGO
Normalmente se salva um script Bash como `nome_arquivo.sh`, mas também se pode encontrar (raramente) a extensão `.bash`; ou até sem extensão (em casos de scripts salvos na pasta /bin que receberam permissão para serem executáveis (`chmod -x arq`)).


## SINTAXE de COMANDOS NO SCRIPT
Dentro do script os comandos estarão cada um em uma linha, sem a necessidade obrigatória de indentação em caso de funções e/ou laços, ou mesmo todos os comandos podem estar **numa única linha** separados por ponto-e-vírgula (**;**).

```bash
	comando1
	comando2
	comando3
```

Ou: 

`comando1; comando2; comando3`


## ENTRADA de DADOS 1: Variáveis
Para nomes de variáveis, como de costume, se evita caracteres alfanuméricos ou nomes que iniciem com números. Por convenção, eles aparecem em letras maiúsculas, porém não é regra.

**Não** se aceita **espaço(s)** entre o nome da variável e o símbolo de atribuição **(=)**, tampouco entre esse e seu valor atribuído.


```bash
	VARIAVEL=1
	NOME=Helio
	FRASE="Olá Mundo"
	NOMECOMPLETO="Maria da Silva"
	IDADE=40
	COMANDO=$(ls *.jpg)
	DATA_NASC="01/07/2003"
```

Até se pode usar o underline ( _ ) para nomes de variáveis, mas nunca o hífen (-).

## OPERAÇÕES E OPERADORES ARITMÉTICOS
```bash
	# soma:
	echo $((1+1))
	# subtração:
	echo $((4-3))
	# multiplicação:
	echo $((2*3))
	# divisão:
	echo $((4/2))
	# resto da divisão:
	$(( 10 % 3 ))	# resultado: 1
	# exponenciação:
	echo $((2**3))
	# raiz quadrada:
	# ...
	# também funciona com variáveis:
	# (o dolar só aparece antes dos dois parêntesis de abertura):
	echo $(( num1 * num2 ))
	# operações mais complexas (se calcula 1o. o que está entre parêntesis):
	echo $(( (1 + 4) * 2 ))
	# incremento (ver no tópico próprio mais abaixo):
	((num++))
	# decremento:
	((num--))
```

Também se pode realizar operações com números decimais utilizando o comando `bc`:

```bash 

```

## IMPRIMIR NA TELA

Em Bash, há várias maneiras de se imprimir em tela uma mensagem. Desde as mais simples até as mais complexas:

### Comando echo

```bash
	echo "Olá mundo!"
	echo 'Frase entre aspas simples ou duplas'
	echo 123
	echo palavra
	echo 	# (somente o comando = linha em branco)
	echo $VARIAVEL
	echo "$MENSAGEM"
	echo -n "Não tem quebra de linha após este echo..."
	echo " fim."
```

### printf

### tput

(Alinhar, justificar, decimais, cores, peso, fonte, etc)


## CONCATENAÇÃO

```bash
	NOME='José'
	SOBRENOME='da Silva'
	IDADE=30
	BOASVINDAS="Seja bem-vindo $NOME $SOBRENOME! Feliz aniversário de $IDADE anos!"
	echo $BOASVINDAS
```

## MANIPULAÇÃO de STRINGS / REGEX

**Fatiando uma string**

É possível manipular um string, ou seja, uma variável que tenha conteúdo de string, fatiando-a para obter apenas um pedaço da mesma. A sintaxe é:

`echo ${VARIAVEL:i:qtde}`

Sendo que:
 - É obrigatório o uso de colchetes ( { } ) depois de dolar ($).
 - i: é o início da string. A primeira letra que será impressa.
 - qtde: a quantidade de letras que serão impressas.

Exemplo:

```bash
	# cria uma variável:
	PROX_NATAL="25122024"
	
	# imprime o dia de PROX_NATAL:
	echo ${PROX_NATAL:0:2}
	
	# imprime o mês de PROX_NATAL:
	echo ${PROX_NATAL:2:2}

	# imprime o ano de PROX_NATAL:
	echo ${PROX_NATAL:4:4}
```

Se usa os colchetes antes do início do nome da variável, já que o Bash interpreta que uma variável também é um array, ou seja, uma lista, ou conjunto de caracteres. Mais adiante, no tema de "Arrays" veremos isso mais claramente. O importante é não esquecer de usar os colchetes antes do nome da variável ao manipular (fatiar) strings, quando for preciso.


**Obtendo o número em que aparece uma ocorrência na string**

Se pode também obter em que lugar na string aparece a primeira ocorrência de uma expressão, utilizando o comando `expr index`. Observe o exemplo:

```
	# cria uma string:
	LETRAS="ABCDEFGHIJLMNOPQRSTUVXZ"
	
	# obtem em que ordem está a letra A:
	expr index $LETRAS "A"
	# resultado = 1

	expr index $LETRAS H
	# resultado = 8

```

*CUIDADO:* Perceba, porém, que o número retornado (como resultado) **não é do índice**, porque senão começaria do zero (0), e A estaria no índice 0. 

Logo, para imprimir a letra "A" da variável LETRAS, teríamos que considerar que só a partir da posição 0, imprimiríamos um carácter: `echo ${LETRAS:0:1}`.


**Substituindo trechos numa string**

Podemos igualmente, substituir o conteúdo de uma string, muito parecidamente com o comando `sed`. Sintaxe:

`echo ${VARIAVEL/antes/depois}`

Onde:
 - antes: é o valor (conteúdo) que se quer alterar por:
 - depois: que é o conteúdo que será colocado em lugar de "antes".
 
Observe nessa sintaxe, novamente, o uso dos colchetes antes do nome da variável.

Exemplos de uso:

```bash
	# definimos uma string:
	NOME="Ana Solteira"
	echo ${NOME/Solteira/Casada}
	
	# ou:
	NOME_CASADA=$(echo ${NOME/Solteira/Casada})
	echo $NOME_CASADA 
	
	# outro bom exemplo:
	FRASE="Minha terra tem palmeiras onde canta o Sabiá."
	
	# substituimos o conteúdo:
	echo ${FRASE/palmeiras/o Palmeiras}
```


**Convertendo para maiúsculas ou minúsculas o conteúdo de uma string**

Exemplos práticos:

```bash
	## MAIÚSCULAS = ^ ou ^^ ##
	
	# Convertendo a PRIMEIRA letra para MAIÚSCULA:
	PAIS="brasil"
	echo ${PAIS^}
	# resultado = Brasil

	# Convertendo TODAS as letras para MAIÚSCULAS:
	echo ${PAIS^^}
	# resultado = BRASIL
	
	# Convertendo ALGUMAS letras para MAIÚSCULAS:
	CIDADE="são paulo - sp"
	echo ${CIDADE^^[sp]}
	# resultado = São Paulo - SP
	
	
	## minúsculas = , ou ,, ##
	
	# Convertendo a PRIMEIRA letra PARA minúscula:
	PALAVRA="Deuses"
	echo ${PALAVRA,}
	# resultado = deuses

	# Convertendo TODAS as letras PARA minúsculas:
	PALAVRA="POR FAVOR..."
	echo ${PALAVRA,,}
	# resultado = por favor...
	
	# Convertendo ALGUMAS as letras PARA minúsculas:
	HORA="São 10 Horas e 15 Minutos."
	echo ${HORA,,[HM]}
	# resultado = São 10 horas e 15 minutos.
```


## CURINGAS E EXPANSÃO de CHAVES

### Curingas:

São caracteres especiais (*, ?, \[ \], etc) que são usados para indicar um ou mais nomes de arquivos na execução de comandos do sistema (ls, cat, cp, mv, rm, etc).

**Asterisco (*)**

Por exemplo, vamos listar todos os arquivos (independente do nome) com a extensão .txt:

```
	ls *.txt
```

Outros exemplos:
```
	# lista todos os arquivos csv's que começam com 2024-:
	ls 2024-*.csv
	
	# lista todos os que terminam com o nome 2024:
	ls *2024.csv
	
	# lista todos os arquivos que contenham "linkedin" no nome:
	ls *linkedin*
```

Agora, vamos listar todos os diretórios/ (sem os arquivos) da nossa home:

```
	ls -d */
	
	# resultado:
	Desktop/  Documents/  Downloads/  Images/  Musics/  Videos/
```

Apenas pastas que começam com a letra D:

```
	ls -d D*/
	
	# resultado:
	Desktop/  Documents/  Downloads/
```

**Curinga interrogação (?)**

Indica um ou mais espaços (conforme o número de ?) que estão no nome de um arquivo.

```
	# lista csv's cujos nomes tenham exatos 4 caracteres em seguida de ano-:
	ls ano-????.csv
	
	# lista independente do dia (com dois dígitos) de Dezembro:
	ls ano 2023-12-??.csv
	
```


**Colchetes [...]**

Proporciona uma opção em que inclui todos arquivos que contenham os padrões dentro dos colchetes.

Exemplo: Listemos todos os arquivos que comecem com a letra "o" **ou** "s" (os dois tipos). Isto é, todos que iniciam com "o" e todos os que iniciam com "s":

```
	# somente em letras minúsculas:
	ls [os]*.*
	
	# maiúsculas ou minúsculas:
	ls [oOsS]*.*

	# lista todos os arquivos que contenham a palavra Whatsapp ou Youtube 	
	ls *WhatsApp* *Youtube*
	
	#(não importando se comecem com maiúscula ou minúscula):
	ls *[Ww]hatsApp* *[Yy]outube*

```

### Expansão de chaves:

O uso da expansão de chaves no Bash facilita a impressão de strings ao definir um padrão ou sequência em que um termo será usado. 

Basicamente o formato é `{inicio..fim}`. E com incremento: `{inicio..fim..incremento}`.

Com o exemplo fica mais fácil:

```bash
	# imprime a sequência de números:
	echo {1..10}
	
	# lista os arquivos que tenha essa mesma sequência em seus nomes:
	ls pedido{1..10}.csv
	
	# imprime nros em órdem decrescente:
	echo {10..0}
	
	# com incremento (que não seja 1 que é o padrão):
	echo {0..21..3} 	# de 0 à 21, mas de 3 em 3.
	
	# imprime de 001 à 100:
	echo {001..100}
	
	# ao invés de um ao lado do outro, um em cada linha:
	echo "Nro: {000..010}" | tr ' ' '\n'
	
	# outro exemplo com incremento e datas:
	ls chamadas-2023-Dez-{01..10}.csv
	mv chamadas-2023-Dez-{01..10}.csv ./Arquivo-2023
	
	# funciona também com letras (minúsculas ou maiúsculas:
	echo {a..z}
	echo {A..Z}
	
	# letras de a-z, mas de 2 em 2:
	echo {a..z..2}
	
	# ou numa lista de opções:
	echo {g,r,p,m,f,b,ch,hi,j}ato
	echo {,g,r,p,m,f,b,ch,hi,j}ato
	echo Program{o,as,a,amos,ais,am},
	
	# lista de dias da semana por extenso (separados com vírgula):
	echo {Segunda,Terça,Quarta,Quinta,Sexta}-feira,
	
	# imprimindo expressões com espaço:
	# separadas com vírgula:
	echo "Nro: "{01..10},
	# ou cada uma numa linha:
	echo "Nro: "{01..10} | sed 's/[0-9] /&\n/g'
	
	# formando frases:
	echo "O nro: "{01..10}" já foi chamado."
	echo "O nro: "{01..10}" já foi chamado." | sed "s/O /\nO /g"
	
	# plural ou singular:
	echo arquivo{,s}

	# combinações diversas (com mais de uma expansão):
	ls arquivo{,s}{1..5}
	
	# combina uma variação de nomes e extensões:
	ls foto-{001..003}.{png,jpg,webp}

```
Mais exemplos, ver tb https://en.wikipedia.org/wiki/Bash_(Unix_shell)#Brace_expansion


## ENTRADA de DADOS 2: Comando Read

```bash
	echo "Por favor, digite com uma informação: "
	read ENTRADA
	echo
	echo "Obrigado!"
	echo "Sua informação foi esta: $ENTRADA."
	echo
```

## ENTRADA de DADOS 3: Parâmetros em linha do Terminal 
Também é possível criar um script em que o usuário passa os parâmetros de entrada (argumentos) na própria linha de comando ao chamar o programa.

Logo, todo conteúdo que venha após o nome do Bash Script é considerado parâmetros (entrada de dados). Sendo que:

```
	$1 - é o primeiro argumento.
	$2 - é o segundo... e assim sucessivamente.
	$0 - é o nome do script.
	$# - quantos argumentos foram passados.
	#@ - todos os argumentos.
```

*Obs.:* Quando se usa *mais que 9 argumentos*, a partir do décimo, é preciso declará-lo entre colchetes: `${10}`.


Sendo assim, considere o script:

```bash
#!/bin/bash
if [[ $# -eq 0 ]]
then
	echo "Não foram passados parâmetros..."
else
	ARGUMENTO1=$1
	ARGUMENTO2=$2
	echo "O valor 0 retorna ao nome do arquivo: $0"
	echo "O valor # retorna a quantos argumentos foram passados: $#"
	echo "O argumento 1 passado na linha de comando foi: $ARGUMENTO1"
	echo "O argumento 2 passado na linha de comando foi: $ARGUMENTO2"
	echo "O valor @ retorna a todos os argumentos: $@"
fi
```

E ao chamar o programa na linha de Terminal, por exemplo, se usuário digitasse:

`$ bash script.sh`

A resposta seria:
`Não foram passados parâmetros...`

Mas se o usuário passe argumentos, por exemplo:

`$ bash script.sh A B C`

O resultado será:
```
	O valor 0 retorna ao nome do arquivo: exemplo.sh
	O valor # retorna a quantos argumentos foram passados: 3
	O argumento 1 passado na linha de comando foi: A
	O argumento 2 passado na linha de comando foi: B
	O valor @ retorna a todos os argumentos: A B C
```

Quando cada argumento leva espaço ou algum caracter especial, se recomenda passar cada argumento entre aspas. Caso contrário, o interpretador Bash consideraria que cada espaço indicaria um novo argumento.

Por isso, usaríamos entre aspas, desta forma:

`$ bash aniversarios.sh "Manuel da Silva" "27/09/1990"`



## TESTE de CONDIÇÕES
Toda linguagem de programação tem seu modo de realizar seu teste lógico com os dados que são obtidos ou passados. É mais comum que se use esse teste com os comandos `if`, `for` ou `while`.

Em Bash, o teste é realizado com o uso de duplos-colchetes `([[ ]])`. Mas é muito provável que se encontre alguns exemplos com apenas um colchete `[ ]`, porém o uso de colchetes-duplos `[[ ]]` é mais recomendado e convencional por ser a opção mais moderna.

Normalmente realizamos testes com arquivos ou variáveis e o Terminal nos devolve o resultado como `true` ou `false`. Ou seja, ele nos responde se o que "perguntamos" é verdadeiro ou falso. **Verdadeiro corresponde ao valor `0` e falso ao valor `1`.**

Porém o Terminal não nos responde a menos que solicitemos sua resposta. E fazemos isso através da expressão `echo $?`. A "variável" `$?` contém a resposta que precisamos. 

A variável `$?` retornará se o comando anterior foi bem sucedido (0) ou malsucedido (1).

Observe o código a seguir:

```bash
	# passamos as variáveis:
	a=1
	b=5
	
	# realizamos um teste (uma "pergunta"): a é maior que b ?
	[[ $a > $b ]]
	
	# Note que acima, usamos o "dolar" antes do nome da variável ($a)
	# Já que para definir o valor da variável NÃO se usa o $,
	# mas para usar ou testar esta variável, é obrigatório o $ antes.
	
	# solicitamos a resposta ao Terminal se o resultado é verdadeiro ou falso:
	echo $?
	
	# A saída será esta:
	1
	# ou seja: falso, a NÃO é maior que b.

```

Para memorizar, podemos usar o seguinte exemplo no Terminal: Digite `true` ou `false` (tudo minúsculo) e depois solicite o resultado `$?`.

```bash
	$ true
	$ echo $?
	
	# resultado será:
	0
	
	# agora digite:
	$ false
	$ echo $?
	
	# resultado:
	1
	
```



### OPERADORES LÓGICOS de COMPARAÇÃO
São eles:

```bash
	-eq	# igual
	-ne	# diferente (not-equal)
	-lt	# menor que (low than)	
	-gt	# maior que (grow than)
	-le	# menor ou igual
	-ge	# maior ou igual
	
	-z $VAR		# $VAR é vazia (Zero)
	-n $VAR		# $VAR tem mais que 1 caracter.
	$VAR1 = $VAR2	# $string1 é igual a $string2
	$VAR2 != $VAR2	# $string1 é diferente de $string2
	
```

Scripts em Bash são usados muitas vezes para manipulação de arquivos, portanto, é comum que se necessite expressões próprias para comparar e testar. Como por exemplo:

```bash
	-a arq	# Arquivo existe
	-e arq	# Arquivo existe
	-d arq	# Arquivo existe e é um diretório
	-f arq	# Arquivo existe e é um arquivo regular (texto).
	-h arq	# Arquivo existe e é um link simbólico
	-L arq	# Arquivo existe e é um link simbólico (comando Ln)
	-s arq	# Arquivo existe e tem tamanho (Size) (> zero).
	-r arq	# Arquivo existe e tem permissão de leitura (read)
	-w arq	# Arquivo existe e tem permissão de escrita (write)
	-x arq	# Arquivo existe e for executável (+x)
	-N arq	# Arquivo foi alterado na última vez que foi aberto (lido).
	
	arq1 -nt arq2	# o Aquivo1 é mais novo (New) que o Arquivo2
	arq1 -ot arq2	# o Aquivo1 é mais velho (Old) que o Arquivo2
	
	! 	# negação da condição de teste.
```

Exemplos:

```bash
# cria um arq vazio:
: > arq.txt

# testa se tem tamanho (size) ou se está vazio:
[[ -s arq.txt ]] 
echo $?
# resposta: 1 - negativo

[[ ! -s arq.txt ]] 
echo $?
# resposta: 0 - positivo

# cria um diretorio vazio:
mkdir pastavazia

# testa se a pasta está vazia:
[[ -z $(ls pastavazia) ]] 
echo $?
# resposta: 0 - positivo
```

Uma lista mais extensa encontramos em:
https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions



### OPERADORES (LÓGICOS) de COMPARAÇÃO: AND E OR 
Os testes podem ser ainda mais complexos, pois se pode usar mais de uma condição a ser testada. Para isso, usamos `&&` e `||` que significa: `E` e `OU`, respectivamente.

```bash
	Ana="F"
	Marta="F"
	Pedro="M"
	
	[[ $Ana = "F" && $Pedro = "F" ]]
	echo $?
	
	# resultado será:
	1
	# (false porque AS DUAS condições precisariam ser verdadeiras)
	
	# mas SE UMA DAS DUAS condições bastava para nosso teste, usaríamos o ||
	# ou seja usaríamos o "ou" (ou uma coisa ou outra):
	[[ $Ana = "F" || $Pedro = "F" ]]
	echo $?
	
	# resultado:
	0
```


## OPERADORES TERNÁRIOS
Para realizarmos condições simples que dependendo do resultado do teste **não vão implicar tantos blocos de código***, se pode usar o modelo ternário (tipo lambdas, em Python) para aplicar uma condição no código.

Sendo que:
- O teste será feito entre colchetes: \[[ ... ]].
- O que o que vem após o `&&` é para resposta verdadeira (positiva) do teste e...
- O que o que vem após o `||` é para resposta falsa (negativa) do teste.

Por exemplo:

```bash
	# "a" recebe 1:
	a=1
	
	# o valor de "a" é 1 ?:
	[[ $a -eq 1 ]] && echo "sim" || echo "nao"
	# resultado: sim
	
	# o valor de "a" é 2 ?:
	[[ $a -eq 2 ]] && echo "sim" || echo "nao"
	# resultado: nao
```

\* Com operadores ternários também se pode usar também blocos de código usando chaves "{...}" (se temos de passar mais de um comando). 

Dessa forma:

```bash
	[[ ...teste... ]] &&
	{
		# bloco de comandos em caso positivo
	} ||
	{
		# bloco de comandos em caso negativo
	}
```

**Acima:** *Atenção em onde se coloca os duplos-pipes* (||) *- na mesma linha do colchete que fecha o bloco anterior.*

Um exemplo mais prático será mostrado mais à frente quando tratarmos do comando `case`.

**Exemplos para verificação de arquivos ou pastas:**

```bash

	# cria um arq vazio:
	: > arq.txt

	# testa se arq está vazio ou não:
	[[ -s arq.txt ]] && echo "não vazio" || echo "Arq vazio"	# -size
	[[ ! -s arq.txt ]] && echo "vazio" || echo "cheio"		# ! = negação

	# cria um diretorio vazio:
	mkdir pastavazia

	# testa se a pasta está vazia:
	[[ -z $(ls pastavazia) ]] && echo "pasta vazia" || echo "tem arquivos na pasta"
	
```



## CONDIÇÕES IF, ELIF, ELSE...
O comando `if` realizará um teste de condição, por tanto, sempre será acompanhado de duplos-colchetes `[[ ]]`, e conforme a resposta ou resultado do teste, executará um bloco de comandos. 

O formato comum do "if" é este:

### IF SIMPLES (Teste para UMA condição):
(A indentação **não** é obrigatória)

```bash
	if [[ condição ]]
	then
		# comandos...
	fi
```

**Três observações importantes:**

1) É sempre **obrigatório o espaço** entre os duplos-colchetes (tanto de abertura como de fechamento). Ou seja, a condição sempre está separada dos colchetes por espaço.

*Também se pode usar um ponto-e-vírgula após o teste de condição \[[ ]] e logo antes de `then`, mas como já foi dito, nada altera na execução do script, já que é apenas outra forma de apresentar o código.*

2) Se este mesmo código fosse passado em **uma única linha**, separaríamos cada sentença com o ponto-e-vírgula (;), com a **única exceção entre o fim da palavra reservada `then` e o comando seguinte**. Ficando desta forma:

`if [[ condição ]]; then comando1; comando2; fi`

3) O teste de condição é terminado com a expressão `fi`. Que nada mais é o inverso de `if`.


### IF E ELSE (Teste para 2 condições):
Quando se tem duas condições, usamos também o `else` para separar os dois blocos de comando. Porém, nesse caso, a condição só teria como resposta uma de duas alternativas: Sim ou não. Se sim, executa tudo o que vem depois de `then`; se não, se executará tudo o que vem depois de `else`:

```bash
	if [[ condição ]]
	then
		# comandos...
	else
		# comandos...
	fi
```

Lembre-se que a indentação usada aqui é apenas para fins de melhor visualização, pois ela não altera em nada o funcionamento do código. 

OBS.: Caso se use o `if-else` **numa única linha**, é importante que não se coloque ponto-e-vírgula depois das palavras reservadas `them` e `else`. Como no exemplo:

`if [[ condição ]]; then comando1; comando2; else comando1; fi`


### IF, ELIF, ELSE (Teste para mais de duas condições):
Quando se pode ter mais que uma resposta para o teste de condição (e não apenas sim ou não como resposta), usamos o `elif` quantas vezes necessário, e por último um único `else`:

```bash
	if [[ condição ]]
	then
		# comandos...
	elif
		# comandos...
	else
		# comandos...
	fi
```

OBS.: Caso se use o `if-elif-else` **numa única linha**, é importante que não se coloque ponto-e-vírgula depois das palavras reservadas `them`, `elif` e `else`. Como no exemplo:

`if [[ condição ]]; then comando1; comando2; elif comandos; else comando1; fi`


Também como outra alternativa para if-elif-else, se pode usar o comando `case`, que será visto a seguir.


## OPÇÕES EM CASOS

```bash
	case "$variable" in
	"resposta1" )
		Comandos … ;;
	"resposta2" )
		Comandos … ;;
	"resposta3" )
		Comandos … ;;
	*)
		comando ;;
	esac
```

Particularidades de `case` no Bash:

 - Note as palavras reservadas `case` e `in` ao início e final da `$variável`.
 - A cada possível opção (entre aspas) existe um parêntesis.
 - No último comando (de cada possível opção) fecha com ";;".
 - O asterisco (*) executa o(s) comando(s) se a opção do usuário for nenhuma das anteriores.
 - O `case` sempre tem que fechar com `esac` (case ao contrário).
 


Exemplo prático de `case`:

```bash
echo "===================="
echo "Selecione uma opção:"
echo "===================="
echo "1 - Para 1a. escolha"
echo "2 - Para 2a. escolha"
echo "3 - Para 3a. escolha"
echo "4 - Para 4a. escolha"
read OPCAO			# aqui está a variável que receberá o opção do usuário.

case "$OPCAO" in
	"1") echo "Você escolheu a 1a. opção";;
	"2") echo "Você escolheu a 2a. opção";;
	"3") echo "Você escolheu a 3a. opção";;
	"4") echo "Você escolheu a 4a. opção";;
	*)   echo "Opção não encontrada.";;
esac

echo
```

Outro exemplo de `case` com `while` e `break`, e com possibilidade do usuário digitar uma opção em maiúscula ou minúscula:

```bash
while :
do
	clear
	echo "===================="
	echo "Selecione uma opção:"
	echo "===================="
	echo "A - Para 1a. escolha"
	echo "B - Para 2a. escolha"
	echo "C - Para 3a. escolha"
	echo "0 - Para Sair"
	echo
	read OPCAO
	echo

	case "$OPCAO" in
	"a" | "A") 
		echo "Você escolheu a opção A"
		read;;
	"b" | "B") 
		echo "Você escolheu a opção B"
		read;;
	"c" | "C")  
		echo "Você escolheu a opção C"
		read;;
	"0")
		echo "Saindo..."
		break;;
	*)
		echo "Opção desconhecida."
		echo "Volte a escolher outra opção!"
		read;;
	esac
	echo
done
```

Outra sugestão para o uso de `case` é trabalhando junto com parâmetros passados na linha de comando ao chamar o script. Um exemplo prático:

```bash
	[[ $# -eq 0 ]] && echo "Faltou os parâmetros" || 
	{
	PARAMETRO=$1
	case "$PARAMETRO" in
		"-a") echo "Parâmetro 'a'";;
		"-b") echo "Parâmetro 'b'";;
		"-help") echo "Parâmetro 'help'";;
		*)   echo "Parâmetro desconhecido";;
	esac
	}
```

## LISTAS / ARRAYS
As listas (arrays ou vetores) em Bash são variáveis com mais de um valor, definidos entre parêntesis e separados por espaços. Caso sejam strings, devem estar (de preferência) entre aspas.

```bash
	IDADES=(34 30 59 40)
	NOMES=("João da Silva" "Francisca Souza" "Mário Jr" "Paulo Bezerra")
	SEXO=("M" "F" "M" "M")
```
Ver tb [este site.](https://linuxsimply.com/bash-scripting-tutorial/loop/for-loop/for-array/)

**Vetores associativos**

Existe também, embora quase nunca usado, os "arrays" associativos, ou melhor dito: os vetores associativos, que usa nomes em lugar de números, para definir a posição (índice) do elemento num array. 

Não abordaremos por não ser muito usual, porém seu formato seria:

```bash
	# criamos um array associativo de nome CARROS:
	declare -A CARROS
	
	# Definimos uma placa para o carro criado:
	CARROS[fusca]=XYZ0007
	
	# Outro exemplo:
	CARROS[ferrari]=ABC7777
	
	# outro exemplo (com aspas devido o espaço no meio da string):
	CARROS[audi]="QWE 1212"
	
	# imprime apenas a placa de UM dos carros (da Ferrari):
	echo ${CARROS[ferrari]}

	# imprime o valor (placa) de cada/TODOS chave (carro)
	echo ${CARROS[@]}
		
	# imprime apenas a chave (o nome) de cada/TODOS os carros:
	echo ${!CARROS[@]}
```


## MANIPULAÇÃO de LISTAS
Em Bash o primeiro elemento (item) de um array é o número 0.

Para imprimir, adicionar, alterar ou deletar um item ao array:

*(Ao usar `echo`, sempre colocar o nome do array entre **colchetes**.)*

```bash
	# echo ${NOMES[*]}	# IMPRIME TODOS os elementos do array
	# echo ${NOMES[@]}	# IMPRIME TODOS os elementos do array
	# echo ${NOMES[2]}	# IMPRIME apenas o elemento nro. 2 do array
	# echo ${NOMES[-1]}	# IMPRIME O ÚLTIMO elemento do array
	
	# NOMES+=("Chico")	# ADICIONA um elemento à ÚLTIMA posição ("append")
	# NOMES[4]="Pedro"	# ADICIONA um elemento ao array na posição 4
	
	# NOMES[3]="Ana"	# ALTERA um elemento já existente do array
	# NOMES[-1]="Laura"	# ALTERA O ÚLTIMO elemento do array
	
	# echo ${#NOMES[*]}	# imprime o TAMANHO do array
	# echo ${#NOMES[@]}	# imprime o TAMANHO do array
	
	# unset NOMES[2]	# DELETA o item: NOMES[2]
	# unset NOMES 		# DELETA todo o array NOMES
```

**Fatiando um array**

Podemos, igualmente, tal como nas strings, manipular quais elementos de um array serão selecionados e impressos, como um fatiamento (slice), usando esta sintaxe:

`echo ${ARRAY[@]:a_partir:total_de_elementos}`

Sendo que:
 - a_partir: é o número do primeiro elemento do array que será impresso.
 - total_de_elementos: a quantidade total de elementos do array que se espera ser impressa.

*Convém lembrar que o **primeiro elemento** de um array em Bash sempre é de **número zero (0)**.*

Exemplos práticos:

```bash
	# Array NROS:
	NROS=(00 10 20 30 40 50 60 70 80 90)

	# Imprime a partir do elemento 0, três elementos no total:
	echo ${NROS[@]:0:3}
	# Resultado = 00 10 20

	# Imprime a partir do elemento 2, quatro itens no total:
	echo ${NROS[@]:2:4}
	# Resultado = 20 30 40 50

	# Imprime do 3o. ao último (se omite a quantidade total):
	echo ${NROS[@]:3}
	# Resultado = 30 40 50 60 70 80 90
```


## LAÇOS

### O laço FOR

Em Bash se usa laços (loopings) tipo FOR principalmente para percorrer o conteúdo de um arquivo ou array. Nos exemplos a seguir mostraremos como isso pode ser feito. 

Basicamente a sintaxe do FOR é esta:

```bash
	for VARIAVEL in ARQ/ARRAY
	do
		# comandos ....
	done
```

Observe que o laço é delimitado em seu início e fim pelas palavras reservadas **`do`** e **`done`**. E tudo o que esteja entre estas duas palavras, são comandos que se realizarão em CADA elemento percorrido do arquivo ou array.

Em um única linha, isso fica assim: `for VAR in LISTA; do comandos...; done`

(Note que entre o `do` e o primeiro comando não existe o ponto-e-vírgula (;).


### Uso do FOR para percorrer o conteúdo de UM arquivo:

```bash
	for CADA_ARQ in $(ls)
	do
		# comandos... 
	done
```

Note que todo o comando Bash que for usado dentro de `for` deve estar entre dolar-parêntesis, ou seja `$(comando)`.

Um exemplo muito simples:

```bash
	for CADA in $(ls)
	do
		echo "Nome do arquivo: $CADA"
	done

```
Mas se ocorra algum erro em que os nomes não aparecem de forma correta o que aconteceu foi um...:

<span id='erroIFS'></span>
<u class='vermelho'>Provável **erro** de IFS</u>:

<span class='letraPeq'>Existe uma variável de sistema chamada IFS que define os delimitadores (em arrays por exemplo) nesta ordem: espaço, tab e enter. Ou seja, cada vez que se encontra um espaço num item de array ou num nome de arquivo, o sistema interpreta que é outro item (do array) ou outro arquivo! (Isso vem pré-configurado nas distribuições Debian).</span>

<span class='letraPeq'>Sendo assim, se recomenda que antes de executar o script acima, se mude a variável IFS no Terminal desta forma:</span>

```
$ IFS='		# digite: IFS=, aspas, e pressione ENTER.
>'		# pressione aspas novamente e ENTER.
```

<span class='letraPeq'>Contudo, todas as vezes que se reinicia a máquina o valor de IFS volta a ser como o padrão. Por tanto, para que se mude persistentemente o IFS, se recomenda que altere o valor da mesma no arquivo .bashrc, adicionando esta linha:</span>

**`IFS=$'\n'`**

<span class='letraPeq'>Caso contrário, se pode adicionar esta linha acima em cada script em que se use um `for` para percorrer nomes de arquivos, arrays, etc. O que seria muito mais trabalhoso.</span>

---

**Exemplos práticos de `for` para manipulação de arquivos:** 

Há muitos exemplos em que se usa o `for` para **manipular arquivos em lote** em nosso sistema. (Lembre-se que por segurança, se recomenda um backup dos arquivos antes de rodar algum script em lote). 

Vamos renomear todos os arquivos que contém letra maiúsculas para minúsculas:

```bash
	for ARQ in *
	do
		MINUSCULA=$(echo "$ARQ" | tr A-Z a-z)
		mv "$ARQ" "$MINUSCULA"
	done

```

Observe que na linha de `for`, ao invés de usarmos a instrução `$(ls)`, usamos apenas o asterisco `*`.


**Outro exemplo prático para renomear arquivos em lote:**

Suponhamos que numa certa pasta há vários arquivos de vídeo com nomes semelhantes, por exemplo:

	video 1(854p_30fps_H264-128kbit_AAC).mp4
	video 2(854p_30fps_H264-128kbit_AAC).mp4
	video 3(854p_30fps_H264-128kbit_AAC).mp4
	
Nesse caso, vamos retirar este "sufixo" (854p_30fps_H264-128kbit_AAC) do nome de cada arquivo. Para isso, usaremos este script a fim de **renomear arquivos em lote** (retirando parte do nome):

```bash
	for ARQ in $(ls *.mp4)
	do
		NOME_NOVO=$(echo $ARQ | sed 's/(854p_30fps_H264-128kbit_AAC).mp4/.mp4/')
		# echo $ARQ $NOME_NOVO	# <-- testar antes de usar o mv (abaixo)
		mv $ARQ $NOME_NOVO
	done
```

Explicação do código: 
 - Se percorreu todos os arquivos de extensão .mp4
 - E para **cada** ARQ (arquivo), se fez:
 - Se criou um novo nome do nome antigo (ARQ) usando o comando `sed` para fazer a substituição.
 - Se renomeou o arquivo para um NOME_NOVO.

O resultado esperado é que os arquivos agora estejam com estes nomes:

	video 1.mp4
	video 2.mp4
	video 3.mp4


### Uso do FOR para percorrer o conteúdo de UM array (lista):

A forma mais tradicional de usar `for` para percorrer um array é esta:

```bash
	for CADA_ITEM in "${ARRAY[@]}"
	do
		echo $CADA_ITEM
		#comandos...
	done

	# Em uma única linha:
	for ITEM in "${ARRAY[@]}"; do echo $ITEM; done
```

Atenção: No uso do array em FOR, **não funciona com ARRAY\[*]**, mas apenas com ARRAY\[@]. 


**Porém, também se pode usar esta forma mais simples:**

```bash
	NOMES=("João da Silva" "Francisca Souza" "Mário Jr" "Paulo Bezerra")
	for i in ${!NOMES[@]}
	do 
		echo "O nome nro. $i é: ${NOMES[$i]}."
	done
```


Ou também uma forma com sequência numérica, que veremos a seguir:

### Uso do FOR para percorrer uma sequência numérica:

Para isso se usa o comando `seq`. 

Vamos executar o laço por 10 vezes:

```bash
	for X in $(seq 10)
	do
		# comandos que se repetirão X vezes. 
	done
```

Opções do comando `seq`:

```bash
	seq nro						# sequência de 1 a nro
	seq inicio fim				# sequência de inicio a fim
	seq inicio incremento fim 	# sequência de inicio a fim com passo (incremento)
	seq -s " " nro				# imprime de 1 à nro com separador espaço
	seq -s "-" nro				# imprime de 1 à nro com separador "-"
	
	# Exemplos:
	seq 0 2 20		# nros pares de 0 à 20.
	seq 1 2 10		# nros ímpares de 1 à 10.
	seq 0 10 100	# nros de 0 à 100 com passo 10.
	
```

Uso do laço `for` com o comando `seq` **para percorrer um único array (lista)**. Porém, lembre-se que um array começa com o elemento número zero (0):

```bash
	NOMES=("João da Silva" "Francisca Souza" "Mário Jr" "Paulo Bezerra")
	for NRO in $(seq 0 3)
	do
		echo ${NOMES[NRO]}
	done
```

Acima: Para automatizar o valor da sequência (que vai em `seq`) se pode usar este comando: `TAMANHO=$(( $(echo ${#NOMES[*]}) -1 ))` e em seguida: `for NRO in $(seq 0 $TAMANHO)`.


Outro exemplo prático do uso de `for` com `seq`, é **quando se pretende percorrer duas ou mais listas** em que cada um de seus elementos são correspondentes entre si. Por exemplo:

```bash
	clear
	NOMES=("João da Silva" "Francisca Souza" "Mário Jr" "Paulo Bezerra")
	IDADES=(34 30 59 40)
	SEXO=("M" "F" "M" "M")
	
	for NRO in $(seq 0 3)
	do	
		echo "Nro. do registro: $NRO"
		echo "Nome: ${NOMES[NRO]}"
		echo "Idade: ${IDADES[NRO]}"
		echo "Sexo: ${SEXO[NRO]}"
		echo
	done
	echo "Fim do Script."
```

Mas para o perfeito funcionamento deste script acima é necessário que todas as listas (arrays) tenham o mesmo tamanho, ou seja, o mesmo número de elementos.

Observe também que ao final do laço (logo abaixo do `done`), se executará uma mensagem de término do script, que só rodará uma única vez (já que está fora do laço).

Exemplo simples em uma única linha:

```bash
	# percorre o(s) array(s):
	for X in $(seq 0 10); do echo ${PRODUTO[X]} - ${PRECO[X]}; done
```


### Uso do FOR para percorrer o conteúdo de VÁRIOS arquivos:
Um exemplo mais complexo em que se percorrerá vários arquivos, com um mesmo número de linhas, em que cada linha de cada arquivo corresponde a um mesmo registro. 

Certamente que poderíamos usar o comando `paste` para concatenar estes arquivos como se fosse um único com várias colunas, porém a intenção não é colocar os conteúdos lado-a-lado, mas um debaixo do outro.

Assim, usaremos o `for` da seguinte maneira:

```bash
	QTAS_LINHAS=$(cat arq1.csv | wc -l)
	for NRO_LINHA in $(seq $QTAS_LINHAS)
	do
		echo $(sed -n "$NRO_LINHA"p arq1.csv) >> arq_final.txt
		echo $(sed -n "$NRO_LINHA"p arq2.csv) >> arq_final.txt
		echo $(sed -n "$NRO_LINHA"p arq3.csv) >> arq_final.txt
		echo "========" >> arq_final.txt
	done
```

Explicação do código: 
 - O laço se executará X vezes, 
 - Sendo que X é o número de linhas que os arquivos possuem.
 - A cada número de execução, ele extrairá a linha de mesmo número de cada arquivo e...
 - Imprimirá num arquivo a parte chamado arq_final.txt
 - Se imprime a da iteração, um separador "======" 
 


## WHILE
Enquanto uma condição esteja sendo satisfeita (verdadeira), o código estará sendo executado.

```bash
	while [[ condicao ]]
	do
		# comandos...
	done
```

Tipo `while true`:

Sintaxe:

```bash
	while true
	do
		# comandos...
	done
```

Porém, também é válido usar o `:` ao invés da palavra reservada `true`. O que é até mais rápido na execução:

```bash
	while :
	do
		# comandos... 
	done

```

Comprove com os dois exemplos abaixo o tempo de execução dessas duas sintaxes:

```bash
	i=0; time while true; do ((i++>100000)) && break; done
	i=0; time while :; do ((i++>100000)) && break; done
```


## CONTINUE - BREAK
Para que um código não caia num looping infinito (principalmente quando se usa o `while true`, é preciso estabelecer uma condição de 'escape' para que o código seja interrompido. Como também formas de que se possa executar o fluxo, saltar para um próximo elemento do looping sem executar uma função em certo elemento ou simplesmente "quebrar" o fluxo.

Observe o código, para exemplos de `continue` e `break`:

```bash
	for NRO in 1 2 3 4 5 6 7
	do
		if [[ $NRO -eq 3 ]]
		then
			echo "Pulando o três..."
			continue
		fi
	echo $NRO
	done
```

O pequeno exemplo acima, percorre uma lista (observe o formato também válido en `for`) e se coloca uma condição que ao chegar o 3o. item, se pule e não imprima seu valor na tela. Porém, não se interrompe o fluxo, porém segue executando os comandos para os demais da lista (fila).

Agora temos um exemplo de `break` em que o laço termina, interrompe, "quebra":

```bash
	for LETRA in "A" "B" "C" "D" 5 "F" "G"
	do
		if [[ $LETRA =~ [0-9] ]]
		then
			echo "Chegamos a um elemento inválido. Interrompendo o laço..."
			break
		fi
		echo $LETRA
	done
```

Acima, enquanto o código percorria cada elemento, se verificava qual continha números (\[0-9]), porque cumprindo essa condição, o laço seria completamente interrompido com o comando `break`. (Note que para comparar expressões regulares, se usa o `=~` dentro do test do if).

**Analogia para entender o funcionamento de `continue` e `break`**

Para memorizar melhor a relação entre os laços e `continue` e `break` podemos ter em mente a seguinte analogia:

Suponhamos que você administra a entrada de um evento em que há uma fila com pessoas com ingressos para entrar no local. A condição para entrar é ter o boleto de ingresso e você verifica um a um se cumpre com essa condição.

De repente, chega a vez de um indivíduo que tem algum problema com seu boleto. Então, o que você faz? Ao ver que não cumpre com as condições, não pode interromper todo o resto da fila por causa dele, logo, coloca ele de lado, e diz: "Próximo!" e a fila **continua**. Ou seja, com isso, você não interrompeu o fluxo da fila, mas com um comando (ordem) fez que a fila continuasse. Isso é o que faz o comando `continue`. Ao ser encontrado, ele sem interromper o fluxo do laço, faz com que continue o próximo da fila (lista, array, vetor, etc). Em termos mais técnicos, o `continue` coloca a execução na linha seguinte de `while` ou de `for`, etc..., ou seja, uma linha após o `do` sem terminar (sair, interromper) o laço.

Voltando à analogia, suponha que você continua verificando a fila e agora nota que chegou a sua hora do almoço. **É hora do seu break!** de interromper seu trabalho porque chegou uma condição de parar para o almoço. Você então interrompe o trabalho e já não vai mais executar aquela tarefa repetitiva, senão outra: A de almoçar.

Isso é o que faz o comando `break` num código! Ele simplesmente, ao deparar-se com certa condição (situação), ele para tudo. Ele já **não continua** aquela tarefa repetitiva (ou seja, aquele laço). Mas sai dele. Em termos técnicos, o `break` vai para uma linha após o `done`.

```
	continue => Vai para a linha abaixo do comando "do" 
	(Não sai do laço, mas continua o próximo item).

	break 	 => Vai para a linha abaixo do comando "done" 
	(Sai do laço de repetição).
```

## INCREMENTOS
```bash
	# incremento (3 opções):
	((num++))
	((n=n+1))
	((n+=1))
	
	# decremento (3 opções):
	((num--))
	((n=n-1))
	((n-=1))	
```

## FUNÇÕES 

Sintaxe das funções - Define apenas com o seu nome e parêntesis:

```bash
	funcao()	# cria a função
	{
		# comandos...
	}	

	funcao		# chama a função

```

Ou também se pode usar desta forma (com a palavra reservada **function**, mas **sem parêntesis**):

```bash
	function funcao
	{
		# comandos...
	}	

	funcao
```


### Funções assíncronas:

Existe uma forma de que as funções se executem **assincronizadamente**, ou seja, que não tenham que esperar uma pelas outras, mas que rodem independentemente uma das outras. Para isso, basta acrescentar o caracter especial `&` ao chamá-las, desta forma no exemplo a seguir:

```bash
	function funcao1
	{
		echo "inicia funcao 1"
		sleep 5
		echo "Termina a funcao 1"
	}


	function funcao2
	{
		echo "inicia funcao 2"
		echo "Termina a funcao 2"
	}

	funcao1 &
	funcao2 &
```

Na execução deste script, a função 2 já é executada sem esperar que a função nro. 1 termine. 

Numa linha de comando de Terminal, o uso do caracter `&` logo após chamar um comando ou um arquivo, faz que o Terminal fique liberado para executar outras tarefas. 

Por exemplo:

`chromium &`

Abre o navegador sem deixar o Terminal "preso" ou "ocupado" até que ele se feche (isso é importante quando desenvolvemos um script que envolva o navegador e outras ferramentas em conjunto).


### Variáveis locais e globais na função:

Todas as variáveis são globais a menos que se use a palavra reservada `local` para defini-la como local, isto é, com seu valor distinto apenas enquanto está dentro da função:

```bash
	VAR1=1
	echo "Valor de VAR1 antes de executar a função: $VAR1"

	funcaoX () {
	  local VAR1=20
	  echo "Valor de VAR1 dentro da função: $VAR1."
	}	

	funcaoX
	echo "Valor de VAR1 após de executar a função: $VAR1"
```

### Funções que recebem parâmetros

Também é possível passar argumentos para serem processados dentro da função. Os parâmetros são definidos como $1 à $... Por exemplo:

```bash
	soma () {
	  echo $(($1 + $2))
	}

	soma 5 2
	
	# resultado: 7
```


## TRATAMENTO de ERROS: EXCEPT / TRY 
```bash
	

```

## MÓDULOS / BIBLIOTECAS PARA IMPORTAR: 

+ Ler arq/web/xls/doc/json/xml; 
+ Escrever txt,pdf, etc
+ Redirecionamentos

```bash
	

```


<style> img {float: right; margin-left:5px;} h2 {color: #A6FF00; background: #000000; padding-left: 0.5rem; padding-top: 3px;} .vermelho{color:red;} .letraPeq {font-size: 0.7em;} .direita {display: block; text-align: right;}</style>

