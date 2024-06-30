<style> img{float: right; margin-left:5px;} </style>

![](bash.png)
# BASH

A linguagem Bourne-Again Shell (Shell Nascido de Novo) foi lançada inicialmente em 1989. Desenvolvida por Brian Fox e Chet Ramey. É o Shell padrão nas várias distribuições Linux. 


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

Dessa forma, o script seria:

```bash
	ARGUMENTO1=$1
	ARGUMENTO2=$2
	echo "O argumento 1 passado na linha de comando foi: $ARGUMENTO1"
	echo "O argumento 2 passado na linha de comando foi: $ARGUMENTO2"
	echo "O argumento 0 retorna a todos os argumentos: $0"
```

E ao chamar o programa na linha de Terminal, por exemplo, o usuário digitaria:

`$ bash produtos.sh Arroz 20,00`

Ou quando cada argumento leva espaço ou algum caracter especial, se recomenda passar cada argumento entre áspas:

`$ bash cadastro.sh "Manuel da Silva" "27/09/1990"`


## CONDIÇÕES IF, ELIF, ELSE...
Geralmente o comando "if" é acompanhado com duplos colchetes (\[[ ]]), que são na verdade, operadores de teste de uma condição. Algumas vezes se pode encontrar script com apenas colchetes-simples, porém, atualmente em Bash se recomenda o uso de duplos-colchetes para testes. 

O formato comum do "if" é este:

### IF SIMPLES (Teste para UMA condição):

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



## OPERADORES DE COMPARAÇÃO (AND, OR, >, <, <=, >=, !=)
Este são os operadores usados para fazer o teste das condições que são passadas dentro dos duplos-colchetes:

```bash
	-eq	# igual
	-ne	# diferente (not-equal)
	-lt	# menor que (low than)	
	-gt	# maior que (grow than)
	-le	# menor ou igual
	-ge	# maior ou igual
	
	-z $STRING1		- $STRING1 is empty
	$STRING1 = $STRING2	- $STRING1 is equal to $STRING2
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

Duas condições (AND e OR):

```bash

```


## CONTINUE, BREAK
```bash
	

```

## TERNÁRIOS (tipo lambdas)
```bash
	

```

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

## LISTAS / ARRAYS E SEUS MÉTODOS/FUNÇÕES
```bash
	

```

## MANIPULAÇÃO DE LISTAS
```bash
	

```

## LAÇOS - PERCORRER LISTA: FOR, MAP, WHILE
```bash
	

```

## INCREMENTOS
```bash
	

```

## DICIONÁRIOS (CRIAR, LER/ACESSAR/OBTER, ESCREVER/ATUALIZAR, DELETAR)
```bash
	

```

## MATRIZES
```bash
	

```

## OBJETOS E PROPRIEDADES
```bash
	

```

## FUNÇÕES: CRIAR, MANIPULAR, RETORNAR, CHAMAR, BREAK, CONTINUE, ASSÍNCRONISMO.
```bash
	

```

## TRATAMENTO DE ERROS: EXCEPT / TRY 
```bash
	

```

## MÓDULOS / BIBLIOTECAS PARA IMPORTAR: LER ARQ/WEB/XLS/DOC, ESCREVER PDF, ETC
```bash
	

```

## IMPRIMIR PDF, ARQ, IMPRESSORA
```bash
	

```

## TABELAS
```bash
	

```

## GRÁFICOS (BARRA, PIZZA, LINHA, ETC)
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

## GRID
```bash
	

```

## BANCO DE DADOS (CRUD)
```bash
	

```

## CLASSES
```bash
	

```




