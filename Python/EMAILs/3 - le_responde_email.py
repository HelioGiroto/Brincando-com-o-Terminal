#!/usr/bin/python3

# Script para ler e responder emails automaticamente

# Autor: Helio Giroto + IA

# Data: 15/01/2026
	


# 🔄 CASO REAL: LER COM imap_tools + RESPONDER AUTOMATICAMENTE


from imap_tools import MailBox, AND
import smtplib
from email.message import EmailMessage

# 1️⃣ Lê emails
with MailBox("imap.gmail.com").login(EMAIL, SENHA) as mailbox:
    for msg in mailbox.fetch(AND(seen=False, subject="Cotação")):

        # 2️⃣ Monta resposta
        resposta = EmailMessage()
        resposta["From"] = EMAIL
        resposta["To"] = msg.from_
        resposta["Subject"] = "Re: " + msg.subject
        resposta.set_content("Recebemos sua mensagem. Em breve retornamos.")

        # 3️⃣ Envia
        with smtplib.SMTP_SSL("smtp.gmail.com", 465) as smtp:
            smtp.login(EMAIL, SENHA)
            smtp.send_message(resposta)

        # 4️⃣ Marca como lido
        mailbox.flag(msg.uid, MailBox.Flags.SEEN, True)

