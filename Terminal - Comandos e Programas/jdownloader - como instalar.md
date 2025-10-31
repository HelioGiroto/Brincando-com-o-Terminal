# Instalar o JDownloader

- Vá até https://jdownloader.org/download/index
- Link: Linux
- Clica em Download Installer
- Abre o MEGA > botão: "Fazer Download"
- Execute o script.sh -> bash JDownloader2Setup_unix_nojre.sh
- Next + Next... (podendo escolher a pasta onde ficará o programa como oculta: .jd2)

- Contribua: https://my.jdownloader.org/contribute



- Para rodar no terminal: 
(Atenção para a pasta em que foi instalado o jDownloader):

` java -jar ~/.jd2/JDownloader.jar &  `
` java -jar ~/.jd2/JDownloader.jar --help `



## Para fazer login em conta de Youtube - caso peça porque suspeita ser um bot:
_(A mensagem aparece no jDonwloader quando se tenta baixar muitos videos ou srt de uma só vez)_

- Instruções:
https://support.jdownloader.org/en/knowledgebase/article/account-cookie-login-instructions

- Instale a Extensão 'Flag Cookies' no Chrome:
https://chromewebstore.google.com/detail/flag-cookies/phcaemipbgodliopfijmcmlbdhpkbndb
https://addons.mozilla.org/pt-BR/firefox/addon/flag-cookies/

- Abra o youtube no canal (que quase não usa). Clica na extensão > Preferences > Export cookies to clipboard

- Depois abre o jDownloader:
 	- Configurações 
 	- Gerenciador de Contas
 	- Adicionar (botão no rodapé da tela)
 	- Youtube
 	- Cola o nome do seu canal do youtube (com o @...)
 	- Cola o cookie copiado pela extensão do navegador




```
 |==================================================================================================
   |==================================================================================================
   |                         ---  JDownloader2 CommandLine Help  ---       
   |==================================================================================================
   |https://jdownloader.org
   |-add-containers/-add-container/-co <ContainerPath1> <ContainerPath2> ... <ContainerPath*> Add Container Files to the LinkGrabber
   |-add-passwords/-add-password/-p Password1\r\nPassword2\r\n....\r\nContainerPath Add Extraction Passwords
   |-add-links/-add-link/-a <Link1> <Link2> ... <Link*> Add Links to the LinkGrabber
   |-focus/-f/-afterupdate	 Focus JDownloader and bring JD to TOP
   |-minimize/-m	 Minimize JDownloader to the Taskbar
   |-h/-help/-?	 Show this help
   |-jacShow/-jacTrain	 Show the JAntiCaptcha Trainer
   |-reconnect/-r	 Do a Reconnect
   |	 Load Container files
   |-brdebug	 Set the Browser Debug Mode. Verbose Connection Infos
   |-scanextensions/-scanplugins/-scan	 Rescan Plugins at Startup
   |-myjd	 Init MyJdownloader -myjd
   |-noerr	 Disable System.err
   |-set	 Set Config -set class key value
   |-threaddump	 prints thread dump
   |-n	 Force a new Instance.
   |-console	 Write all Logs to STDOUt or STDERR
   |-s/--show		Show JAC prepared captchas
   |-t/--train		Train a JAC method
   |-C/--captcha <filepath or url> <method>	Get code from image using JAntiCaptcha
   |-p/--add-password(s)	Add passwords
   |-n --new-instance	Force new instance if another jD is running
   |==================================================================================================
   |==================================================================================================
```



