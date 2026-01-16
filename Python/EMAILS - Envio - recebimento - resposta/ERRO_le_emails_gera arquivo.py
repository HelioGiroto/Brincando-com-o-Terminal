#!/usr/bin/python3


# Script para receber (puxar) emails da conta

# Autor: Helio Giroto

# Data: 15/01/2026
	

### ERRO - o arquivo de saída não sai perfeitamente


# Importa a classe MailBox (conexão IMAP)
# e o construtor AND (para filtros combinados)
from imap_tools import MailBox, AND
from datetime import date, timezone
from zoneinfo import ZoneInfo


# ==============================
# CONFIGURAÇÕES DO EMAIL
# ==============================

# Endereço de e-mail
# EMAIL = "seuemail@seudominio.com"
EMAIL = "treecomexhelio@gmail.com"

# Senha do e-mail (ou senha de app no Gmail)
# SENHA = "sua_senha_ou_senha_de_app"
SENHA = "abcs abcd abcd abcd"	# mudar

# Servidor IMAP
# Gmail -> imap.gmail.com
# HostGator -> imap.seudominio.com
IMAP_SERVER = "imap.gmail.com"

# Nome da pasta de e-mail
# INBOX é padrão
PASTA = "INBOX"


def data_email_sp(msg):

	fuso_sp = ZoneInfo("America/Sao_Paulo")
	data = msg.date

	if data.tzinfo is None:
		data = data.replace(tzinfo=timezone.utc)

	return data.astimezone(fuso_sp)


# ==============================
# CONEXÃO E LEITURA
# ==============================

# Abre conexão com o servidor IMAP e faz login
with MailBox(IMAP_SERVER).login(EMAIL, SENHA) as mailbox:

	# Define qual pasta será acessada (INBOX, Faturamento, Compras etc.)
	mailbox.folder.set(PASTA)

	# ==============================
	# BUSCA DE E-MAILS
	# ==============================

	# Busca TODOS os emails NÃO LIDOS
	# mails = mailbox.fetch(AND(seen=False))

	# Busca TODOS os emails JÁ LIDOS
	# mails = mailbox.fetch(AND(seen=True))

	# Busca emails NÃO LIDOS de um remetente específico
	# mails = mailbox.fetch(AND(from_="fornecedor@china.com", seen=False))

	# Busca emails pelo ASSUNTO
	# mails = mailbox.fetch(AND(subject="Invoice"))

	# Usando a classe OR para escolher entre um e outro assunto:
	# from imap_tools import OR
	# mailbox.fetch(OR(subject="Invoice", subject="BL"))

	# Busca emails a partir de uma data (YYYY-MM-DD) - usado junto com a biblioteca date:
	mails = mailbox.fetch(AND(date_gte=date(2026, 1, 15)) )

	# Combina filtros:
	# - Não lido
	# - Assunto contém "Invoice"
	# - Remetente específico
	'''
	mails = mailbox.fetch(
	AND(
	    seen=False,
	    subject="Invoice",
	    from_="fornecedor@china.com"
	)
	)
	'''

	# ==============================
	# PROCESSAMENTO DOS E-MAILS
	# ==============================

	# Percorre cada e-mail encontrado
	with open('emails.csv', 'a') as f:
		for msg in mails:
			# Linha separadora para visualização
			print("=" * 50)

			# Exibe o remetente
			print("De:", msg.from_)

			# Exibe o assunto
			print("Assunto:", msg.subject)

			# Exibe a data de envio
			# print("Data:", msg.date)
			print("Data:", data_email_sp(msg))

			# Exibe o texto simples do e-mail (se existir)
			print("Texto:")
			print(msg.text)

			# ==============================
			# ANEXOS (se existirem)
			# ==============================
			
			anexo = ''
			# Verifica se o e-mail possui anexos
			if msg.attachments:
				print("Anexos encontrados:")

			    	# Percorre todos os anexos
				for att in msg.attachments:
					# obtem nome do arquivo anexo
					anexo = att.filename
					print(" -", anexo)

			# ==============================
			# MARCAR COMO LIDO (OPCIONAL)
			# ==============================

			# Marca o e-mail como lido manualmente
			# mailbox.flag(msg.uid, MailBox.Flags.SEEN, True)

			lista_dados = ['\n===========', msg.from_, msg.subject, str(data_email_sp(msg)), msg.text, anexo]

			f.write(', '.join(lista_dados))

