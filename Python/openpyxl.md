## OpenPyXL

Uma biblioteca que permite gerenciar planilhas do Excel de forma completa.

### Instalar biblioteca

Para importar essa biblioteca basta digitar no Terminal:
`pip install openpyxl`

### Importar biblioteca

Três modos para importar a biblioteca para seu código python:

```python
# importa toda a biblioteca:
import openpyxl

# importa apenas módulos que criam nova planilha:
from openpyxl import Workbook

# importa apenas módulos para abrir planilhas existentes:
from openpyxl import load_workbook

# importa os dois módulos acima:
from openpyxl import Workbook, load_workbook
```

Tenha sempre em mente o significado dos termos em inglês relacionados aos arquivos Excel:

- Workbook: é um arquivo Excel 
- Worksheet: é uma planilha (aba do arquivo) 
- Cell: Uma célula da planilha
- Row: Uma linha da planilha
- Column: Uma coluna da planilha


### Criar planilha nova 

Para criarmos um arquivo Excel que não existe:

```python
# importa biblioteca:
from openpyxl import Workbook

# criando um novo arquivo
workbook = Workbook()

# acessando uma planilha (aba ativa) desse arquivo criado:
sheet = workbook.active
``` 
Mas, vamos usar os nomes das variáveis em português para ficar mais didático:

```python
from openpyxl import Workbook
arquivo_novo = Workbook()
planilha = arquivo_novo.active
```

A partir daí, poderemos escrever dados na planilha atual.



### Escrever dados numa planilha

**Escrevendo dados em uma célula**

```python
# incluindo dados dentro de uma célula da planilha corrente:
planilha['A1'] = "Primeira célula"
planilha['B1'] = "2.000,00"

# salvando a planilha:
arquivo_novo.save = ('exemplo.xlsx')
```

**Escrevendo fórmulas em uma célula**

```python
# define o conteúdo da célula:
planilha['B20'] = "=SUM(B2:B19)"

# salva novamente:
arquivo_novo.save = ('exemplo.xlsx')
```

Perceba que a referência da célula está com a letra (coluna) em maiúsculo, tal como aparece no Excel: "A1, B1, C50...".

Porém, há outra forma de referenciar as células usando números tanto para linhas como para colunas também (o que pode facilitar no uso de laços e definição de células em série num código Python). Para isso usamos o método `cell()` para definir a posição da célula e o atributo `value` para definir o conteúdo da mesma:

`planilha.cell().value = string`

Exemplo:	

```python 
# definindo o valor de uma célula usando a forma de números para colunas e linhas: 
planilha.cell(row=1, column=2).value = "Prova 1"
planilha.cell(column=1, row=10).value = "2.000,00"
```



**Escrevendo várias linhas linhas em uma planilha**

Para escrevermos numa planilha vários dados, por exemplo, uma lista de listas, basta usar o método `append()`:

```python
from openpyxl import Workbook
arquivo = Workbook()
planilha = arquivo.active

listas = [
    ["Alice", 25, "New York"],
    ["Bob", 30, "San Francisco"],
    ["Charlie", 35, "Chicago"]
]

# adiciona um cabeçalho
planilha.append(["Nome", "Idade", "Cidade"]) 

# laço para acrescentar cada lista de dados (acima)
for lista in listas:
	planilha.append(lista)

# salva planilha
arquivo.save("nova_planilha.xlsx")
```


**Inserir nomes em uma aba (planilha)**

```python
# Para inserir um nome de uma aba de um arquivo:
planilha.title = "Aba nro. 1"
```

### Abrir planilha existente

Para abrirmos um arquivo e planilha já existentes, seja para consultar seus dados, editar, etc, usamos o módulo `load_workbook` da mesma biblioteca.

```python
# importamos o módulo
from openpyxl import load_workbook
# abrimos o arquivo:
arquivo = load_workbook('planilha.xlsx')
# selecionamos a aba ativa:
aba = arquivo.active

```

