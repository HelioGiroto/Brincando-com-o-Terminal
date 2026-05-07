# THUNAR

## Criar ícones de execução em barra de ferramentas 

- Menu > Editar > Configurar ações personalizadas
- "+"
- 



## Criar novos ícones 

Achei um jeito mais rápido: 
copia a imagem png de 50x50 pixels para `/usr/share/pixmaps` e ao escolher o icone, muda a opção "Selecionar ícone de:" de "Todos os ícones" para "arquivos de imagem" e a pasta e arquivo (imagem) aparece


## Exportar configurações para outro computador

Para salvar suas configurações do Thunar e levá-las para outro computador, você só precisa copiar alguns arquivos específicos localizados na sua pasta pessoal (Home).
Aqui estão os arquivos que você deve salvar:

### 1. Ações Personalizadas (UCA)
Esta é a parte mais importante para o que configuramos hoje. Todas as suas ações (como o ícone do Python e do Tmux) ficam salvas em um único arquivo XML: [1, 2] 

* Caminho: ~/.config/Thunar/uca.xml
* O que fazer: Copie este arquivo para o novo computador no mesmo diretório. [3] 

### 2. Atalhos de Teclado (Acelerações)
Se você criou atalhos de teclado para suas ações ou para funções do sistema, eles ficam aqui: [4, 5] 

* Caminho: ~/.config/Thunar/accels.scm [5] 

### 3. Ícones Personalizados
Como você colocou seus ícones em /usr/share/pixmaps, eles não estão na sua pasta Home.

* Ação necessária: Você deve copiar manualmente as imagens que criou/baixou da pasta /usr/share/pixmaps do computador antigo para a mesma pasta no novo.
* Importante: Se você não copiar as imagens para o mesmo caminho exato, as ações no Thunar aparecerão com um ícone de "erro" ou em branco.

### 4. Preferências Gerais
Para salvar as configurações de exibição (visão em lista, tamanho dos ícones, barras laterais):

* Caminho: ~/.config/Thunar/thunarrc [6] 

------------------------------
### Resumo para Backup Rápido
Você pode rodar este comando no terminal para criar um arquivo compactado com tudo o que é essencial da sua Home:

tar -cvzf backup_thunar.tar.gz ~/.config/Thunar/uca.xml ~/.config/Thunar/accels.scm ~/.config/Thunar/thunarrc

Dica ao Restaurar: Antes de colar os arquivos no novo computador, feche o Thunar completamente rodando thunar -q no terminal. Isso garante que ele leia os novos arquivos assim que abrir novamente. [5, 7] 

[1] [https://unix.stackexchange.com](https://unix.stackexchange.com/questions/395066/is-it-possible-to-backup-and-restore-thunar-custom-actions)
[2] [https://unix.stackexchange.com](https://unix.stackexchange.com/questions/395066/is-it-possible-to-backup-and-restore-thunar-custom-actions)
[3] [https://unix.stackexchange.com](https://unix.stackexchange.com/questions/395066/is-it-possible-to-backup-and-restore-thunar-custom-actions)
[4] [https://wiki.archlinux.org](https://wiki.archlinux.org/title/Thunar)
[5] [https://askubuntu.com](https://askubuntu.com/questions/803472/add-keyboard-shortcut-to-function-inside-thunar)
[6] [https://github.com](https://github.com/nobodyinperson/thunar-custom-actions)
[7] [https://askubuntu.com](https://askubuntu.com/questions/18367/how-to-customize-files-context-menu-in-xubuntu-xfce-thunar-file-manager)

