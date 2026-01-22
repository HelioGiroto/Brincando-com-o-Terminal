# 📊 Tutorial Completo da Biblioteca **Pandas** (Python)

## 1️⃣ O que é o Pandas?

**Pandas** é uma **biblioteca do Python** usada para:

* Ler dados (Excel, CSV, bancos de dados, JSON etc.)
* Organizar dados em formato de tabelas
* Limpar dados “bagunçados”
* Filtrar, agrupar e resumir informações
* Preparar dados para relatórios, gráficos e análises

👉 Em termos simples:
**Pandas transforma dados brutos em dados organizados e fáceis de analisar.**

---

## 2️⃣ Para que o Pandas é usado na prática?

Alguns exemplos reais:

* 📦 Comércio exterior: analisar planilhas de importação/exportação
* 📈 Relatórios de vendas
* 🧾 Leitura de arquivos CSV e Excel
* 🧮 Cálculo de totais, médias, somas
* 🧹 Limpeza de dados com erros ou campos vazios

Se você já trabalhou com **Excel**, o Pandas faz algo parecido — **só que com muito mais poder**.

---

## 3️⃣ Instalação do Pandas

No terminal (Linux / macOS / Windows):

```bash
pip install pandas
```

Depois, no Python:

```python
import pandas as pd
```

> 📌 Por convenção, o Pandas sempre é importado como `pd`.

---

## 4️⃣ Estruturas principais do Pandas

O Pandas trabalha basicamente com **duas estruturas de dados**:

### 🔹 1. Series

Uma **coluna de dados**, como uma lista com rótulos.

```python
import pandas as pd

idades = pd.Series([25, 30, 35])
print(idades)
```

Resultado:

```
0    25
1    30
2    35
dtype: int64
```

📌 Pense em uma **única coluna do Excel**.

---

### 🔹 2. DataFrame (a mais importante)

Um **DataFrame** é uma **tabela** (linhas e colunas).

```python
dados = {
    "Nome": ["Ana", "Bruno", "Carlos"],
    "Idade": [25, 30, 35],
    "Cidade": ["SP", "RJ", "BH"]
}

df = pd.DataFrame(dados)
print(df)
```

Resultado:

```
     Nome  Idade Cidade
0     Ana     25     SP
1   Bruno     30     RJ
2  Carlos     35     BH
```

📌 Pense em um **Excel completo** dentro do Python.

---

## 5️⃣ Lendo arquivos (CSV, Excel)

### 📄 Ler um CSV

```python
df = pd.read_csv("arquivo.csv")
```

### 📊 Ler um Excel

```python
df = pd.read_excel("arquivo.xlsx")
```

### 👀 Visualizar os dados

```python
df.head()   # primeiras 5 linhas
df.tail()   # últimas 5 linhas
```

---

## 6️⃣ Informações básicas sobre os dados

```python
df.info()      # estrutura geral
df.shape       # (linhas, colunas)
df.columns     # nomes das colunas
df.dtypes      # tipos de dados
```

Exemplo:

```python
print(df.shape)
```

Saída:

```
(100, 5)
```

➡️ 100 linhas e 5 colunas

---

## 7️⃣ Selecionando dados

### 🔹 Selecionar uma coluna

```python
df["Nome"]
```

### 🔹 Selecionar várias colunas

```python
df[["Nome", "Idade"]]
```

---

### 🔹 Selecionar linhas (por índice)

```python
df.loc[0]      # linha pelo rótulo
df.iloc[0]     # linha pela posição
```

---

### 🔹 Selecionar linhas com condição

```python
df[df["Idade"] > 30]
```

📌 Isso é como um **filtro no Excel**.

---

## 8️⃣ Operações matemáticas comuns

```python
df["Idade"].mean()   # média
df["Idade"].sum()    # soma
df["Idade"].max()    # maior valor
df["Idade"].min()    # menor valor
```

---

## 9️⃣ Criando e alterando colunas

### ➕ Criar nova coluna

```python
df["Idade_em_10_anos"] = df["Idade"] + 10
```

---

### ✏️ Alterar valores

```python
df["Cidade"] = df["Cidade"].str.upper()
```

---

## 🔟 Dados ausentes (NaN)

### 🔍 Ver valores vazios

```python
df.isnull()
df.isnull().sum()
```

---

### 🧹 Remover linhas com valores vazios

```python
df.dropna()
```

---

### ✍️ Preencher valores vazios

```python
df.fillna(0)
```

---

## 1️⃣1️⃣ Ordenação

```python
df.sort_values("Idade")
df.sort_values("Idade", ascending=False)
```

---

## 1️⃣2️⃣ Agrupamento (groupby)

Muito usado em relatórios.

```python
df.groupby("Cidade")["Idade"].mean()
```

📌 Exemplo prático:

> Média de idade por cidade

---

## 1️⃣3️⃣ Salvando dados

### 💾 Salvar CSV

```python
df.to_csv("novo_arquivo.csv", index=False)
```

### 💾 Salvar Excel

```python
df.to_excel("novo_arquivo.xlsx", index=False)
```

---

## 1️⃣4️⃣ Pandas + NumPy + Excel (conceito importante)

* **Pandas** → tabelas e dados estruturados
* **NumPy** → cálculos matemáticos
* **Excel** → origem ou destino dos dados

📌 Pandas é a **ponte** entre dados brutos e análise.

---

## 1️⃣5️⃣ Fluxo mental para usar Pandas

Sempre pense assim:

1. 📥 Carregar os dados
2. 👀 Entender a estrutura (`info`, `head`)
3. 🧹 Limpar dados
4. 🔍 Filtrar / agrupar
5. 📊 Analisar
6. 💾 Salvar ou gerar relatório

---

## 1️⃣6️⃣ Resumo rápido

| Conceito   | O que é          |
| ---------- | ---------------- |
| Series     | Uma coluna       |
| DataFrame  | Uma tabela       |
| read_csv   | Lê CSV           |
| read_excel | Lê Excel         |
| head()     | Visualiza dados  |
| groupby    | Agrupa dados     |
| loc / iloc | Seleciona linhas |
| to_csv     | Salva arquivo    |

---

