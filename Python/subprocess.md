# Subprocess

A biblioteca **`subprocess`** do Python permite **executar e controlar processos externos** a partir de um script, como comandos do sistema operacional, oferecendo controle sobre **entrada (stdin), saída (stdout), erros (stderr) e código de retorno (returncode)**; é a forma **moderna e segura** de interação com o sistema, substituindo `os.system`, e é muito usada em **automação e scripts profissionais** em Linux e Windows.

Atenção: a biblioteca `os.system` é uma biblioteca obsoleta e insegura atualmente.


É preciso usar o parâmetro `capture_output=True` e `text=True` caso queira guardar os valores do comando (método `run()`).

```python
import subprocess
diretorio = subprocess.run(['pwd'], capture_output=True, text=True)

print (diretorio.stdout)	# '/home/mkt\n'
print (diretorio.stderr)	# ''
print (diretorio.returncode)	# 0
```


- Para listar arquivos do atual diretório:

```python
import subprocess
arquivos = subprocess.run(['ls'], capture_output=True, text=True)

# para imprimir com quebra de linha:
[print(el) for el in arquivos.stdout.split('\n')]
```


- Para listar arquivos com uma extensão:

```python
import subprocess

resultado = subprocess.run(
    "ls *.png | grep logo",
    shell=True,
    capture_output=True,
    text=True
)

print(resultado.stdout)
```

O parâmetro `shell=True` só é recomendado em último caso, porque é arriscado por motivos de segurança. Salvo se o usuário não entrar com nenhum input para dentro do código que manipula os arquivos. 

Porém, se o comando Bash terá extensões ou o pipe ('|'), e não há outra forma com `glob` ou `os` ou `shutil`, por exemplo, a forma é usar `subprocess` e `shell=True` com precaução. 


- Para executar outro script Python:

```python
import subprocess
subprocess.run(['python3', 'calcula_imposto.py'])

# no Windows:
subprocess.run(['python', 'calcula_imposto.py']) 
```


### Diferenças no Windows em relação ao Linux

Pelo fato de ter diferenças na sintaxe dos comandos dos sistemas operacionais, a sintaxe do subprocess muda conforme o sistema:

```python
# deletar arquivos:
subprocess.run(["rm", "arquivo.txt"])
subprocess.run(["cmd", "/c", "del arquivo.txt"])

# copiar arquivos:
subprocess.run(["cp", "arquivo.txt", "backup/"])
subprocess.run(["cmd", "/c", "copy arquivo.txt backup\\"])

# criar diretórios:
subprocess.run(["mkdir", "nova_pasta"])
subprocess.run(["cmd", "/c", "mkdir nova_pasta"])

# listar arquivos:
subprocess.run(["ls", "-l"], capture_output=True, text=True)
subprocess.run(["cmd", "/c", "dir"], capture_output=True, text=True)

# renomear arquivos:
subprocess.run(['mv', 'arq1.txt', 'arq2.txt'])
subprocess.run(['ren', 'arq1.txt', 'arq2.txt'], shell=True)
```

Para executar tanto para os dois sistemas:

```python
import subprocess
import platform

sistema = platform.system()

if sistema == "Linux":
    comando = ["ls", "-l"]
elif sistema == "Windows":
    comando = ["cmd", "/c", "dir"]
else:
    raise Exception("Sistema não suportado")

resultado = subprocess.run(
    comando,
    capture_output=True,
    text=True
)

print(resultado.stdout)
```




'''
import glob

arquivos_png = glob.glob("*.png")
print(arquivos_png)

'''




Notas:  https://chatgpt.com/c/6970ce43-d09c-8328-bece-caae666c93b3

Biblioteca mais simples:
from pathlib import Path
