![](bash.png)
# BASH <span id='topo'></span>

A linguagem Bourne-Again Shell (Shell Nascido de Novo) foi lançada inicialmente em 1989. Desenvolvida por Brian Fox e Chet Ramey. É o Shell Script padrão nos derivados de UNIX e nas várias distribuições Linux. **Resumindo: o Bash é a linguagem do Linux!**

A documentação oficial da linguagem está em:
https://www.gnu.org/software/bash/manual/bash.html

## > Índice:
- [CLI ou GUI](#cli)
- [Shebang: Inicio do Programa](#shebang)
- [Comentários](#comentarios)
- [Extensão dos Arquivos Bash](#extensao)
- [Sintaxe de Comandos no Script](#sintaxe)
- [Entrada de Dados 1: Variáveis](#variaveis)
- [Operações e Operadores Aritméticos](#operadores)
- [Imprimir na Tela](#imprimir)
- [Concatenação](#concatenacao)
- [Manipulação de Strings](#strings)
- [Curingas e Expansão de Chaves](#curingas)
- [Entrada de Dados 2: Comando Read](#read)
- [Entrada de Dados 3: Parâmetros Em Linha Do Terminal](#parametros)
- [Teste de Condições](#teste)
- [Operadores Ternários](#ternarios)
- [Condições If, Elif, Else](#if)
- [Opções em Casos](#casos)
- [Listas / Arrays](#listas)
- [Manipulação de Listas](#manipulacao)
- [Laços](#lacos)
- [While](#while)
- [Continue - Break](#continue)
- [Incrementos](#incrementos)
- [Funções](#funcoes)
- [Tratamento de Erros](#erros)
- [Importando Outros Arquivos](#importando)
- [Lendo e Escrevendo Arquivos](#arquivos)
- [Redirecionamentos](#redirecionamentos)
- [Integração Com Outras Linguagens](#integracao)


(Ao clicar sobre o nome de um dos temas abaixo retornará ao topo).


## <a class="up" href="#topo">> CLI OU GUI <span id='cli'></span></a> 
"Command-Line Interface" ou "Graphical User Interface"?
 
Quase sempre os scripts em Bash são para desenvolvimento de programas CLI.

Mas há opções em GUI, especialmente as que requerem muitos menus, para isso se usa ferramentas como: Dialog, ou Zenity, ou Whiptail, etc.


## <a class="up" href="#topo">> SHEBANG: INICIO DO PROGRAMA <span id='shebang'></span></a> 
```bash
	#!/bin/bash
```

## <a class="up" href="#topo">> COMENTÁRIOS <span id='comentarios'></span></a> 
Comentários depois do símbolo: #.

```bash
	# comentário... 
```

## <a class="up" href="#topo">> EXTENSÃO DOS ARQUIVOS BASH<span id='extensao'></span></a> 
Normalmente se salva um script Bash com a extensão `.sh`, como por exemplo: `nome_arquivo.sh`. Mas também se pode encontrar (raramente) a extensão `.bash`; ou até sem extensão (em casos de scripts salvos na pasta /bin que receberam permissão para serem executáveis (`chmod -x arq`)).


## <a class="up" href="#topo">> SINTAXE DE COMANDOS NO SCRIPT  <span id='sintaxe'></span></a> 
Dentro do script os comandos estarão cada um em uma linha, sem a necessidade obrigatória de indentação em caso de funções e/ou laços, ou mesmo todos os comandos podem estar **numa única linha** separados por ponto-e-vírgula (**;**).

```bash
	comando1
	comando2
	comando3
```

Ou, em uma única linha: 

`comando1; comando2; comando3`


## <a class="up" href="#topo">> ENTRADA DE DADOS 1: Variáveis <span id='variaveis'></span></a> 
Toda linguagem de programação se utiliza de dados. Esses dados, podem ser pré-definidos no sistema, capturados pelo programa, ou definidos pelo usuário do programa. 

Sem dados, um programa não funciona e nem precisaria existir! 

E qual é a forma mais básica desses dados "chegarem" a um programa? Resposta: Por meio das variáveis. É por elas que passamos os dados para que um programa execute sua(s) função(ões), isto é, as variáveis realizam a entrada de dados para que um programa funcione. 

Variáveis definem qual serão os dados que serão usados, o tipo e qual será o nome deles. Em Bash, se diz que "tudo é texto". E por ser uma linguagem não-tipada, não se define o tipo das variáveis. 

Para **nomes das variáveis**, como de costume, se evita caracteres alfanuméricos e nomes que iniciem com números. Porém, também se pode começar com um underline ( _ ).

Por convenção, nomes de variáveis em Bash aparecem em letras maiúsculas, porém não é regra.

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

Se o valor (conteúdo) que uma variável recebe tenha espaço(s); por exemplo: seja uma frase, nome completo, etc; é preciso colocar esse conteúdo dentro de aspas. Caso contrário, a variável armazena apenas a primeira palavra (ou número) antes do primeiro espaço.



## <a class="up" href="#topo">> OPERAÇÕES E OPERADORES ARITMÉTICOS <span id='operadores'></span></a> 
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

## <a class="up" href="#topo">> IMPRIMIR NA TELA <span id='imprimir'></span></a> 

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

### Comando printf

### Comando tput

(Alinhar, justificar, decimais, cores, peso, fonte, etc)


## <a class="up" href="#topo">> CONCATENAÇÃO <span id='concatenacao'></span></a> 
Ao usar o valor de uma variável junto com um texto, se recomenda colocar ambos entre aspas duplas ("...").

```bash
	NOME='José'
	SOBRENOME='da Silva'
	IDADE=30
	BOASVINDAS="Seja bem-vindo $NOME $SOBRENOME! Feliz aniversário de $IDADE anos!"
	echo $BOASVINDAS
```

## <a class="up" href="#topo">> MANIPULAÇÃO DE STRINGS<span id='strings'></span></a> 

Recursos do Bash para manipulação de strings.

### Fatiando uma string

É possível manipular um string, ou seja, uma variável que tenha conteúdo de string, fatiando-a para obter apenas um pedaço da mesma. A sintaxe é:

`echo ${VARIAVEL:início:qtde}`

Sendo que:
 - É obrigatório o uso de colchetes ( { } ) depois de dolar ($).
 - *início*: é o início da string. A primeira letra que será impressa.
 - *qtde*: a quantidade de letras que serão impressas.
 
Obs.: O parâmetro *qtde* **não** é o último índice, mas a **quantidade** dos elementos que se deseja fatiar.

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
	
	# se pode criar uma nova variável para armazenar o conteúdo de dia:
	DIA_DE_NATAL=$(echo ${PROX_NATAL:0:2})
	
	# agora testamos ao imprimir seu valor:
	echo $DIA_DE_NATAL
	
	# saída na tela = 25
```

*Não esquecer*: Ao manipular o conteúdo de uma variável, se usa **sempre os colchetes antes** do início do nome da variável, já que o Bash interpreta que uma variável também é um array, ou seja, uma lista, ou conjunto de caracteres. Mais adiante, no tema de "Arrays" veremos isso mais claramente. 


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


### Substituindo trechos numa string 

Podemos igualmente, substituir o conteúdo de uma string, muito parecidamente com o comando `sed`. Sintaxe:

`echo ${VARIAVEL/antes/depois}`

Onde:
 - *antes*: é o valor (conteúdo) que se quer alterar por:
 - *depois*: que é o conteúdo que será colocado em lugar de "antes".
 
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


### Convertendo o conteúdo de uma string para maiúsculas ou minúsculas

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


## <a class="up" href="#topo">> CURINGAS E EXPANSÃO DE CHAVES <span id='curingas'></span></a> 

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


## <a class="up" href="#topo">> ENTRADA DE DADOS 2: Comando Read <span id='read'></span></a> 

```bash
	echo "Por favor, digite com uma informação: "
	read ENTRADA
	echo
	echo "Obrigado!"
	echo "Sua informação foi esta: $ENTRADA."
	echo
```

## <a class="up" href="#topo">> ENTRADA DE DADOS 3: Parâmetros em linha do Terminal  <span id='parametros'></span></a> 
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



## <a class="up" href="#topo">> TESTE DE CONDIÇÕES <span id='teste'></span></a> 
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

### OPERADORES LÓGICOS DE COMPARAÇÃO
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



### OPERADORES (LÓGICOS) DE COMPARAÇÃO: AND E OR 
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


## <a class="up" href="#topo">> OPERADORES TERNÁRIOS <span id='ternarios'></span></a> 
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



## <a class="up" href="#topo">> CONDIÇÕES IF, ELIF, ELSE... <span id='if'></span></a> 
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


## <a class="up" href="#topo">> OPÇÕES EM CASOS <span id='casos'></span></a> 

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

## <a class="up" href="#topo">> LISTAS / ARRAYS <span id='listas'></span></a> 
As listas (arrays ou vetores) em Bash são variáveis com mais de um valor, definidos entre parêntesis e separados por espaços. Caso sejam strings, devem estar (de preferência) entre aspas.

```bash
	IDADES=(34 30 59 40)
	NOMES=("João da Silva" "Francisca Souza" "Mário Jr" "Paulo Bezerra")
	SEXO=("M" "F" "M" "M")
```
Ver tb [este site.](https://linuxsimply.com/bash-scripting-tutorial/loop/for-loop/for-array/)


### Vetores associativos

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


## <a class="up" href="#topo">> MANIPULAÇÃO DE LISTAS <span id='manipulacao'></span></a> 
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

### Fatiando um array

Podemos, igualmente, tal como nas strings, manipular quais elementos de um array serão selecionados e impressos, como um fatiamento (slice), usando esta sintaxe:

`echo ${ARRAY[@]:inicio:total}`

Sendo que:
 - *inicio*: é o índice do primeiro elemento do array que será impresso.
 - *total*: a quantidade total de elementos do array que se espera ser impressa.

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


## <a class="up" href="#topo">> LAÇOS <span id='lacos'></span></a> 

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
<u class='vermelho'>Provável erro de IFS</u>:

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
 


## <a class="up" href="#topo">> WHILE <span id='while'></span></a> 
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


## <a class="up" href="#topo">> CONTINUE - BREAK <span id='continue'></span></a> 
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

## <a class="up" href="#topo">> INCREMENTOS <span id='incrementos'></span></a> 
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

## <a class="up" href="#topo">> FUNÇÕES <span id='funcoes'></span></a></a>

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


## <a class="up" href="#topo">> TRATAMENTO DE ERROS <span id='erros'></span></a>
Algo tipo try/catch do Javascript ou try/except em Python ???
 
```bash
	

```

## <a class="up" href="#topo">> IMPORTANDO OUTROS ARQUIVOS<span id='importando'></span></a> 

Tal como na maioria das linguagens de programação, em Bash também podemos realizar o procedimento de importar valores de outros scripts. Para isso, usamos o comando `source`. Tal comando nos ajuda a manter um projeto mais organizado se dividimos todas as funções em partes distintas e as chamamos dentro de um script "mestre". Isso também facilita na depuração e correção de erros.

Suponhamos que temos um arquivo fonte de dados chamado `Biblioteca` (poderia chamar de qualquer nome e pode ou não ter extensão), seu conteúdo é:

```
	USUARIO="José Silva"
	SENHA="12345678"
	SITE="facebook.com"
```

Agora, dentro de nosso script em Bash, vamos importar essas informações para processá-las:

```bash
	#!/bin/bash

	source Biblioteca

	echo "Imprimindo valores importados do arquivo fonte"
	echo "----------------------------------------------"
	echo $USUARIO
	echo $SENHA
	echo $SITE
	echo
```

Ao executarmos este script acima, notaremos que ele trouxe todas as informações de nosso arquivo fonte para dentro dele e executou o que tinha que fazer.

Mas poderíamos também ter no arquivo fonte uma função, ou mesmo comando Bash. E ao ser importado seu conteúdo, o executaria exatamente na linha onde está o comando `source`. 

Vejamos o exemplo do arquivo `Soma` que tem apenas um comando de limpar a tela e uma função de somar dois números.

```
	clear
	soma () {
		  echo $(($1 + $2))
	}

```

Agora temos um script que em algum momento chamará aquela função:

```bash
	#!/bin/bash
	echo "++++++"
	# só agora se chamará e executará o conteúdo do arquivo-fonte:
	source Soma
	echo -n "Realizando a soma de 10 + 30: "
	soma 10 30
```

OBS.: É importante lembrar ao usar um projeto como este:
 - O comando `source` deve ser usado dentro do script Bash
 - No arquivo a ser importado, **não** se usa o Shebang (`#!/bin/bash`).


## <a class="up" href="#topo">> LENDO E ESCREVENDO ARQUIVOS <span id='arquivos'></span></a>
Uma das grandes vantagens da linguagem Bash é a facilidade de ler arquivos texto e escrevê-los sem necessidade de importar qualquer módulo ou biblioteca como ocorre nas demais linguagens.

### Arquivos texto

**Lendo arquivos texto**

Os arquivos texto são abertos por qualquer editor como Nano, Vim, Gedit, VSCodium, etc. São arquivos texto, os com extensão: .txt, .md, .csv, etc. São facilmente lidos pelo sistema com o uso do comando `cat`:

`cat arquivo.txt`

Ou sem rolar todo o seu conteúdo: 

`cat arquivo.csv | less`

Exibir todo o conteúdo de um arquivo com o número de cada linha dele:

`cat -n arquivo`

Lendo apenas a linha 23 do arquivo:

`sed -n 23p arquivo`

Também se pode ler apenas as primeiras (20) linhas dele:

`cat arquivo.md | head -n20`

Omitindo a flag `-n20`, se imprimiria o padrão: 10 linhas.

Lendo as 10 últimas linhas de um arquivo:

`cat arquivo | tail`

Lendo as linhas de 15 à 30 do arquivo texto:

`sed -n 15,30p arquivo`


**Script para ler cada linha de um arquivo**

Um simples exemplo se precisamos ler um arquivo linha por linha, para abrirmos os URLs de páginas web contidos nele:

```bash
	for LINK in $(cat urls.txt)
	do
		chromium --new-tab $LINK &
		# ou: 
		# firefox --new-tab $LINK &
	done
```

São inúmeras as possibilidades de usar o `cat` dentro de um laço a fim de ler cada linha de um arquivo.

**Comandos de edição de arquivos**

O Bash tem a facilidade de em uma linha de comando executar rapidamente coisas que levaria tempo e muitas linhas de código em outras linguagens! Os comandos que geralmente se usa para fazer estas edições são: grep, sed, awk, paste, cut, sort, etc...

Exemplos:

```bash
	# captura apenas as linhas com "certa mensagem" de um arquivo para outro:
	grep "Certa Mensagem" origem.txt > novo_arquivo.txt
	
	# muda nas linhas que contenham "alguma coisa" para "outra coisa"...
	# gerando um novo_arquivo:
	sed 's/alguma coisa/outra coisa/g' origem.txt > novo_arquivo.txt
	
	# ou mudando e salvando as mudanças no mesmo arquivo:
	sed -i 's/alguma coisa/outra coisa/g' origem.txt

	# Para adicionar uma "coluna" a uma planilha CSV gerando uma nova:
	paste -d";" origem.csv coluna.csv > novo_arq.csv
	
	# deleta a linha que contenha a expressão "OMITIR":
	sed -i /OMITIR/d arquivo.txt
	
	# ordena um arquivo:
	sort arquivo > novo_arquivo
	
	# retira do arquivo as linhas duplicadas:
	sort desordenado.txt | uniq > ordenado.txt
	sort -u desordenado.txt > ordenado.txt
		
	# ordena uma planilha CSV pela 3a coluna:
	sort -t";" -k3 planilha.csv > novo.csv
	
	# se pode usar as flags -h e/ou -n para ordenar números:
	sort -t";" -k3 -n -h planilha.csv > novo.csv
	
	# ordenar em ordem reversa:
	sort -r lista.csv > reversa.csv
	
	# também se pode DES-ordenar:
	sort -R ordenados.txt > embaralhados.txt
	
	# Da planilha CSV extrai apenas a coluna 2 (delimitador = ;):
	cut -d";" -f2 planilha.csv > coluna2.csv
	# outro exemplo com delimitador = ",":
	cut -d"," -f1 planilha.csv > nomes.csv
```

**Escrevendo em arquivos texto**

Mais adiante, no tema de *Redirecionamentos* vamos tratar com muitos detalhes sobre este tema, porém é muito fácil "escrever" em arquivos textos:

`echo "Escrevo uma linha" >> arquivo.txt`

No exemplo acima, adicionamos a frase na última linha. Já que usamos o caracter de redirecionamento ">>".

Se fossemos criar um arquivo já escrevendo algo nele, ou recebendo o conteúdo de uma variável ou de outro(s) arquivo(s) usaríamos o caracter ">, como no exemplo:

`echo "blablabla" > arquivo_novo.txt`

ATENÇÃO: Caso o arquivo exista, por usarmos o caracter ">", ele seria **sobrescrito**, isto é, todo **seu conteúdo anterior seria apagado** e agora assumiria este novo!

```bash
	# criando um novo arquivo com uma frase:
	echo "ola mundo" > arquivo_novo
	
	# novo arquivo recebendo o conteúdo de uma variável:
	echo $VARIAVEL > arquivo.txt
	
	# novo arquivo recebendo o conteúdo (linhas de 10 a 20) de outro:
	sed -n 10,20p arq1.csv > arq2.csv

	# novo arquivo recebendo todo o conteúdo de outro:
	cat arqAntigo.txt > arqNovo.txt
	
	# fazendo uma fusão de arquivos (um "merge"):
	cat arq1 arq2 arq3 > arqTotal
```

**Criando um arquivo vazio**

Para criar um arquivo vazio, a fim de, posteriormente, receber algum conteúdo, se pode utilizar qualquer um destes comandos abaixo:

```bash
	touch arquivoVazio.txt
	
	:> arquivoVazio.txt
	
	cat > arquivoVazio.txt
	
	echo > arquivoVazio.txt
```

### Arquivos de outros formatos

Quanto a arquivos de outros formatos, como JSON, DOC, XML, etc., o próprio Linux conta com inúmeros comandos que abrem, leem ou mesmo convertem estes arquivos de forma que podemos acessar tais dados sem problemas.

Apesar que o Bash não é tão usado para manipular arquivos desse gênero, porém,  é possível fazer muita coisa útil com eles. Vejamos alguns exemplos:

**Arquivos do Libre Office, DOC, XLS**

```bash
	# Para abrir um arquivo doc:
	libreoffice7.6 --writer nome.doc
	
	# Abrir em modo leitura:
	libreoffice7.6 --view nome.odt
	
	# Abre um documento e já imprime:
	libreoffice7.6 --writer -p nome.doc
	
	# Abre uma planilha de Libreoffice:
	libreoffice7.6 --calc nome.odf
	
	# abre uma apresentação já em modo visual (show):
	libreoffice7.6 --impress --show -invisible arq.odp
	
	# converte todos os arquivos doc para pdf (sem abrir o programa):
	libreoffice7.6 --headless --convert-to pdf *.doc 
	
	# converte uma planilha em arquivo csv:
	libreoffice7.6 --calc --convert-to csv nome.xls
	
	# converte um arquivo doc para txt:
	libreoffice7.6 --headless --convert-to "txt:Text (encoded):UTF8" arq.doc 
	
	# fechar o libreoffice:
	killall soffice.bin
```

**Arquivos JSON**

` `

**Arquivos XML**

` `

**Arquivos PDF**

` `

**Abrindo a qualquer que seja o arquivo ou URL:**

`xdg-open file-or-url`


### Possibilidades infinitas em Bash

A capacidade do Bash manipular arquivos vai além do que normalmente se usa e imagina, já que existem muitos comandos capazes de manipulação de imagens por meio de scripts, edição e criação de vídeos ou áudio, automação do sistema e das janelas, mineração de dados da web, extração de arquivos da web, etc. Enfim, todo tipo de arquivo em que seu programa pode ser aberto via Terminal do Linux com opções de flags (parâmetros) que realizam funções sem o usuário ter que "clicar" ou digitar manualmente é possível de ser manipulado por um script feito em Bash! 

Resumindo: Todo programa de computador tem seu modo de operar via CLI (Command-Line Interface), e portanto, é possível manipulá-lo usando a linguagem Bash.

Recomendamos que se estude os comandos a seguir com suas flags (basta digitar no seu Terminal `man` seguido do nome deles) ou seu nome seguido de `--help` para ver as suas possibilidades.

Além de outras infinitas usabilidades que esta poderosa linguagem oferece:

- ffmpeg
- imagemagick
- curl
- wget
- html-xml-utils (https://www.w3.org/Tools/HTML-XML-utils/README)
- mariadb
- xdotool
- wmctrl 
- xclip
- pandoc
- pdfgrep, pdfunite, pdfseparate
- crontab (manipulação de horários de execução de scripts ou programas)
- Manipulação completa de todos os arquivos do sistema
- Monitoramento da máquina, da rede ou de tráfego de um site
- Gestão de servidores e de redes (99.99% dos servidores são Linux/Unix)
- Uso para sistemas embarcados e dispositivos de IoT (Internet das coisas)
- Scripts para OSINT (Inteligência de código aberto)
- Scripts para segurança da informação (ou hacking ético e preventivo)

etc...

## <a class="up" href="#topo">> REDIRECIONAMENTOS<span id='redirecionamentos'></span></a> 

Quase todos os comandos têm uma entrada de dados, uma saída de dados e uma saída de erro (caso exista). Nos comandos e scripts do Shell, assim temos:

 - A "Entrada Padrão" é o teclado. Tecnicamente chamada de "stdin" com **valor 0**.
 - A "Saída Padrão" é a tela. Tecnicamente chamada de "stdout" com **valor 1**.
 - A "Saída de Erro". Tecnicamente chamada de "stderr" com **valor 2**.
 
Porém, se pode modificar a entrada e saída padrões para que ao invés de obedecerem o padrão (standard), receberá ou enviará para arquivo, variável ou outro comando, etc. Esta modificação se chama **redirecionamento**.

Geralmente a entrada é simbolizada pelo caracter `<` e a saída por `>`. E a sintaxe desta forma:

`comando < entrada` ou `comando > saída`.

Exemplo:

Abra seu Terminal e digite o seguinte comando:

`ls`

O que ocorrerá?

Certamente na tela do seu computador aparecerá todos os arquivos contidos no diretório atual em uso. O resultado do comando sai na tela, porque o "stdout" é o padrão: a tela. Porém, vamos mudar isso para:

`ls > arquivos.txt`

Agora, ao invés de aparecer a saída do comando na tela, sairá para um arquivo de nome 'arquivos.txt' (que poderia ter outra extensão ou nenhuma).

Esse foi um exemplo mais básico de redirecionamento.

**Importante:** Note que o comando não deixa de ser executado mesmo que tenhamos modificado sua saída. Ele só não vai aparecer o resultado na tela. Mas caso necessite que o resultado apareça em duas saídas: tela e arquivo, usamos o comando `tee`:

`ls | tee lista_arquivos.txt`


### Lista de Redirecionamentos de Saída e de Erros

Abaixo os caracteres especiais para redirecionar saída de dados ou de erro de um comando:

| **Caracter** | **Redirecionamento** |
|----------|------------------|
|    >     | Modifica / Redireciona a saída do comando ou do programa (script) para um arquivo novo que se criará. Cada vez que for executado, cria um novo arquivo. |
|    >>    | Modifica / Redireciona a saída do comando ou do programa para anexar (append) ao final de um arquivo já existe. Não cria novo arquivo, nem apaga o existente, mas **adiciona** após a última linha. |
|    2>    | Modifica / Redireciona a saída da mensagem de **erro** para um arquivo e não para a tela. Mesmo que não tenha erro, será criado um arquivo de erro que ficará vazio. Note que o número 2 é justamente o valor de "stderr". O valor de saída (1) é omitido, mas `>` seria o mesmo que `1>`. |
|    &>    | Faz com que tanto a saída do comando como a saída de erro sejam redirecionadas para um arquivo. Ou seja, não aparecerá na tela nem a saída do comando, nem o erro (se houver) para o monitor, mas para um arquivo escolhido. |
|   \|    | O "pipe" é usado para que a saída do comando ou script continue sendo processada pelo comando a seguir. Tudo o que foi resultado do comando será agora processado pelo comando à direita de pipe. Por ex.: `cat lista.csv \| head -n15`, em que todo o conteúdo do arquivo "lista.csv" que deveria aparecer na tela, antes seja processado para o comando "head" que filtra para imprimir apenas as 15 primeiras linhas. |
|   tee   | O comando "tee" permite que tenhamos duas saídas: Tanto a tela (saída padrão) como um arquivo (uma saída extra). Ele é usado como segundo comando (depois de pipe), como ex.: `ls \| tee meusArqs.txt`. *OBS*.: Esse comando cria novo arquivo, porém se pretendemos anexar ao final de um arquivo já com conteúdo (apenas adicionando mais dados), usamos a flag `-a` (append). Ex.: `echo "Mais uma linha" \| tee -a linhas.dat`, em que a frase aparece em tela e também é salva ao final de um arquivo já existente. | 

Outros exemplos:

```bash

	... 2> /dev/null 
	# A mensagem de erro (`2>`) é redirecionada não para arquivo, 
	# mas para o "buraco negro" do Linux: /dev/null 
	# um diretório que tudo que é jogado lá, deixa de existir.

```

### Lista de Redirecionamentos de Entrada

Uma lista dos caracteres especiais para redirecionamento de entrada de dados a um comando ou script: 

| **Caracter** | **Redirecionamento** |
|----------|------------------|
|    <     | A entrada padrão é modificada já não sendo mais o teclado, mas um arquivo ou texto. |
|   <<     | A entrada padrão é modificada igualmente, delimitando um início e fim de expressões (strings) que serão colocadas dentro de um arquivo (muitas vezes encontraremos o nome "EOF" *(End Of File)* em exemplos pela internet). No seguinte tópico trataremos de seu uso. | 
|   <<<    | Substitui o pipe, mas neste caso, o que está à direita de <<< será a entrada do que o comando executará. Ver em outros exemplos como é usado. Vantagem: O processamento de "<<<" é mais rápido que usar comandos separados por "pipe"! | 


Outros exemplos:

```bash


```

## <a class="up" href="#topo">> INTEGRAÇÃO COM OUTRAS LINGUAGENS<span id='integracao'></span></a> 

### Rodando outras linguagens de programação dentro de um script Bash

O Bash, por ser uma linguagem que roda sobre o Sistema Operacional Linux/Unix de uma máquina, tem uma capacidade incrível de integrar-se com outras linguagens de programação tanto para obter dados, como para saída de dados, incluindo a possibilidade de criar scripts de/para outras linguagens! 

Isso é possível através o caracter de redirecionamento `<<`.

Desde o seu Terminal digite:

```bash
	## Rodar comandos do Python usando o redirecionamento com `<<`:
	python3 << EOF
	> print("Estou no Python!")
	> exit()
	> EOF
```

O resultado na tela será: `Estou no Python`.

Ou seja, você executou um comando do Python dentro do Bash! Isso pode ser feito com outras linguagens? Sim! pode.

No exemplo acima que, a palavra "EOF" poderia ser qualquer outra (com minúsculas ou maiúsculas, mas sem espaço) e indica que tudo o que virá em seguida, até o momento que a palavra apareça novamente, será executado.

É importante lembrar que o que está entre as palavras EOF são comandos ou instruções não do Bash, mas do comando anterior a `<<`!

Mas a saída do resultado deste script pode ser redirecionada para um arquivo, e não apenas para a tela. Além disso, se pode colocar tudo isso dentro de um script. Exemplo:

```bash
	#!/bin/sh
	cat << FINAL > arquivo.txt
	bla bla bla
	FINAL
```

Nesse exemplo, criamos um script que ao ser executado criará um arquivo de nome `arquivo.txt` cujo conteúdo é "bla bla bla". 

Porém este arquivo txt criado desde este script poderia ser um arquivo Python, Javascript, HTML, PHP, script em R, Lua, etc...


### Retornando dados de outra linguagem para o Bash através um script

Se pode rodar um script de outra linguagem dentro de um script Bash e obter os resultados em uma variável.

Por exemplo: Vamos criar um script em Bash para que se execute algum código em NodeJS que retornará uma saída para ser usada por esse mesmo script!

```bash

	#!/bin/bash
	# Rodaremos comandos do NodeJS e
	# se guardará tudo em uma variável:
	VARIAVEL=$(node << FINAL
		process.env.TZ = "America/Sao_Paulo";
		let hora = new Date().toString();
		console.log(hora);
	FINAL
	)	# <= Erro se fechar o parêntesis ao lado da palavra FINAL

	# imprimimos o resultado tanto em tela como salvamos num arquivo:
	echo "O NodeJS retornou este valor: $VARIAVEL." | tee -a resultados.csv

```

A seguir, mostraremos algo mais interessante: criaremos um arquivo HTML desde um script em Bash:


### Scripts Bash que criam programas para outras linguagens!

Agora observe este outro exemplo em que criaremos um arquivo HTML desde um script Bash!! Pense nas muitas possibilidades que isso nos oferece:

```bash
	# se criou, gerou ou obteve esta variável:
	VARIAVEL="1234567"
	
	# agora se cria um arquivo html que conterá uma tag h1 ...
	# ... com o valor da variável acima:
	cat << FIM > index.html
		<h1>$VARIAVEL</h1>
	FIM
	
	# abriremos o arquivo para ver o resultado:
	chromium index.html &

	# note que no arquivo html estará o VALOR renderizado de $VARIAVEL (ou seja, 1234567)!
	
```

O script acima, pode ser salvo num arquivo\.sh e executado sempre que necessite, inclusive dentro de um servidor que através da função `crontab` ele é executado de tempos em tempos para atualizar o conteúdo de uma página ou até de um arquivo JSON (utilizando o comando `jq` por exemplo) gerando assim sua API por meio da linguagem Bash!

Usando esse mesmo formato se pode também criar um outro script Bash, ou fazer uma query SQL, um script em R, em Lua, etc...






---


<style> 
/*CSS do documento:*/
img {float: right; margin-left:5px;} 
h2 {color: #A6FF00; background: #000000; padding-left: 0.5rem; padding-top: 3px;} 
a.up{text-decoration: none !important; color: #A6FF00;}
.vermelho{color: red;} 
.letraPeq {font-size: 0.7em;} 
.direita {display: block; text-align: right;}
</style>

