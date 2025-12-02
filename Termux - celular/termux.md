# TERMUX

## Instalação:
- Baixe e instale f-droid pelo site `https://f-droid.org/pt_BR/`.
- Vá até a pasta downloads e abra o app sdk
- Talvez seja necessário dar permissão para "instalar apps desconhecidos" no seu Android
- Abra o aplicativo e busque por "Termux" (Emulador de terminal com pacotes) > baixe-o > instale-o
- Talvez seja necessário esperar que atualize o repositório - demora um pouco
- Igualmente, talvez seja necessário dar permissão para "instalar apps desconhecidos" no seu Android
- Baixe também o app "Termux-API"

_Fonte: https://github.com/termux/termux-app?tab=readme-ov-file#installation_


## Primeiras configurações:

- Abra o aplicativo Termux
- Digite: `termux-setup-storage`
- Digite `ls` e verifique se a pasta "storage" já aparece.
- Atualize os repositórios de pacotes com: `pkg up`
- Se for preciso digite: `pkg upgrade`
- Instale o pacote `pkg install termux-api`


## Para acessar as pastas do seu celular: 

- Abrindo o Termux, digite desde a pasta raiz: `cd storage` 
- Em seguida `ls`.


## Para acessar as pastas do sistema Android:

- Vá por este caminho:
`cd storage/shared/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/WhatsApp Business Documents/Private`

- Para apagar arquivos dessa pasta e outras. Ex.:
`rm -f *.[pP][dD][fF]`


## Termux Wiki:
`https://wiki.termux.dev/wiki/Main_Page`


## Comandos úteis do Termux API

### Wiki de documentação de todos os comandos:
`https://wiki.termux.dev/wiki/Termux:API`


**Comando: sms-list e sms_send**

```terminal
# para robots de sms - disparo direto de Termux:
termux-sms-list -help
termux-sms-send -n 99999999,99994494 "msg\nola\n\nola"
```

## Termux-Widget

Baixe e instale desde o F-Droid o Termux-Widget para servir como um tipo de ícone de programa no celular que executa um script de Termux.

Coloque na tela inicial de seu celular o Widget de Termux-Widget: 
	- Toque na tela e espere que apareça o ícone de Widget
	- Clique sobre este ícone e selecione o Termux-Widget 2X2
	- Toque e arraste-o para a tela inicial.
	
Verifique se existe uma pasta chamada ~/.shortcuts desde o Termux

Dentro desta pasta salve os scripts bash e após isso, você poderá abrí-los clicando sobre o Widget que instalou na tela inicial de seu celular.



## Termux-boot

Baixe e instale desde o F-Droid o Termux:Boot para executar scripts todas as vezes que inicia o celular.

Crie a pasta boot em:

`mkdir ~/.termux/boot`

Salve dentro deste diretório um script bash.

Cada vez que inicialize o celular ele vai executar este script.




Ver: 
https://www.learntermux.tech/2023/01/send-sms-using-termux-api.html
https://wiki.termux.com/wiki/Termux:API
https://wiki.termux.com/wiki/Termux-sms-send

https://wiki.termux.com/wiki/Termux-camera-photo
https://wiki.termux.com/wiki/Termux-telephony-call


## Extra

- Baixar desde o F-Droid o Import/Export SMS para possivel visualização de sms enviados/recebidos. (não necessário se usar o comando termux-sms-list).


