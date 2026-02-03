# VENV - Ambientes virtuais em Python

## Resumo dos comandos:

```
# Mostra a versão do Python instalada no sistema
python --version

# Alternativa comum em Linux/macOS
python3 --version

# Entra no diretório do projeto
cd meu_projeto

# Cria um ambiente virtual chamado "venv" (Linux/macOS)
python3 -m venv venv

# Cria um ambiente virtual chamado "venv" (Windows)
python -m venv venv

# Ativa o ambiente virtual no Linux/macOS
source venv/bin/activate

# Ativa o ambiente virtual no Prompt de Comando (Windows)
venv\Scripts\activate

# Ativa o ambiente virtual no PowerShell (Windows)
venv\Scripts\Activate.ps1

# Instala um pacote dentro do ambiente virtual ativo
pip install nome_do_pacote

# Lista os pacotes instalados no ambiente virtual
pip list

# Lista pacotes e versões no formato requirements
pip freeze

# Salva todas as dependências do projeto em um arquivo
pip freeze > requirements.txt

# Instala todas as dependências listadas no arquivo
pip install -r requirements.txt

# Sai do ambiente virtual ativo
deactivate

# Remove a pasta do ambiente virtual (Linux/macOS)
rm -rf venv

# Remove a pasta do ambiente virtual (Windows)
rmdir /s /q venv

# Mostra o caminho do Python ativo (Linux/macOS)
which python

# Mostra o caminho do Python ativo (Windows)
where python

# Indicação visual de que o ambiente virtual está ativo
(venv)
```

---

# 📦 O que é `venv` no Python?

`venv` é um **módulo padrão do Python** usado para criar **ambientes virtuais**.

👉 Um **ambiente virtual** é uma pasta isolada que contém:

* Uma **cópia do Python**
* Suas **próprias bibliotecas**
* Suas **próprias versões de pacotes**

Ou seja:
✔️ Cada projeto pode ter suas próprias dependências
✔️ Evita conflitos entre versões
✔️ Não “polui” o Python do sistema

---

## 🧠 Por que usar ambiente virtual?

Imagine este cenário:

* Projeto A usa `requests==2.25`
* Projeto B usa `requests==2.31`

Sem `venv`, você **não consegue ter as duas versões ao mesmo tempo**.

Com `venv`:

* Cada projeto tem seu próprio ambiente
* As bibliotecas ficam isoladas
* Zero conflito 🎯

---

# 🛠️ Pré-requisitos

* Python **3.3 ou superior**
* Verifique se o Python está instalado:

```bash
python --version
```

ou

```bash
python3 --version
```

---

# 📁 Estrutura típica de um projeto com `venv`

```text
meu_projeto/
├── venv/
├── main.py
├── requirements.txt
```

* `venv/` → ambiente virtual
* `main.py` → seu código
* `requirements.txt` → dependências do projeto

---

# 🚀 Como criar um ambiente virtual com `venv`

## 1️⃣ Entre na pasta do projeto

```bash
cd meu_projeto
```

---

## 2️⃣ Crie o ambiente virtual

### Linux / macOS

```bash
python3 -m venv venv
```

### Windows

```bash
python -m venv venv
```

📌 Aqui:

* `venv` é apenas o nome da pasta (pode ser outro nome)

---

# ▶️ Como ativar o ambiente virtual

## Linux / macOS

```bash
source venv/bin/activate
```

## Windows (Prompt de Comando)

```bat
venv\Scripts\activate
```

## Windows (PowerShell)

```powershell
venv\Scripts\Activate.ps1
```

---

### ✅ Como saber se está ativado?

O terminal muda para algo como:

```text
(venv) usuario@computador:~/meu_projeto$
```

O `(venv)` indica que **o ambiente virtual está ativo**.

---

# 📦 Instalando pacotes dentro do `venv`

Com o ambiente **ativado**, use `pip` normalmente:

```bash
pip install requests
```

📌 Importante:

* O pacote será instalado **somente dentro do venv**
* Não afeta outros projetos nem o Python do sistema

---

## Ver pacotes instalados

```bash
pip list
```

ou

```bash
pip freeze
```

---

# 📄 Criando o arquivo `requirements.txt`

Esse arquivo lista todas as dependências do projeto.

## Gerar automaticamente:

```bash
pip freeze > requirements.txt
```

Exemplo de conteúdo:

```text
requests==2.31.0
numpy==1.26.3
```

---

## Instalar dependências a partir do arquivo:

```bash
pip install -r requirements.txt
```

Muito usado quando:

* Você clona um projeto
* Envia o projeto para outra pessoa
* Faz deploy em servidor

---

# 📴 Como desativar o ambiente virtual

Simplesmente execute:

```bash
deactivate
```

O `(venv)` desaparecerá do terminal.

---

# 🗑️ Como remover um ambiente virtual

O `venv` é apenas uma pasta.

👉 Para apagar:

```bash
rm -rf venv      # Linux / macOS
```

ou no Windows:

```bat
rmdir /s /q venv
```

⚠️ Não apague se ainda precisar das dependências.

---

# ⚠️ Erros comuns e dicas importantes

### ❌ Esquecer de ativar o `venv`

Resultado:

* Pacotes são instalados no Python global

✅ Sempre confira se aparece `(venv)` no terminal

---

### ❌ Versionamento do `venv` no Git

Nunca versionar a pasta `venv`.

📄 `.gitignore` recomendado:

```text
venv/
```

---

### ✅ Use um `venv` por projeto

Boa prática profissional e padrão de mercado.

---

# 🔍 Comparação rápida

| Sem venv             | Com venv             |
| -------------------- | -------------------- |
| Conflitos de versões | Isolamento total     |
| Instala tudo global  | Projeto independente |
| Difícil manter       | Fácil reproduzir     |

---

# 🧠 Resumo final

* `venv` cria **ambientes isolados**
* Evita conflitos entre projetos
* É simples, nativo e recomendado
* Essencial para quem trabalha com Python profissionalmente

---


