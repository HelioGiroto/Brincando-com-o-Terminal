# WACLI

## Instalação



`sudo apt install sqlite3`  


## Parear e sincronizar:
- Parear com o WhatsApp (escaneie o QR code com o celular):
`wacli auth`

- Deixar o sync rodando (em outro terminal ou em background):
`wacli sync --follow`
`nohup wacli sync --follow > /dev/null 2>&1 &` 

- Para matar o processo: 
`pkill wacli` 
`killall wacli`


## Listando os JIDs e números dos grupos:
`wacli groups list`
`wacli groups list --limit 200`

- Se não sair todos, refresque:
`wacli groups refresh` 

Em seguida, rode novamente o comando: `... list --limit X`, sendo X o número de grupos.


Para filtro: `wacli groups list --query "nome"`. 
Se quiser só os JIDs em JSON: `wacli groups list --json`.


## Enviar mensagens de texto (com o sync rodando):
- Para contato:
`wacli send text --to "NOME_DO_CONTATO" --message "sua mensagem"`

- Para grupo:
`wacli send text --to "NOME_DO_GRUPO" --message "sua mensagem"`
`wacli send text --to 123456789@g.us --message "sua mensagem"`
`wacli send text --to 12345678@g.us --message "sua mensagem"`
`wacli send text --to 5511912340000 --message "\`Mensagem via wacli\`" `

- Por número:
`wacli send text --to 5511999999999 --message "sua mensagem"`

O --to aceita nome de contato/grupo sincronizado, número de telefone ou JID. O sync --follow precisa estar rodando para o send funcionar (ele delega o envio ao processo do sync).


## Enviar mensagens com arquivo anexo:

- Com arquivo (send file):
`wacli send file --to "Contato" --file ./foto.jpg --caption "legenda"`
`wacli send file --to "Contato" --file ./caminho/do/arquivo.pdf --caption "legenda opcional"`


Para grupo com JID:
`wacli send file --to 120363131365325006@g.us --file ./documento.pdf --caption "segue anexo"`

- Formatos suportados: imagens, vídeos, áudio, PDFs, etc. **Limite de 100 MiB.**


## Escutando mensagens:





