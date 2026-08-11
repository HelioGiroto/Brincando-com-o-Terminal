# WACLI

## Instalação

ver em https://wacli.sh/install.html
`sudo apt install sqlite3`  


## Parear, sincronizar, monitorar e matar o processo:

1- Parear com o WhatsApp (escaneie o QR code com o celular):
`wacli auth`
`wacli --store /root/.wacli auth` 

> Esperar!! -> No caso do WACLI, é recomendável aguardar terminar a sincronização inicial antes de rodar outros comandos de escrita ou consultas pesadas no mesmo banco. Para a primeira execução (autenticação e baixa do histórico), aguarde a conclusão. Riscos: Bloqueio do Banco SQLite, Mecanismo de Lock do WACLI


2- Deixar o sync rodando (em outro terminal ou em background):
`wacli sync --follow`
`wacli --store /root/.wacli sync --follow` 	-   explícito* (melhor - ver https://share.gemini.google/AErFYcvi1FzL) 

> *Indicado por garantir que a aplicação sempre encontre a sessão correta sem depender de variáveis de ambiente como $HOME ou ~.


- Com `nohup`:
`nohup wacli sync --follow > /dev/null 2>&1 &` 
`nohup wacli --store /root/.wacli sync --follow > /var/log/wacli.log 2>&1 &`


3- Acompanhar logs em tempo real:
`tail -f /var/log/wacli.log` 



4- Para matar o processo: 
`ps aux | grep wacli` 	- Encontrar o processo correspondente

Alternativas:
`pkill wacli` 
`killall wacli`
`pkill -f "wacli --store /root/.wacli sync"` 




---

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





## Extraindo mensagens do Banco de Dados do Wacli

importar_wacli_portatil.sh		- em que VPS está esse script? 

O problema: o escutar_mensagens_hermes.sh está rodando em modo tempo real (polling a cada 3s,
pegando as últimas 30 mensagens). Ele só processa mensagens novas que chegam depois que o script
iniciou. As 30k+ mensagens históricas continuam no banco do wacli, nunca foram exportadas.

Solução: rodar o --import para fazer o backfill do histórico:

bash
cd /root
`bash /root/wacli/escutar_mensagens_hermes.sh --import --limit 5000`


Isso importa as últimas 5.000 mensagens do banco para os .txt. Pode repetir com --limit 10000 etc. para
alcançar mais mensagens antigas. Depois que o import terminar, o script entra automaticamente em modo
tempo real.

Atenção: o import de 32k mensagens pode demorar um pouco (cada mensagem é processada individualmente,
e mídias são baixadas). Se quiser pular o download de mídia no import (mais rápido), use --no-media:

bash
bash /root/wacli/escutar_mensagens_hermes.sh --import --limit 5000 --no-media



