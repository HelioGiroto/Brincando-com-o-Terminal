# RANGER

Espaço 	- Seleciona 1 ou mais arquivos
R	- Open with...
A	- Rename (ou F2)
T	- Asterisco
S	- Shell
YY	- Copiar
PP	- Cola (Paste)
dD	- Deleta (+ enter) - quando for em lote, confirma com Y(es).
F	- Find
Q	- Quit / sai
i	- cola nome do arquivo selecionado para o Terminal
O	- Ordena (sort) 
:	- comando do terminal (por ex.: :mkdir nome)




---

## Executando o script Python selecionado direto no Ranger

Para rodar o arquivo Python ativo (selecionado) no gerenciador de arquivos `ranger` no Linux, você pode usar o console de comandos integrado. 

Aqui estão as formas mais comuns: 

1\. Usando o comando `!` (shell) 

Esta é a maneira mais rápida para rodar o arquivo uma única vez: 

1.  Posicione o cursor sobre o arquivo `.py`.
2.  Pressione **`!`** (exclamação) para abrir o console `:shell`.
3.  Digite `python3 %f` e pressione **Enter**.
    -   _Nota: `%f` é a variável do ranger para o arquivo atualmente selecionado._ 

2\. Usando o comando `:shell` com espera (Melhor para ver saídas) 

Se o seu script fecha muito rápido e você não consegue ver o resultado, use a flag `-w` (wait) para garantir que ele espere você pressionar Enter: 

1.  Pressione **`:`** para abrir o prompt.
2.  Digite `shell -w python3 %f` e pressione **Enter**. 

3\. Executando diretamente (Se o arquivo for executável) 

Se você já configurou o script com `chmod +x` e tem `#!/usr/bin/env python3` na primeira linha: 

1.  Pressione **`!`** (exclamação).
2.  Digite `./%f` e pressione **Enter**. 

___

Dica Pro: Criando um atalho no `rc.conf` 

Para facilitar, você pode criar um atalho permanente no seu arquivo de configuração do ranger (`~/.config/ranger/rc.conf`): 

1.  Abra seu `rc.conf`.
2.  Adicione a linha:
    
    bash
    
    ```
    map <F5> shell -w python3 %f
    ```
    
    Copiado para a área de transferência
    
3.  Salve. Agora, toda vez que apertar **F5** no ranger, ele rodará o script Python selecionado.


