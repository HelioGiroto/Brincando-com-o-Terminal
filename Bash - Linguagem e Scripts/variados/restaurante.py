# Author: Helio Giroto

# pede nome do mes
print('DIGITE O NOME DO MÊS: ')
nome_mes = input()
nome_mes = nome_mes.upper()
print()

# pede preço do almoço (12.00)
print('QUAL O PREÇO DO ALMOÇO: ')
preco = input()
print()

# cria uma lista para mes
mes = []

# cria o cabeçalho (referente a mes[0]) com nros de 0 a 31
cabecalho = []
for linhas in range(32):
	cabecalho.append(str(linhas))


# primeiro elemento [0] desta lista é o nome do mês
cabecalho[0] = nome_mes

# appenda cabeçalho à lista mês
mes.append(cabecalho)
print(mes)


# enquanto resposta for diferente de FIM:
nome_colaborador = ''
while(nome_colaborador != "FIM"):
	# pede nome do colaborador
	print()
	print("*****************************")
	print('DIGITE O NOME DO COLABORADOR: ')
	print("(Ao terminar digite: FIM)")
	nome_colaborador = input()
	# passa valor do input para tudo maiúsculo
	nome_colaborador = nome_colaborador.upper()
	print()

	if nome_colaborador == "FIM":
		break
	# cria nova lista com 32 posições e com nome do colaborador no index [0]
	colaborador = [''] *32
	colaborador[0] = nome_colaborador

	dia = ''
	# enquanto resposta for diferente de FIM:
	while(dia != "FIM"):
		# pede dias que almoçou.
		print("DIGITE O DIA QUE ELE ALMOÇOU E PRESSIONE <ENTER>")
		print("(Ao terminar digite: FIM)")
		dia = input()
		dia = dia.upper()
		# passa para a lista colaborador o preço dentro do dia: colaborador[dia] = preço
		if dia == "FIM":
			break
		colaborador[int(dia)] = preco

	# appenda lista colaborador dentro da lista mes: mes.append(colaborador)
	mes.append(colaborador)


print(mes)


########################################################################

# grava lista mes em ...

# de cada lista que tem em mês:
	# pega das listas o item 0-32 


# qtde de colunas se refere ao nro de registros -1 que o mes terá:
qtdeColunas = len(mes)
novaLinha = []

for linha in range(32):
	for coluna in len(qtdeColunas-1):
		novaLinha[linha] = mes[linha][coluna]
		// aqui writerow do csv modulo
		 


# http://excript.com/python/while-else-python.html
# https://guide.freecodecamp.org/python/how-to-convert-strings-into-integers-in-python/
# https://pynative.com/python-range-function/
# https://docs.python.org/3/library/csv.html
# https://www.edureka.co/blog/arrays-in-python/








