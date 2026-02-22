# Numba

A biblioteca **Numba** é uma ferramenta para Python que acelera código numérico usando compilação *Just-In-Time* (JIT). Em vez de rodar tudo de forma interpretada (mais lenta), ela traduz funções Python para código de máquina otimizado na hora da execução — muitas vezes deixando o desempenho próximo ao de C.

➡️ É um **acelerador de funções Python**, especialmente útil para:

* cálculos matemáticos pesados
* loops grandes
* processamento de arrays NumPy
* simulações e algoritmos científicos

```python
import time
from numba import njit

# Função normal (Python puro)
def soma_normal(n):
    total = 0
    for i in range(n):
        total += i
    return total


# Função acelerada com Numba
# @jit(nopython=True)
@njit
def soma_numba(n):
    total = 0
    for i in range(n):
        total += i
    return total


N = 500_000_000

# --- tempo sem Numba ---
inicio = time.time()
soma_normal(N)
fim = time.time()
print("Tempo sem Numba:", fim - inicio)
# Tempo sem Numba: 24.66140604019165

# --- primeira execução com Numba (inclui tempo de compilação) ---
inicio = time.time()
soma_numba(N)
fim = time.time()
print("Tempo Numba (compilando):", fim - inicio)
# Tempo Numba (compilando): 0.0005409717559814453

# --- segunda execução com Numba (já compilado) ---
inicio = time.time()
soma_numba(N)
fim = time.time()
print("Tempo Numba (otimizado):", fim - inicio)
```

📌 `@njit` = versão mais rápida (idêntico a *nopython*).

🎯 Quando usar

Use Numba quando:
✔ seu código é lento
✔ você usa muitos loops
✔ trabalha com números e arrays