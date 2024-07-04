<style>img{float: right; margin-left:5px;} .vermelho{color:red;}</style>

![](bash.png)
# BASH 

A linguagem Bourne-Again Shell (Shell Nascido de Novo) foi lançada inicialmente em 1989. Desenvolvida por Brian Fox e Chet Ramey. É o Shell padrão nas várias distribuições Linux...

A documentação oficial da linguagem está em:
https://www.gnu.org/software/bash/manual/bash.html


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
Normalmente se salva um script Bash como `nome_arquivo.sh`, mas também se pode encontrar (raramente) a extensão `.bash`; ou até sem extensão (em casos de scripts salvos na pasta /bin que receberam permissão para serem executáveis (-x)).


## SINTAXE DE COMANDOS NO SCRIPT
Dentro do script os comandos estarão cada um em uma linha, sem a necessidade obrigatória de indentação em caso de funções e/ou laços, ou mesmo todos os comandos podem estar **numa única linha** separados por ponto-e-vírgula (**;**).

```bash
	comando1
	comando2
	comando3
```

Ou: 

`comando1; comando2; comando3`


## ENTRADA DE DADOS 1: VARIÁVEIS
Para nomes de variáveis, como de costume, se evita caracteres alfanuméricos ou nomes que iniciem com números. Por convenção, eles aparecem em letras maiúsculas, porém não é regra.

**Não** se aceita **espaço(s)** entre o nome da variável e o símbolo de atribuição **(=)**, tampouco entre esse e seu valor atribuido.

```bash
	VARIAVEL=1
	NOME=Helio
	FRASE="Olá Mundo"
	NOMECOMPLETO="Maria da Silva"
	IDADE=40
	COMANDO=$(ls *.jpg)
```

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

## IMPRIMIR NA TELA - FORMATAR IMPRESSÃO (PRINTF'S)
(Alinhar, justificar, decimais, cores, peso, fonte, etc)

```bash

	echo "Olá mundo!"
	echo 'Frase entre áspas simples ou duplas'
	echo 123
	echo palavra
	echo 	# (somente o comando = linha em branco)
	echo $VARIAVEL
	echo "$MENSAGEM"
	echo -n "Não tem quebra de linha após este echo..."
	echo " fim."

```

## CONCATENAÇÃO

```bash
	NOME='Helio'
	SOBRENOME='da Silva'
	IDADE=30
	BOASVINDAS="Seja bem-vindo $NOME $SOBRENOME! Feliz aniversário de $IDADE anos!"
	echo $BOASVINDAS
```

## MANIPULAÇÃO DE STRINGS / REGEX
```bash
	

```

## EXPANSÃO

 ver https://en.wikipedia.org/wiki/Bash_(Unix_shell)#Brace_expansion
 

## ENTRADA DE DADOS 2: Inputs (read / readline)

```bash
	ENTRADA="Por favor, digite com uma informação: "
	read ENTRADA
	echo
	echo "Obrigado!"
	echo "Sua informação foi esta: $ENTRADA."
	echo
```

## ENTRADA DE DADOS 3: PARÂMETROS EM LINHA DESDE O TERMINAL
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

Quando cada argumento leva espaço ou algum caracter especial, se recomenda passar cada argumento entre áspas. Caso contrário, o interpretador Bash consideraria que cada espaço indicaria um novo argumento.

Por isso, usaríamos entre áspas, desta forma:

`$ bash aniversarios.sh "Manuel da Silva" "27/09/1990"`



## TESTE DE CONDIÇÕES
Toda linguagem de programação tem seu modo de realizar seu teste lógico com os dados que são obtidos ou passados. É mais comum que se use esse teste com os comandos `if`, `for` ou `while`.

Em Bash, o teste é realizado com o uso de duplos-colchetes `([[ ]])`. Mas é muito provável que se encontre alguns exemplos com apenas um colchete `[ ]`, porém o uso de conchetes-duplos `[[ ]]` é mais recomendado e convencional por ser a opção mais moderna.

Normalmente realizamos testes com arquivos ou variáveis e o Terminal nos devolve o resultado como `true` ou `false`. Ou seja, ele nos responde se o que "perguntamos" é verdadeiro ou falso. **Verdadeiro corresponde ao valor `0` e falso ao valor `1`.**

Porém o Terminal não nos responde a menos que solicitemos sua resposta. E fazemos isso através da expressão `echo $?`. A "variável" `$?` contém a resposta que precisamos. 

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
Eles são:

```bash
	-eq	# igual
	-ne	# diferente (not-equal)
	-lt	# menor que (low than)	
	-gt	# maior que (grow than)
	-le	# menor ou igual
	-ge	# maior ou igual
	
	-z $STRING1				- $STRING1 is empty
	$STRING1 = $STRING2		- $STRING1 is equal to $STRING2
	$STRING1 != $STRING2	- $STRING1 is not equal to $STRING2
	
```

Scripts em Bash são usados muitas vezes para manipulação de arquivos, portanto, é comum que se necessite expressões próprias para comparar e testar. Como por exemplo:

```bash
	-e file		- FILE exists
	-d file		- FILE exists and is a directory.
	-f file		- FILE exists and is a regular file.
	-L file		- FILE exists and is a soft link.
	-s file 	- True if the file exists with a size of more than zero.
	-r file 	- True if the file exists and the read permission is set.
	-w file 	- True if the file exists and the write permission is set.
	-x file 	- True if the file exists and the execute permission is set.

```

Uma lista mais extensa está em:
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


## OPERADORES TERNÁRIOS
Para realizarmos condições simples que **não vão implicar em blocos de código** dependendo do resultado do teste, se pode usar o modelo ternário (tipo lambdas, em Python) para aplicar uma condição no código.

