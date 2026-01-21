# Google Calendar API

- Instalar as bibliotecas:

```
pip install google-api-python-client 
pip install google-api-python-client google-auth-httplib2 google-auth-oauthlib
pip install gcsa
```


## Bibliotecas principais:

- google-api-python-client: O cliente oficial do Google, mais robusto, mas requer mais código para tarefas simples.

- gcsa (Google Calendar Simple API): Uma biblioteca mais "Pythonic" e orientada a objetos, que simplifica o uso da API oficial.

- BotCity Google Calendar Plugin: Focado em automação, com funções prontas para obter, criar e gerenciar eventos.


## Como começar (usando o oficial)

ver: https://developers.google.com/workspace/calendar/api/quickstart/python?hl=pt-br

- Habilite a API: No Google Cloud Console, crie um projeto, vá em "Biblioteca" e ative a "Google Calendar API".

- Obtenha Credenciais OAuth: Configure a tela de consentimento OAuth e crie um ID de cliente OAuth 2.0 para aplicativo de desktop.

- Instale a biblioteca: No seu terminal, execute pip install google-api-python-client google-auth-oauthlib google-auth-httplib2.

- Execute o Guia de Início Rápido: Siga o guia oficial para Python, que gera um arquivo credentials.json e um token para autenticação. 


## Exemplo de uso:

### Criar um evento:

```python
# pip install gcsa
from gcsa import GoogleCalendar
from gcsa.event import Event

# Substitua pelo seu email
calendar = GoogleCalendar('seu_email@gmail.com')

# Listar eventos
for event in calendar:
    print(event)

# Criar evento
new_event = Event('Meu Evento', start='2026-01-25T10:00:00', end='2026-01-25T11:00:00')
calendar.add_event(new_event)
```

### Consultar eventos:

- Biblioteca simples:
```python
from gcsa.google_calendar import GoogleCalendar
from datetime import datetime

# Autenticação simplificada
calendar = GoogleCalendar('seu_email@gmail.com')

# Listar eventos do mês atual
for event in calendar:
    print(event.summary)
```

Exemplos mais robusto - últimos 10 eventos:


```python
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
import datetime

# Configuração de escopo (apenas leitura)
SCOPES = ['https://www.googleapis.com/auth/calendar.readonly']

# Autenticação
flow = InstalledAppFlow.from_client_secrets_file('credentials.json', SCOPES)
creds = flow.run_local_server(port=0)
service = build('calendar', 'v3', credentials=creds)

# Consulta de eventos
now = datetime.datetime.utcnow().isoformat() + 'Z'
events_result = service.events().list(
    calendarId='primary', 
    timeMin=now,
    maxResults=10, 
    singleEvents=True,
    orderBy='startTime'
).execute()
events = events_result.get('items', [])

for event in events:
    start = event['start'].get('dateTime', event['start'].get('date'))
    print(start, event['summary'])

```


## Fontes:
 
 https://developers.google.com/workspace/calendar/api/quickstart/python?hl=pt-br
 
 
