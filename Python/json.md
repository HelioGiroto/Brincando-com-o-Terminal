# BIBLIOTECA JSON

Uma biblioteca para Python que manipula arquivos JSON.


## Abrir um arquivo JSON existente:

_Método load()_ - Carrega conteúdo do arquivo.

Obviamentem que o método `load()` sempre vem com o `open()` em modo `"r"`:

```python 
# abre o arquivo para leitura e carrega o json:
with open("arquivo.json", "r", encoding="utf-8") as arquivo:
	conteudo = json.load(arquivo)

print(conteudo)
```



## Criar um arquivo JSON (a partir de um(a) [lista de] dicionário(s)):

_Método dump()_ - Converte um dicionário em Python em um arquivo JSON:

```python
# importa a biblioteca:
import json

# uma lista de dicionários python:
clientes = [
    {"nome": "Ana", "doc": "123", "nasc": "12/03/1995"},
    {"nome": "Bruno", "doc": "456", "nasc": "28/10/1980"},
    {"nome": "Carla", "doc": "789", "nasc": "01/01/2000"}
]

# abre arquivo clientes.json para gravar:
with open("clientes.json", "w", encoding="utf-8") as arquivo:
	json.dump(clientes, arquivo, indent=4, ensure_ascii=False)

# mensagem final:
print("Arquivo JSON criado com sucesso!")
```

---

### 🧠 Explicando:

✔ `json.dump(objeto, arquivo)`

Grava o conteúdo dentro do arquivo JSON.

✔ `indent=4`

Deixa o JSON bonito e identado (fácil de ler).

✔ `ensure_ascii=False`

Permite acentos e caracteres especiais sem virar unicode (\u00e1 etc.).

✔ `with open(...)`

Abre o arquivo e fecha automaticamente depois.

---

## Atualizar um arquivo JSON existente com mais dados

⚠️ JSON não suporta append direto como arquivo texto. Ou seja, **nunca abra um arquivo JSON em modo "a"**. 

Mas, o que funciona é:

1- Ler o JSON inteiro

2- Converter para objeto Python ([lista de] dicionários) 

3- Modificar a lista (append na lista de dicionários)

4- Gravar tudo de novo, _reescrevendo_.


```python
import json
from pathlib import Path

arquivo = Path("dados.json")

novo_registro = {
    "empresa": "Star Light",
    "instagram": "https://instagram.com/starstarstar"
}

# 1️⃣ Ler o JSON existente
if arquivo.exists():
    with arquivo.open("r", encoding="utf-8") as f:
        dados = json.load(f)
else:
    dados = []

# 2️⃣ Garantir que seja uma lista
if not isinstance(dados, list):
    raise ValueError("O JSON não contém uma lista")

# 3️⃣ Append
dados.append(novo_registro)

# 4️⃣ Gravar novamente
with arquivo.open("w", encoding="utf-8") as f:
    json.dump(dados, f, ensure_ascii=False, indent=2)

```












