# RANDOM

- Função para gerar pausas de tempo aleatórias:

```
import random

def pausa(min=2, max=4):
	# Gera um número de ponto flutuante aleatório:
	espera = random.uniform(min, max)
	time.sleep(espera)

```


