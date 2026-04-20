#!/usr/bin/python3
# Script para verificar quais sites estão funcionando ou fora do ar
# Autor: Helio Giroto
# Data: 09/02/2026

# Já está no bin com chmod devido

import re, subprocess
from rich import print
from pathlib import Path

# arquivo_urls = 'verificado.csv'
# expanduser() - assume ~ como diretório home
arquivo_urls = Path('~/tcx/1-Projetos/Sites/sites_texto_verificado.csv').expanduser()
retornos = []

with open(arquivo_urls, 'r') as f:
	for linha in f:
		site, frase = linha.split(';')
		frase = frase.strip()
		ocorrencia = re.compile(re.escape(frase), re.I)

		try:
			# lynx imprime linhas de até ~ 80 colunas de caracteres
			saida = subprocess.check_output(
				["lynx", "-dump", "-nolist", f"https://{site}"],
				text=True,
				stderr=subprocess.DEVNULL
			)

			encontrado = re.search(ocorrencia, saida)
			retorno = f"{site}; Site OK" if encontrado else f"{site}; [bold white on red]Problemas com o site[/]"

		except subprocess.CalledProcessError:
			retorno = f"{site}; [bold white on red]Problemas com o site[/]"
		
		print(retorno)	
		retornos.append(retorno)


# listas separadas:
sites_fora = [retorno.split(';')[0] for retorno in retornos if "Problemas com o site" in retorno]
sites_ok   = [retorno.split(';')[0] for retorno in retornos if "Site OK" in retorno]
# sites_sem_ssl = [retorno.split(';')[0] for retorno in retornos if "sem SSL" in retorno]

print()
# imprime sites fora:
print(sites_fora)
print()


'''
import socket
import ssl

def tem_ssl(site, timeout=5):
	try:
		context = ssl.create_default_context()
		with socket.create_connection((site, 443), timeout=timeout) as sock:
			with context.wrap_socket(sock, server_hostname=site):
				return f"{site} - Site fora do ar"
	except Exception:
		return f"{site} - Não tem SSL"


lista_ssl = map(sites_fora, ssl)


###########

import re, requests, time
retornos = []
with open('sites_texto_verificado.csv', 'r') as f:
	arq = f.readlines()
	for linha in arq:
		time.sleep(5)
		site, frase = linha.split(';')
		# site = site.strip()
		# frase = frase.strip()
		ocorrencia = re.compile(frase, re.I)
		# sem headers abaixo, o ModSecurity da página acusa como bot:
		try:
			headers = {
				"User-Agent": (
					"Mozilla/5.0 (X11; Linux x86_64) "
					"AppleWebKit/537.36 (KHTML, like Gecko) "
					"Chrome/120.0.0.0 Safari/537.36"
				),
				"Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
				"Accept-Language": "pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7",
			}
			resposta = requests.get("https://" + site, headers=headers, timeout=5)
			conteudo_bruto = resposta.content
			html = conteudo_bruto.decode("utf-8", errors="replace")
			encontrado = re.search(ocorrencia, html)
			retorno = f"{site};Site OK" if encontrado else f"{site};FORA DO AR"
			# print(html)

		except requests.exceptions.RequestException:
			retorno = f"{site};sem SSL"

		print(retorno)
		retornos.append(retorno)
'''



