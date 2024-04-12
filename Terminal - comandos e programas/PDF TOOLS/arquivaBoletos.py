from PyPDF2 import PdfFileWriter, PdfFileReader
import shutil, os, glob

'''
AUTHOR: Hélio Giroto
DATE: 20/01/2020

'''
# os.chdir(path)

# teste de pasta no windows
arq = 'ok.pdf'
ok = 'Documentos'
caminhoTeste = os.path.join("home","municipal", ok)
shutil.copy(arq, "/" + caminhoTeste + '/' + arq)
print("Salvando um arquivo cham. " + arq + " para o diretório: " + caminhoTeste)


def obtemDados():
	print()
	todosBoletos = glob.glob('*.pdf')
	todosBoletos.sort()

	for a in todosBoletos:
		# extrai nome do aluno do nome do arquivo.pdf:
		nome = a.split(".")[0].upper()

		# abre cada arq pdf para ver qtas páginas possue:
		arq = PdfFileReader(open(a, 'rb'))
		nroBoletos = arq.numPages

		# Requer do usuário confirmação ou correção:
		print('Aluno: ' + nome + ' serão ' + str(nroBoletos) + ' boletos.')
		print('Confirma ?')
		confirma = input()
		if confirma == '' or confirma == 's' or confirma == 'S':
			qtosBoletos = nroBoletos
		else:
			qtosBoletos = confirma
		print()

		# solicita do usuário a data do primeiro vencimento:
		print('Vencimento do Primeiro boleto (Formato: dd-mm-aaaa): ')
		boleto1 = input()
		boleto1.replace('/','-')
		print()
		# fatia data para obter valores separados de dia, mês, ano:
		dia = boleto1.split("-")[0]
		ano = int(boleto1.split("-")[2])
		mes = int(boleto1.split("-")[1])

		# cria lista para retornar informação de nomes de arquivos que serão processados:
		lista = []
		print("Nomes dos arquivos: ")

		# itera para calcular venciimentos dos X boletos:
		for x in range(0, int(qtosBoletos)):
			if dia == "30" and mes == 2:
				dia = "28"
			if mes > 12:
				mes = mes - 12
				ano += 1
			mesString = str(mes)
			if mes < 10:
				mesString = "0" + str(mes)
			mes = mes + 1
			lista.append(dia + "-" + mesString + "-" + str(ano) + "-" + nome + ".pdf")
			print(dia + "-" + mesString + "-" + str(ano) + "-" + nome + ".pdf")
			if dia == "28": dia = "30"


		print('\nDESMEMBRANDO PDFs E MOVENDO-OS ÀS PASTAS...')

		for i in range(arq.numPages):
			output = PdfFileWriter()
			output.addPage(arq.getPage(i))
			with open("%s.pdf" % i, "wb") as saidapdf:
				output.write(saidapdf)
			arqDesmembrado = str(i) + '.pdf'
			os.rename(arqDesmembrado, lista[i])

			# mudar para diretório Windows:
			pastaVencimentos = os.path.join('vencimentos/'+nome)
			if not os.path.exists(pastaVencimentos):
				os.mkdir(pastaVencimentos)
			shutil.move(lista[i], pastaVencimentos+'/'+lista[i])
	

		print('\nMOVENDO PDF PRINCIPAL PARA PASTA: ' + nome + '...\n')

		# AQUI MUDAR PARA O DIRETÓRIO WINDOWS RESPECTIVO:
		caminho = os.path.join("home","municipal", nome)
		shutil.move(a, "/" + caminho + '/' +a)



#obtemDados()
print('Terminado.')

