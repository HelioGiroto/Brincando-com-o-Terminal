# SYSTEMD

1. Cria o arquivo chamado `wacli.service` 
nano /etc/systemd/system/wacli.service


2. Cola o seguinte:

```
[Unit]
Description=WACLI WhatsApp Sync Service
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=root
ExecStart=/usr/local/bin/wacli --store /root/.wacli sync --follow
Restart=always
RestartSec=10
KillMode=process

# Limitações de log e ambiente
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
```



3. Ativar e Iniciar o Serviço

```
# 1. Recarregar o gerenciador do systemd
systemctl daemon-reload

# 2. Habilitar para iniciar no boot do sistema
systemctl enable wacli.service

# 3. Iniciar o serviço imediatamente
systemctl start wacli.service
```


4. Comandos para subir ou parar o serviço:

- Iniciar o serviço:
`systemctl start wacli.service`

- Verificar se está ativo:
`systemctl status wacli.service`

- Acompanhar os logs em tempo real:
`journalctl -u wacli.service -f` 

- Parar o serviço:
`systemctl stop wacli.service` 

- Reiniciar o serviço:
`systemctl restart wacli.service` 

- Verificar versão:
`systemctl --version`





