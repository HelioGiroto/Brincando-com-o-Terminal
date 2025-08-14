# Como Atualizar do Debian 12 para o Debian 13 | Marlon Luan | Blog

# Como Atualizar do Debian 12 para o Debian 13

No dia 10 de junho de 2023, o Projeto Debian lançou a versão estável do Debian 13, também conhecida como _Trixie_, trazendo muitas novidades, melhorias de segurança e atualizações de software. Por isso, muitos usuários estão ansiosos para aproveitar os avanços que ele oferece.

A versão _Trixie_ receberá atualizações de segurança até 10 de junho de 2026, entrando em seu período de LTS (Long Term Support), que estenderá seu suporte por pelo menos mais dois anos, até 2028.

Dado o suporte de cinco anos, atualizar para o Debian 13 oferece tranquilidade para servidores e PCs desktop por muitos anos. Este guia passo a passo irá ajudá-lo a realizar a atualização do Debian 12 para o Debian 13 com sucesso.

## Passo 1: Fazer um Backup Completo do Sistema

Antes de iniciar a atualização, é altamente recomendado fazer um backup completo do seu sistema. Se algo der errado durante o processo, você poderá restaurar seus dados e configurações. Você pode usar um comando como o seguinte para criar um backup comprimido em formato _tar.gz_ de diretórios críticos do sistema:

```bash
sudo tar czf /bookworm.tar.gz \
    --exclude=/bookworm.tar.gz \
    --exclude=/dev \
    --exclude=/mnt \
    --exclude=/proc \
    --exclude=/sys \
    --exclude=/tmp \
    --exclude=/media \
    --exclude=/lost+found
```

Sinta-se à vontade para adicionar mais parâmetros `--exclude=` caso necessário. Este comando cria um backup de todos os arquivos no arquivo _bookworm.tar.gz_, localizado na partição raiz (/), que você deve transferir para outro computador ou disco, por exemplo, usando o comando SCP.


## Passo 2: Atualizar Todos os Pacotes Instalados

Antes de atualizar para a nova versão do Debian, é importante garantir que o sistema Debian atual esteja totalmente atualizado. Execute os seguintes comandos APT no terminal:

```bash
sudo apt update
sudo apt upgrade
sudo apt full-upgrade
```

Se houver atualizações disponíveis, instale-as e, em seguida, remova pacotes que não são mais necessários:

```bash
sudo apt --purge autoremove
```

Depois, reinicie o sistema:

```bash
sudo reboot
```

Após o sistema reiniciar, faça login novamente.


## Passo 3: Verificar Pacotes “Não Debian” Instalados

Verifique se há pacotes instalados no seu sistema que não são provenientes dos repositórios oficiais do Debian, pois isso pode causar problemas durante a atualização. Para fazer isso, execute:

```bash
sudo apt list '?narrow(?installed, ?not(?origin(Debian)))'
```

Se o sistema listar pacotes de fontes externas, como Google Chrome ou Docker, é recomendado desinstalá-los antes de atualizar, caso não sejam essenciais. Após a atualização, você pode reinstalar essas aplicações.


Além disso, verifique se há pacotes que você tenha bloqueado para não serem atualizados com o comando:

```bash
sudo apt-mark showhold
```

Se o comando retornar pacotes, execute:

```bash
sudo apt-mark unhold nome_do_pacote
```

## Passo 4: Atualizar os Arquivos de Fontes de Software

Os repositórios de software do Debian estão configurados nos arquivos `/etc/apt/sources.list` e `/etc/apt/sources.list.d/`. Antes de atualizar, você deve reconfigurá-los para apontar para os repositórios da nova versão do Debian.


Primeiro, faça backup dos arquivos de configuração:

```bash
mkdir ~/apt
cp /etc/apt/sources.list ~/apt
cp -r /etc/apt/sources.list.d/ ~/apt
```

Agora, substitua as referências de _bookworm_ por _trixie_ nos arquivos de configuração:

```bash
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list.d/*
```

Após essa modificação, o arquivo `/etc/apt/sources.list` deve ficar semelhante a este:

```bash
deb http://deb.debian.org/debian/ trixie main contrib non-free-firmware
deb-src http://deb.debian.org/debian/ trixie main contrib non-free-firmware

deb http://security.debian.org/debian-security trixie-security main contrib non-free-firmware
deb-src http://security.debian.org/debian-security trixie-security main contrib non-free-firmware

deb http://deb.debian.org/debian/ trixie-updates main contrib non-free-firmware
deb-src http://deb.debian.org/debian/ trixie-updates main contrib non-free-firmware
```

## Passo 5: Realizar uma Atualização Inicial

Com os repositórios atualizados, execute:

```bash
sudo apt update
```

Você verá que vários pacotes precisam ser atualizados. O Debian recomenda realizar a atualização em duas partes. A primeira parte é uma atualização mínima, que atualizará todos os pacotes disponíveis sem adicionar ou remover pacotes. Para isso, execute:

```bash
sudo apt upgrade --without-new-pkgs
```

Durante a atualização, preste atenção às informações importantes sobre pacotes atualizados. Se solicitado, pressione `q` para sair da visualização e continuar a atualização. O sistema pode solicitar sua permissão para reiniciar serviços automaticamente, escolha “Sim” e pressione “Enter”.

Se houver arquivos de configuração modificados, escolha a opção padrão (pressionando Enter) para continuar com a atualização.

## Passo 6: Realizar a Atualização Completa

Após a atualização mínima, execute o comando a seguir para iniciar a atualização completa:

```bash
sudo apt full-upgrade
```

Leia as notificações e execute as ações necessárias conforme solicitado. Depois de concluir, reinicie o sistema:

```bash
sudo reboot
```

Quando o sistema reiniciar, faça login e aproveite seu sistema atualizado.

## Passo 7: Limpeza de Pacotes Obsoletos

Após a atualização, é recomendável remover pacotes obsoletos que não são mais necessários. Execute o seguinte comando:

```bash
sudo apt --purge autoremove
```

## Conclusão

Atualizar do Debian 12 _Bookworm_ para o Debian 13 _Trixie_ é um processo simples e direto, desde que você siga as etapas corretamente. Este guia fornece todas as informações essenciais para garantir uma atualização bem-sucedida, permitindo que você aproveite as novas funcionalidades e melhorias de segurança do Debian 13, mantendo a estabilidade e segurança do seu sistema.

Para mais ajuda ou informações úteis, consulte a [documentação oficial de upgrade do Debian](https://www.debian.org/releases/stable/amd64/release-notes/ch-upgrading.en.html).

  

### Veja também:

# [**O Sistema Operacional Debian: Uma Visão Abrangente**](https://marlonluan.com.br/posts/debian/)

## Uma análise detalhada do sistema operacional Debian, incluindo sua história, características principais, uso e comunidade.

# [**Entendendo o Filesystem Hierarchy Standard (FHS)**](https://marlonluan.com.br/posts/filesystem-hierarchy-standard/)

## Um guia abrangente sobre o padrão de hierarquia de sistema de arquivos em sistemas Unix-like, incluindo sua importância e estrutura.

## Embedded Content