**Abrindo planilha com valores ao invés de fórmulas**

Há casos de planilhas que possuem fórmulas e ao obter-se o valor/conteúdo de certa célula, será retornado o conteúdo da fórmula e não o seu resultado. Para evitar isso, abrimos o arquivo com o argumento `data_only=True`.

Porém, há um detalhe: é preciso abrir o arquivo Excel e salvá-lo mesmo sem fazer qualquer alteração.

Exemplo:

```python
from openpyxl import Workbook, load_workbook

# criamos novo arquivo e planilha:
arquivo = Workbook()
planilha = arquivo.active

# cria células com valores e fórmula:
planilha['A1'].value = 300
planilha['A2'].value = 200
planilha['A3'].value = '=SUM(A1:A2)'

# definimos nome do arquivo para salvar:
nome_arquivo = 'exemplo.xlsx'

# salva arquivo:
arquivo.save(nome_arquivo)

# vamos abrir o mesmo arquivo:
arquivo1 = load_workbook(nome_arquivo)

# obtemos a planilha e o conteúdo da célula que foi salva como fórmula:
planilha1 = arquivo1.active
conteudo_celula = planilha1['A3'].value
print(conteudo_celula)
# resultado: =SUM(A1:A2)


# SOLUÇÃO:
# Antes: abra o arquivo Excel e salve-o mesmo sem fazer qualquer alteração:

# vamos abrir o mesmo arquivo com parâmetro correto:
arquivo2 = load_workbook(nome_arquivo, data_only = True)

# obtemos planiolha e conteúdo da célula de fórmula
planilha2 = arquivo2.active
conteudo = planilha2['A3'].value
print(conteudo)
# resultado: 500
```


**Escolhendo outra aba do arquivo**

Para escolher outra aba do arquivo, ao invés da (última) aba ativa, precisamos do nome exato da mesma

Para isso, podemos usar um comando que nos passa o nome de todas as abas criadas naquele arquivo:

```python
# Para obter nomes das planilhas (abas) de um arquivo:
abas = arquivo.sheetnames
print(abas)

# Para abrir determinada aba de um arquivo (que não seja a ativa)
planilha = arquivo["Aba nro 3"]
```

Definirmos o nome exato da aba que queremos trabalhar é mais seguro que usar a aba ativa.


**Ler e consultar dados de apenas uma célula**

Para lermos um dado de uma planilha, basta usarmos o método `value` (visto anteriormente):

```python
celula = planilha['A3'].value
```


**Editar dados de apenas uma célula**

```python
planilha['A3'].value = "novo conteudo"
```


**Obtermos as células de uma linha toda**

```python
# importamos o módulo
from openpyxl import load_workbook
arquivo = load_workbook('planilha.xlsx')
planilha = arquivo["Aba nro 2"]

# escolhemos a linha 3 da planilha:
linha3 = planilha["3"]

# percorremos todas as células dessa linha obtendo apenas o conteúdo (value) de cada:
valores = [celula.value for celula in linha3]

# imprimimos a lista:
print(valores)
```

**Obter o número da última linha de uma planilha**

Se queremos apenas imprimir na última linha de uma planilha, apenas inserindo uma linha a mais, utilizamos o método `append()`, porém às vezes, é necessário para percorrermos todas as linhas de uma planilha ou para somarmos os valores de uma coluna. 

Por tanto, há dois modos para se descobrir o número da última linha:

```python
# usando o atributo max_row:
ultima_linha = planilha.max_row

# ou obtendo o tamanho de uma coluna:
ultima_linha = len(planilha["A"])
```

E para obter a última coluna, basta usarmos o atributo `max_column` (mas retornará em número):

`ultima_coluna = planilha.max_column`



**Percorrendo todas as linhas da planilha para obter todos os dados:**

