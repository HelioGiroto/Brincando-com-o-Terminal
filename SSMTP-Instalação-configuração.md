Como instalar e configurar o SSMTP no Raspberry Pi

1. Instale: 
sudo apt-get install ssmtp
sudo apt-get update

2. Configure:
	2.1. Crie uma cópia de segurança do arquivo de configuração antes de modificá-lo, desse modo:
		<b>sudo cp /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.old</b>

	2.2. Edite o arquivo “/etc/ssmtp/smtp.conf”:
		<b>sudo gedit /etc/ssmtp/smtp.conf</b>

		Digite:

			root=SeuEmail@gmail.com
			mailhub=smtp.gmail.com:587 
			rewriteDomain=gmail.com 
			hostname=LTC
			UseTLS=Yes
			UseSTARTTLS=Yes
			AuthUser=SeuEmail@gmail.com
			AuthPass=SuaSenha
			AuthMethod=LOGIN
			FromLineOverride=yes

		Altere acima: "SeuEmail@..." pelo nome de seu email. E "SuaSenha" por sua senha real.

	2.3. Edite o arquivo 'revaliases':
		<b>sudo gedit /etc/ssmtp/revaliases</b>

		Digite essas duas linhas no final do arquivo:
	
			root:SeuEmail@gmail.com:smtp.gmail.com:587
			mainuser:SeuEmail@gmail.com:smtp.mail.com:587

		Não se esqueça de mudar "SeuEmail@..." pelo nome de seu email.

3. Dê permissão na sua conta Google abrindo essa URL:
	https://myaccount.google.com/lesssecureapps?pli=1

	Ative a opção: "Permitir aplicativos menos seguros". Em seguida feche a página.


4. Envie seus email desde a linha de comando do Terminal Linux:
	<b>echo "ola!" | ssmtp Destinatário@email.com	</b>	 Destinatário é o email quem vc escolher para enviar a frase "ola!"
	<b>ssmtp Destinatário@email.com < Desktop/arquivo.txt</b>	

	 Neste exemplo acima, o conteúdo do arquivo.txt é enviado como corpo de texto do email.
	O arquivo acima deve ter mais ou menos esse formato abaixo:


5. Crie um arquivo com a mensagem do email a ser enviada:
	(Atenção às duas primeiras linhas):

	To:  destinatario@email.com
	Subject: O assunto deste email

	Esta é a mensagem que estou
	enviando a você! 
	Tenha um excelente dia.
	Eu.

	 Salve o arquivo e envie-o como mostramos no ponto 4 (acima).


FONTE: Professor Juliano Ramos em: https://www.youtube.com/watch?v=Kk27HquRY2M
