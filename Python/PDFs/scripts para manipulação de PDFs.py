#!/usr/bin/python3

# Scripts para manipular arquivos PDF
# Autor: Helio Giroto
# Data: 16/01/2026

"""
Resumo de qual biblioteca usar:

    - Para buscar texto e extração rápida: pip install pymupdf --break-system-packages

    - Para extrair tabelas complexas (scrapping): pip install pdfplumber --break-system-packages

    - Para manipular páginas (unir, deletar, girar): pip install pypdf --break-system-packages
    
# https://gemini.google.com/app/52b2c083619a618c?hl=pt-PT

"""


###########################
#### EXTRAÇÃO DE TEXTO ####
###########################


# IMPRIME TODAS AS PÁGINAS DE UM PDF:
# (Exemplo mais simples possível)

# o método get_text() serve para obter o texto de uma (ou mais) página(s) do pdf.
# é usado dentro de uma laço que percorrerá todas as páginas de um documento 
# e se executa em CADA página do documento.

import fitz	# PyMuPDF
doc = fitz.open('doc.pdf')
for pag in doc:
	print(pag.get_text())
doc.close()


########################


# IMPRIMINDO O NÚMERO TOTAL DE PÁGINAS QUE POSSUI UM DOCUMENTO:

import fitz	# PyMuPDF
doc = fitz.open('doc.pdf')
print(doc.page_count)
doc.close()

########################


# IMPRIME UMA OCORRÊNCIA COM O NRO DA PÁGINA: 
# (semelhante ao pdfgrep):

import fitz  

termo = "pressão"
for nro, pag in enumerate(doc):
     texto = pag.get_text()
     if termo in texto.lower():
         print(f'O termo "{termo}" aparece na página {nro}')

doc.close()

# OBS: Para o Pymupdf a primeira página de um pdf é a 0, - 
#  ... portanto, se deve acrescentar +1 na variável de index de enumerate!



########################


# IMPRIME UMA OCORRÊNCIA COM REGEX E NRO DA PÁGINA: 

import fitz
import re

doc = fitz.open("arquivo.pdf")
padrao = r'REGEX_AQUI'

for num, pagina in enumerate(doc):
    texto = pagina.get_text()
    matches = re.findall(padrao, texto)
    if matches:
        print(f"Encontrado na Página {num + 1}: {matches}")

        
########################


# IMPRIME UMA OCORRÊNCIA COM REGEX COM SUA FRASE INTEIRA E SEU NRO DA PÁGINA: 

import fitz
import re

padrao = re.compile(r'.*[Pp]ress.o.*')

for num, pag in enumerate(doc):
	texto = pag.get_text()
	ocorrencia = re.findall(padrao, texto)
	if ocorrencia:
		print(f'{ocorrencia} - {num + 1}')

# resultado:
'''
['Pressão Arterial ', 'Fatores que influenciam a Pressão Arterial', 'Erros comuns na avaliação da Pressão'] - 3
['Pressão Arterial ', 'Pressão de pulso: 30 a 50 mmHg '] - 5
['A pressão arterial é a força exercida sobre as paredes de', 'uma artéria pelo sangue pulsando sob pressão a partir do', 'O pico de pressão máxima quando a ejeção ocorre é a', 'pressão sistólica. ', 'A pressão diastólica é a pressão mínima exercida contra as', 'Fatores que influenciam a Pressão Arterial', 'Pressão Arterial'] - 17
['Pressão Arterial (mmHg)', 'Fatores que influenciam a Pressão Arterial', 'Pressão Arterial Média Ótima para Idade'] - 18
['Classificação de Pressão Arterial para Adultos a'] - 19
['Pressão arterial varia ao longo do dia, com PA menor'] - 20
['Erros comuns na avaliação da Pressão Arterial '] - 23

'''



########################


# IMPRIMINDO O NÚMERO TOTAL DE OCORRÊNCIAS APARECEM NUM DOCUMENTO PDF:

import fitz	# PyMuPDF
termo = "pressão"
contagem = 0
with fitz.open('doc.pdf') as doc:
	for pag in doc:
		texto = pag.get_text()
		# conta quantas vezes aparece o termo convertido para letras minúsculas(ou seja, uma forma de fazer um ignore-case):
		contagem += texto.lower().count(termo)

print(contagem)
# 19

        
########################


# IMPRIME LINHAS ANTERIORES E POSTERIORES DE UMA OCORRÊNCIA COM REGEX: 

# Muito usado para obter dados de uma DUIMP ou de BL ou de INVOICE:

pass




########################


####################################
## PARA EXTRAIR TABELAS DE UM PDF ##
####################################


