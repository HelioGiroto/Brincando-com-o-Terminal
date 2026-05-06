O `tmux` é um multiplexador de terminal que permite gerenciar várias sessões, janelas e painéis em uma única janela de terminal, ideal para manter processos rodando em segundo plano. 

O atalho principal é **`Ctrl+b`** (chamado de _prefix_), seguido por outra tecla para executar comandos. [](https://cwi.com.br/blog/guia-pratico-do-tmux/)


**Comandos Essenciais (Prefix: `Ctrl+b`):** 

-   **Sessões:**
    -   `tmux` (inicia nova sessão)
    -   `tmux ls` (lista sessões ativas)
    -   `tmux attach -t <nome>` (reconecta a uma sessão)
    -   `Ctrl+b` + `d` (desconecta/detach da sessão atual)
    
-   **Painéis (Divisão de Tela):**
    -   `Ctrl+b` + `%` (divide verticalmente)
    -   `Ctrl+b` + `"` (divide horizontalmente)
    -   `Ctrl+b` + `setas` (navega entre painéis)
    -   `Ctrl+b` + `x` (fecha o painel atual)
    
-   **Janelas:**
    -   `Ctrl+b` + `c` (cria nova janela)
    -   `Ctrl+b` + `n` (próxima janela)
    -   `Ctrl+b` + `p` (janela anterior)
    
    
### Atalhos  

Dicionário:

1.  significa que você tem que pressionar **Ctrl + a** ou **Ctrl + b**
2.  **c** significa que você tem que pressionar **Ctrl + a** ou **Ctrl + b** seguido de **c**
3.  **C-c** **means you have to hit Ctrl + a** ou **Ctrl + b** seguido de **Ctrl + c**

Comandos básicos:

-   **r** recarrega as configurações
-   **C-l** limpa a tela e o histórico do tmux
-   **C-c** cria uma nova sessão
-   **C-f** permite alternar entre sessões usando o nome ou número
-   **\\$** permite renomear o nome da sessão
-   **C-h + C-l** permite navegar pelos painéis
-   **Tab** leva você para o último painel ativo
-   **\-** divide o painel atual verticalmente
-   **\_** divide o painel atual horizontalmente
-   **h, j, k** e **l** navega pelos painéis como se tivesse usando o Vim
-   **H, J, K** e **L** redimensiona os painéis
-   **⇧, ⇨, ⇩** e **⇦** navega pelos painéis
-   **+** maximiza o painel atual em uma nova janela
-   **m** ativa ou desativa o uso do mouse
-   **Enter** entra no modo de cópia
-   **b** lista o que se tem copiado de pasta
-   **p** cola o último conteúdo copiado
-   **P** permite escolher o que será colado em uma lista
