# Biblioteca schedule

O `schedule` é uma biblioteca Python para agendamento de tarefas em tempo real, baseada em loop, muito usada para:

- Enviar e-mails automaticamente

- Sincronizar dados

- Executar scripts em horários fixos

- Rodar tarefas a cada X minutos/horas/dias

- Pequenas automações (bots, integrações, ETL simples)

📌 Diferentemente de usar `cron`, a biblioteca `schedule` não cria um serviço do sistema — o script precisa estar rodando.

## Instalação

`pip install schedule`


## 🧠 Conceito básico

Você define:

- O que será executado → uma função
- Quando → intervalo ou horário
- Um loop infinito que verifica se está na hora

Exemplo: 

```python 
import schedule
import time

def tarefa1():
    print("Executando tarefa 1...")

def tarefa2():
    print("Executando tarefa 2...")

schedule.every(5).seconds.do(tarefa1)
schedule.every(5).seconds.do(tarefa2)

while True:
    schedule.run_pending()	
    time.sleep(1)
```

O `schedule.run_pending()` é como se o schedule olhasse o relógio e perguntasse: "em alguma tarefa que deveria rodar agora ou antes de agora?". Mesmo que tenha várias tarefas, o `run_pending` só estará uma vez num looping. E esse loop verifica de segundo a segundo (por exemplo). 


*Outro exemplo:*

```python
def tarefa_1(): print("1")
def tarefa_2(): print("2")
def tarefa_3(): print("3")
def tarefa_4(): print("4")

schedule.every(2).seconds.do(tarefa_1)
schedule.every(4).seconds.do(tarefa_2)
schedule.every(6).seconds.do(tarefa_3)
schedule.every(8).seconds.do(tarefa_4)

while True:
    schedule.run_pending()
    time.sleep(1)
```

*Outro exemplo parecido com o de cima - com função lambda:*

Lambda é uma função "anônima" que tem apenas uma instrução (comando). É como uma "função ternária".

```python
tarefas = [
    (5, lambda: print("A cada 5s")),
    (10, lambda: print("A cada 10s")),
    (15, lambda: print("A cada 15s")),
]

for segundos, funcao in tarefas:
    schedule.every(segundos).seconds.do(funcao)

while True:
    schedule.run_pending()
    time.sleep(1)
```

## Mais exemplos de uso

```python
# executa uma tarefa() a cada... X segundos, dias, horas, etc:
schedule.every(10).seconds.do(tarefa)
schedule.every(5).minutes.do(tarefa)
schedule.every(1).hours.do(tarefa)
schedule.every(2).hours.do(tarefa)
schedule.every(3).days.do(tarefa)

# num horário específico a cada dia:
schedule.every().day.at("09:00").do(tarefa)

# em certo dia da semana e horário específico:
schedule.every().monday.at("08:30").do(tarefa)
schedule.every().friday.at("18:00").do(tarefa)

# execute uma tarefa a cada 10 segundos até dia e hora específico:
schedule.every(10).seconds.do(tarefa).until("2026-01-31 18:00")

# até um limite de tempo:
from datetime import datetime, timedelta
limite = datetime.now() + timedelta(minutes=30)
schedule.every(2).minutes.do(tarefa).until(limite)

# parâmetros numa função:
schedule.every().day.at("10:00").do(enviar_email,destinatario="cliente@empresa.com")

# ver todas as tarefas agendadas:
for job in schedule.jobs:
    print(job)

```