# Biblioteca mais apropriada: pdfplumber

# instalar bibliotecas necessárias para funcionamento: 
# pip install pdfplumber ocrmypdf pi-heif 

import pdfplumber

# abre arquivo pdf:
with pdfplumber.open("estudo.pdf") as pdf:
	# define em que página está a tabela - primeira página é a 0!:
	pagina = pdf.pages[23]
	# armazena tabela numa lista:
	tabela = pagina.extract_table()
	# imprime cada linha da lista/tabela:
	for linha in tabela:
		print(linha)
		
'''
	# resultado:
	['Concentração sérica de 25(OH)D\nng/mL nmol/L', None, 'Indicador de saúde']
	['< 20', '< 50', 'Deficiência']
	['20 – 30', '50 – 75', 'Insuficiência']
	['30 – 100', '75 - 250', 'Suficiência']
	['> 100', '> 250', 'Excesso']
	['> 150', '> 375', 'Risco de toxicidade']
'''

print(tabela)
# saída: uma lista de listas com o conteúdo da tabela:
# [['Concentração sérica de 25(OH)D\nng/mL nmol/L', None, 'Indicador de saúde'], ['< 20', '< 50', 'Deficiência'], ['20 – 30', '50 – 75', 'Insuficiência'], ['30 – 100', '75 - 250', 'Suficiência'], ['> 100', '> 250', 'Excesso'], ['> 150', '> 375', 'Risco de toxicidade']]



###########################


###########################
#### MANIPULAR PÁGINAS ####
###########################

# Suponhamos que precisamos tirar uma certa página de um pdf para colocar dentro de outro:

# Biblioteca: pypdf
# pip install pypdf

from pypdf import PdfReader, PdfWriter

def manipular_paginas(pdf_principal, pdf_extra, saida):
	# obtem so dois arquivos origem
	arq_principal = PdfReader(pdf_principal)
	arq_extra = PdfReader(pdf_extra)
	# cria um pdf em branco:
	writer = PdfWriter()

	# 1. Adicionar todas as páginas do PDF principal, EXCETO a página 2 (índice 1)
	for i, pagina in enumerate(arq_principal.pages):
		if i != 1:  # Deleta a página 2
		# se quisesse deletar várias páginas:
		# if i not in [1, 3, 5]:
			writer.add_page(pagina)

	# 2. Adicionar a primeira página do outro PDF
	writer.add_page(arq_extra.pages[0])

	# salvando o novo pdf num 3o. arquivo vazio:
	# Como PDFs não são apenas texto simples, precisamos gravar os dados em formato binário ("wb"):
	with open(saida, "wb") as f:
		writer.write(f)

# chama função acima:
manipular_paginas("documento.pdf", "anexo.pdf", "resultado_final.pdf")





###########################


############################
#### FAZENDO OCR DE PDF ####
############################

# Instalar pacotes necessários:
# pip install pdf2image pytesseract

from pdf2image import convert_from_path
import pytesseract

def ocr_no_pdf(caminho_pdf):
    # 1. Converte as páginas do PDF em uma lista de imagens (PIL)
    paginas = convert_from_path(caminho_pdf)
    
    texto_extraido = ""

    # 2. Itera sobre cada página/imagem
    for i, pagina_img in enumerate(paginas):
        # 3. Aplica o OCR na imagem (configurado para Português)
        texto = pytesseract.image_to_string(pagina_img, lang='por')
        texto_extraido += f"--- Página {i+1} ---\n{texto}\n"
        
    return texto_extraido

# Uso:
resultado = ocr_no_pdf("seu_arquivo_escaneado.pdf")
print(resultado)










###########################


##########################################
#### MANIPULANDO VÁRIS ARQUIVOS PDF's ####
##########################################



import os
import fitz # PyMuPDF

pasta_origem = "./documentos_pdf"

# Lista todos os arquivos na pasta que terminam com .pdf
arquivos = [f for f in os.listdir(pasta_origem) if f.endswith(".pdf")]

print(f"Encontrados {len(arquivos)} arquivos para processar.\n")

for nome_arquivo in arquivos:
    caminho_completo = os.path.join(pasta_origem, nome_arquivo)
    
    # Abre o documento
    with fitz.open(caminho_completo) as doc:
        # Pega apenas a primeira página para ganhar velocidade
        texto = doc[0].get_text()
        
        # Aqui você aplicaria seu Regex ou busca
        # Exemplo simples: contar quantas vezes a palavra "Importação" aparece
        contagem = texto.lower().count("importação")
        
        print(f"Arquivo: {nome_arquivo} | Ocorrências de 'importação': {contagem}")

print("\nProcessamento concluído!")