Sendo que:
- O que o que vem após o `&&` é para resposta verdadeira do teste e...
- O que o que vem após o `||` é para resposta falsa do teste.

Por exemplo:

```bash
	a=1
	
	[[ $a -eq 1 ]] && echo "sim" || echo "nao"
	# resultado: sim
	
	[[ $a -eq 2 ]] && echo "sim" || echo "nao"
	# resultado: nao

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




## OPÇÕES EM CASOS (tipo switch):

```bash
	
	case "variable" in
	"resposta1" )
		Comandos … ;;
	"resposta2" )
		Comandos … ;;
	"resposta3" )
		Comandos … ;;
	esac

```

## LISTAS / ARRAYS
As listas (arrays) em Bash são variáveis com mais de um valor, definidos entre parêntesis e separados por espaços. Caso sejam strings, devem estar (de preferência) entre áspas.

```bash
	IDADES=(34 30 59 40)
	NOMES=("João da Silva" "Francisca Souza" "Mário Jr" "Paulo Bezerra")
	SEXO=("M" "F" "M" "M")
```
Ver tb [este site.](https://linuxsimply.com/bash-scripting-tutorial/loop/for-loop/for-array/)



## MANIPULAÇÃO DE LISTAS
Em Bash o primeiro elemento (item) de um array é o nro 0.

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



## LAÇOS - PERCORRER LISTA / ARQUIVOS

### O laço FOR

Em Bash se usa laços (loopings) tipo FOR principalmente Uso do FOR para percorrer o conteúdo de um arquivo ou array. Nos exemplos a seguir mostraremos como isso se pode ser feito. Porém, basicamente a sintaxe do FOR é esta:

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

Existe uma variável de sistema chamada IFS que define os delimitadores (em arrays por exemplo) nesta ordem: espaço, tab e enter. Ou seja, cada vez que se encontra um espaço num item de array ou num nome de arquivo, o sistema interpreta que é outro item (do array) ou outro arquivo! (Isso vem pré-configurado nas distribuições Debian).

Sendo assim, se recomenda que antes de executar o script acima, se mude a variável IFS no Terminal desta forma:

```
$ IFS='		# digite: IFS=, áspas, e pressione ENTER.
>'		# pressione áspas novamente e ENTER.
```

Contudo, todas as vezes que se reinicia a máquina o valor de IFS volta a ser como o padrão. Por tanto, para que se mude persistentemente o IFS, se recomenda que altere o valor da mesma no arquivo .bashrc, adicionando esta linha:

**`IFS=$'\n'`**

Caso contrário, se pode adicionar esta linha acima em cada script em que se use um `for` para percorrer nomes de arquivos, arrays, etc. O que seria muito mais trabalhoso.

---

**Exemplo prático de `for` para manipulação de arquivos:** 

Há muitos exemplos em que se usa o `for` para **manipular arquivos em lote** em nosso sistema. (Lembre-se que por segurança, se recomenda um backup dos arquivos antes de rodar algum script em lote). 

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
	# for ITEM in "${ARRAY[@]}"; do echo $ITEM; done
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


Ou também uma forma com sequência númerica, que veremos a seguir:

### Uso do FOR para percorrer uma sequência numérica:

Para isso se usa o comando `seq`. 

Vamos executar o laço por 10 vezes:

```bash
	for X in $(seq 10)
	do
		# comandos que se repetirão X vezes. 
	done
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

Mas para o perfeito funciomento deste script acima é necessário que todas as listas (arrays) tenham o mesmo tamanho, ou seja, o mesmo número de elementos.

Observe também que ao final do laço (logo abaixo do `done`), se executará uma mensagem de término do script, que só rodará uma única vez (já que está fora do laço).

Exemplo simples em uma única linha:

```bash
	# percorre o(s) array(s):
	# for X in $(seq 0 10); do echo ${PRODUTO[X]} - ${PRECO[X]}; done
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
 - Imiprimirá num arquivo a parte chamado arq_final.txt
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


## CONTINUE, BREAK
Para que um código não caia num looping infinito (principalmente quando se usa o `while true`, é preciso estabelecer uma condição de 'escape' para que o código seja interrompido.

```bash
	

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

## FUNÇÕES: CRIAR, MANIPULAR, RETORNAR, CHAMAR, ASSÍNCRONISMO.
```bash
	

```

## TRATAMENTO DE ERROS: EXCEPT / TRY 
```bash
	

```

## MÓDULOS / BIBLIOTECAS PARA IMPORTAR: LER ARQ/WEB/XLS/DOC/JSON/XML, ESCREVER PDF, ETC
```bash
	

```

## IMPRIMIR PDF, ARQ, IMPRESSORA
```bash
	

```

## TABELAS
```bash
	

```


## DATA, HORA
```bash
	

```

## GUI: ELEMENTOS/TAGS
```bash
	

```

## DESENHAR TELA / FORMULÁRIO - LABEL+CAMPO+BOTÃO...
```bash
	

```

## POSICIONAR ELEMENTO, ALINHAR, FLEXBOX, ETC
```bash
	

```

## DEFINIR (SETAR) ELEMENTO - ENCAPSULAR
```bash
	

```

## OBTER ELEMENTO
```bash
	

```

## IMPRIMIR ELEMENTO 
```bash
	

```

## INPUT DE ELEMENTO 
```bash
	

```

## EVENTOS E OUVIDORES (LISTENINGS)
```bash
	

```

## ESCUTA USUÁRIO: CLIC, FOCUS, SCROLL, MOUSE, TECLADO, TOUCH, ETC...
```bash
	

```

## CLICAR NO ELEMENTO/BOTÃO
```bash
	

```

## BANCO DE DADOS (CRUD)
```bash
	

```


