# Segurança de um sistema Linux

## Programas utilitários 

Programas para detectar alguma irregularidade:

- gufw
    - Ativa o firewall de sua máquina.

Executa como root: `sudo gufw`


- rkhunter (apenas como root)

`sudo rkhunter --check`

    Caso apresente um Warning no comando /usr/bin/lwp-request é porque o rkhunter precisa saber qual gerenciador de pacotes você está usando.
    Solução: 
    Crie ou edite /etc/rkhunter.conf.local e adicione a seguinte linha:
    `PKGMGR=DPKG`

    Se você não estiver no Debian ou Ubuntu, então troque DPKG pelo seu gerenciador de pacotes atual.
    Dessa forma, o rkhunter saberá esperar que esses executáveis sejam scripts e não sinalizará o falso positivo.
    Isso garantirá que, se os arquivos forem adulterados, um novo resultado positivo será exibido.

- chkrootkit (somente como root)

`sudo chkrootkit`

(Por ser muito verboso, se recomenda direcionar saida para um arquivo txt)
    





https://pt.linux-console.net/?p=29887
https://guialinux.com.br/seguranca-no-ubuntu/
https://diolinux.com.br/sistemas-operacionais/como-proteger-o-linux.html
https://www.cyberciti.biz/faq/howto-check-linux-rootkist-with-detectors-software/
https://pt.linux-console.net/?p=16968
https://unix.stackexchange.com/questions/373718/rkhunter-gives-me-a-warning-for-usr-bin-lwp-request-what-should-i-do-debi#397723
https://serverfault.com/questions/697865/rkhunter-suspicious-shared-memory-segments
https://www.cyberciti.biz/faq/remove-hidden-files-in-linux/


