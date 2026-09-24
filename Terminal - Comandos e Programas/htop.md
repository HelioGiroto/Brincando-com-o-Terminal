# HTOP

## Tabela das teclas de atalho e flags (no uso direto na linha de comando):

**Principais do meu uso:**
F5 e H 

### 1. Navegação, Filtro e Seleção

| Tecla de Atalho | Flag no Terminal | Significado / O que faz |
| --- | --- | --- |
| **`u`** | `-u <user>`, `--user=<user>` | Filtra a exibição para mostrar apenas os processos de um usuário específico. |
| **`/`** ou **`F3`** | *(não possui flag direta)* | Busca incremental por nome de processo (avança com `F3` ou `Enter`). |
| **`\`** ou **`F4`** | *(não possui flag direta)* | Filtra a lista mantendo na tela apenas os processos que contêm o termo digitado. |
| **`Espaço`** | *(não possui flag direta)* | Marca/seleciona múltiplos processos para ações em lote. |
| **`c`** | *(não possui flag direta)* | Marca o processo atual e automaticamente todos os seus processos filhos. |
| **`U`** | *(não possui flag direta)* | Desmarca todos os processos previamente selecionados. |

---

### 2. Modos de Exibição e Ordenação

| Tecla de Atalho | Flag no Terminal | Significado / O que faz |
| --- | --- | --- |
| **`t`** ou **`F5`** | `-t`, `--tree` | Alterna para a visualização em árvore hierárquica (processos pais e filhos). |
| **`>`** ou **`F6`** | `-s <COLUNA>`, `--sort-key=<COLUNA>` | Ordena a tabela por uma coluna específica (ex: `-s PERCENT_CPU` ou `-s PERCENT_MEM`). |
| **`P`** | `-s PERCENT_CPU` | Ordena a lista diretamente pelo maior consumo de **CPU%**. |
| **`M`** | `-s PERCENT_MEM` | Ordena a lista diretamente pelo maior consumo de **Memória%**. |
| **`T`** | `-s TIME` | Ordena os processos pelo **tempo total de execução** acumulado. |
| **`I`** | *(não possui flag direta)* | Inverte a ordem de ordenação atual (crescente ou decrescente). |
| **`+`** / **`-`** | *(não possui flag direta)* | Expande ou recolhe os subprocessos de um nó específico dentro da árvore. |

---

### 3. Gerenciamento e Diagnóstico

| Tecla de Atalho | Flag no Terminal | Significado / O que faz |
| --- | --- | --- |
| **`s`** | *(não possui flag direta)* | Rastreia chamadas de sistema do processo selecionado em tempo real via `strace`. |
| **`l`** | *(não possui flag direta)* | Abre a lista de todos os arquivos e conexões de rede abertos pelo processo via `lsof`. |
| **`e`** | *(não possui flag direta)* | Exibe todas as variáveis de ambiente (`ENV`) associadas ao processo selecionado. |
| **`k`** ou **`F9`** | *(não possui flag direta)* | Abre a janela para enviar sinais de encerramento/controle Unix (`SIGTERM`, `SIGKILL`, etc.). |
| **`[`** / **`]`** *(ou `F7`/`F8`)* | *(não possui flag direta)* | Ajusta a prioridade (*nice value*) do processo para mais alta ou mais baixa. |
| **`a`** | *(não possui flag direta)* | Permite definir a afinidade de CPU (em quais núcleos o processo tem permissão para rodar). |

---

### 4. Configuração e Personalização do Ambiente

| Tecla de Atalho | Flag no Terminal | Significado / O que faz |
| --- | --- | --- |
| **`H`** | `-H`, `--no-threads` | Oculta ou exibe as threads criadas pelo usuário (reduz o ruído de processos multi-thread). |
| **`K`** | `-K`, `--no-kernel-threads` | Oculta ou exibe as threads internas do kernel do Linux. |
| **`p`** | *(não possui flag direta)* | Alterna a exibição entre o caminho completo do comando (`/usr/bin/...`) e apenas o nome do binário. |
| **`S`** ou **`F2`** | `-C`, `--no-color` *(parcial)* | Acesso às opções gerais (*Setup*). A flag `-C` força o modo monocromático sem cores. |
| *(via Setup)* | `-d <décimos>`, `--delay=<décimos>` | Define o intervalo de atualização da tela (ex: `-d 10` para atualizar a cada 1 segundo). |
| *(via Setup)* | `-p <PID,PID...>`, `--pid=<PID,PID...>` | Inicia monitorando apenas os PIDs especificados na linha de comando. |
| **`q`** ou **`F10`** | *(não possui flag direta)* | Encerra e sai do `htop`. |


## Exemplos com flags:

Aqui estão as combinações de flags mais eficientes para diagnóstico rápido, administração de servidores e monitoramento direcionado:

---

### 1. Diagnóstico de Gargalos Críticos

* **Top de Memória Limpo (sem threads):**
```bash
htop -s PERCENT_MEM -H

```


Ordena pelo maior consumo de memória RAM (`-s PERCENT_MEM`) e oculta threads de usuário (`-H`). Essencial para identificar processos "vazando" memória sem poluir a lista com dezenas de workers leves.
* **Top de Consumo de CPU:**
```bash
htop -s PERCENT_CPU -H

```


Garante que o topo da lista contenha os processos devoradores de processamento principal.
* **Processos Acumulados no Tempo (Zombies / Long-run):**
```bash
htop -s TIME -H

```


Ordena pelo tempo cumulativo de execução em CPU. Ajuda a achar processos antigos que continuam rodando em segundo plano e esquecidos no servidor.

---

### 2. Monitoramento de Serviços Específicos

* **Filtrar por Usuário de Aplicação / Web:**
```bash
htop -u www-data -tH

```


Filtra apenas os processos do usuário `www-data` (ou `nginx`, `postgres`, etc.), exibindo-os em árvore hierárquica (`-t`) e ocultando threads individuais (`-H`).
* **Monitorar PIDs Dinamicamente (ex: Nginx, Node ou Docker):**
```bash
htop -p $(pgrep -d',' nginx)

```


Combina a flag `-p` com o `pgrep` para isolar exclusivamente os processos de um daemon específico e monitorar apenas a família dele.

---

### 3. Otimização para Servidores com Pouco Recurso ou SSH Lento

* **Modo Leve e de Baixa Atualização (economia de banda/CPU):**
```bash
htop -d 30 -C

```


* `-d 30`: Atualiza a tela a cada 3 segundos (o valor é em décimos de segundo; o padrão costuma ser 1.5s).
* `-C`: Modo monocromático sem cores. Reduz o tráfego de escape sequences em conexões SSH lentas/instáveis.


* **Visão Enxuta Global (Sem ruído de Kernel e sem Threads):**
```bash
htop -H -K -t

```


Remove threads de usuário (`-H`), threads do kernel (`-K`) e agrupa em árvore (`-t`). É a visão mais limpa possível para enxergar apenas a estrutura de processos reais do sistema.

---

### 4. Atalhos Recomendados para o seu `.bashrc` / `.zshrc`

Se você usa essas combinações com frequência, adicione aliases para economizar tempo no terminal:

```bash
# Visão estruturada e sem ruído padrão
alias htop='htop -tH'

# Checagem rápida de uso de memória
alias htop-mem='htop -s PERCENT_MEM -H'

# Checagem rápida de uso de CPU
alias htop-cpu='htop -s PERCENT_CPU -H'

```
