# Crontabs na linha de comando

- Edita o cron:
`crontab -e`


- Cola o código:
```
# Das 6 as 23 de minuto a minuto:
* 6-22 * * * /usr/bin/python3 /caminho/completo/para/monitora_minuto.py >> /var/log/monitora_minuto.log 2>&1

# Todos os dias às 7h da manhã:
0 7 * * * /usr/bin/python3 /root/planilha_nao_lidos.py >> /var/log/planilha_nao_lidos.log 2>&1
```


- Cria os arquivos de log: 
`:> /var/log/planilha_nao_lidos.log`
`:> /var/log/monitora_minuto.log`


- Verifica como está o log:
`tail -f /var/log/monitora_minuto.log` 
`tail -f /var/log/planilha_nao_lidos.log` 


