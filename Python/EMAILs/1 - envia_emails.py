#!/usr/bin/python3

# Script para envio de emails

# Autor: Helio Giroto

# Data: 15/01/2026
	

# Importa o módulo SMTP
import smtplib

# Importa classe para montar o e-mail
from email.message import EmailMessage

# ==============================
# CONFIGURAÇÕES
# ==============================

# Seu e-mail Gmail e Senha:
EMAIL = "treecomexhelio@gmail.com"
SENHA = "abcd abcd abcd abcd"		# mudar

# email de Hostgator:
# EMAIL = "mail.seudominio.com"


# ==============================
# CRIA O EMAIL
# ==============================

# Cria o objeto de e-mail
msg = EmailMessage()

# Define o remetente
msg["From"] = EMAIL

# Define o destinatário
msg["To"] = "helio@treecomex.com.br"

# Com cópia visível:
# msg["Cc"] = "financeiro@empresa.com, comercial@empresa.com"


# Com cópia invisível:
# ver linha: smtp.send_message(msg, to_addrs=destinatarios_invisiveis)
'''
destinatarios_invisiveis = [
    "heliogiroto76@gmail.com",
    "treecomexhelio@gmail.com",
    "helio@treecomex.com.br"  # BCC
]
'''

# Define o assunto
msg["Subject"] = "📎 - Teste de envio de email com Python 3 COM ANEXO "

# Define o corpo do e-mail (texto simples)
msg.set_content("Olá!\n\nEste e-mail foi enviado usando Python 3🚀")


# ==============================
# ANEXANDO ARQUIVOS:
# ==============================

with open("nome_arq.pdf", "rb") as f:
	msg.add_attachment(
		f.read(),
		maintype="application",
		subtype="pdf",
		filename="nome_arq.pdf"
	)


# ==============================
# ENVIO DO EMAIL
# ==============================

# Abre conexão segura com o servidor SMTP do Gmail
# 465 é a porta tanto para gmail qto para email hostgator:
with smtplib.SMTP_SSL("smtp.gmail.com", 465) as smtp:

    # Faz login com e-mail e senha de app
    smtp.login(EMAIL, SENHA)

    # Envia o e-mail (todos os destinatários visíveis):
    smtp.send_message(msg)
    
    # para envio de lista de cópias invisíveis (lista destinatários_invisiveis):
    # smtp.send_message(msg, to_addrs=destinatarios_invisiveis)

print("✅ Email enviado com sucesso!")



# VER 
# 📄 PARTE 2 — TEMPLATE HTML PROFISSIONAL EM PYTHON