```python
# importamos o módulo
from openpyxl import load_workbook
arquivo = load_workbook('planilha.xlsx')
planilha = arquivo["Aba nro 2"]

# obtemos a última linha:
ultima_linha = planilha.max_row

# prepara uma lista vazia para receber o conteudo de cada linha da planilha:
toda_planilha = []

# percorremos cada linha da planilha:
for nro in range(1,ultima_linha+1):
	linha = planilha[nro] # melhor !!
	# linha = planilha[f'{nro}']
	conteudo = [celula.value for celula in linha]
	print(conteudo)
	toda_planilha.append(conteudo)

# resultado:
'''
['Nome', 'Idade', 'Cidade']
['Alice', 30, 'Nova York']
['Ana', 25, 'Londres']
['José', 40, 'São Paulo']
['Matias', 19, 'Recife']
['Pedro', 20, 'Porto Alegre']
'''

# imprime a lista completa com os valores de toda planilha:
print(toda_planilha)
# [['Nome', 'Idade', 'Cidade'], ['Alice', 30, 'Nova York'], ['Ana', 25, 'Londres'], ['José', 40, 'São Paulo'], ['Matias', 19, 'Recife'], ['Pedro', 20, 'Porto Alegre']]
```
	
	
- Procurar célula que contenha uma string/regex


### Obtendo dados de uma planilha para outra

**De células aleatórias**

```python
# importa biblioteca
from openpyxl import load_workbook

# abre arquivos origem e destino e planilhas:
arquivo_fonte  = load_workbook('planilha1.xlsx')
planilha_fonte = arquivo_fonte.active

arquivo_destino  = load_workbook('planilha2.xlsx')
planilha_destino = arquivo_destino.active

# define células aleatórias que serão obtidas do arq fonte:
celulas_arq_fonte = ['A2', 'B2', 'E2', 'C10', 'B9', 'E7']

# prepara lista vazia que receberá o conteúdo das células aleatórias:
lista = []

# percorre planilha fonte para obter conteúdo das células aleatórias:
for celula in celulas_arq_fonte:
	conteudo = planilha_fonte[celula].value
	lista.append(conteudo)
	
# insere na última linha da planilha destino os conteúdos extraidos do arq fonte:
planilha_destino.append(lista)

# salva arquivo destino (que foi alterado)
arquivo_destino.save('planilha2.xlsx')
```


**De uma coluna inteira para outra planilha**

```python
# importa biblioteca
from openpyxl import load_workbook

# abre arquivos origem e destino e planilhas:
arquivo_fonte  = load_workbook('planilha1.xlsx')
planilha_fonte = arquivo_fonte.active

arquivo_destino  = load_workbook('planilha2.xlsx')
planilha_destino = arquivo_destino.active

# cria lista vazia para receber dados da coluna B:
lista = []

# percorre cada linha da coluna B:
for linha in planilha_fonte['B']:
	conteudo = linha.value
	lista.append(conteudo)
	
# imprime a lista na última linha da planilha destino:
planilha_destino.append(lista)


# ou imprime a lista numa coluna (E) da planilha destino:
# de uma coluna para uma coluna:
tamanho_lista = len(lista)

# cria uma sequencia de 0 ao total de nro de itens da lista:
for nro in range(tamanho_lista):
	# obtem conteudo do item da lista:
	conteudo = lista[nro]
	# as linhas na planilha começam em 1 não em 0:
	linha = nro + 1
	# salva na planilha na coluna E (5) e nas linhas conforme laço:
	planilha_destino.cell(column=5, row=linha).value = conteudo

# salva arquivo 
arquivo_destino.save('planilha2.xlsx')
```


### Formatação e Estilo
### Criar gráficos



---


Outras fontes:

https://excelmatic.ai/pt/blog/openpyxl/#conceitos-e-terminologia-chave

https://www.hashtagtreinamentos.com/automatizar-o-excel-com-python

https://hub.asimov.academy/tutorial/como-automatizar-excel-com-python-usando-openpyxl/


