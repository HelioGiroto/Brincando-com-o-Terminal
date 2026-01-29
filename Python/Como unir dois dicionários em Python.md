# Como unir dois dicionários em Python:

## Usando operador de união:

```python
d1 = {'a': 1, 'b': 2}
d2 = {'b': 3, 'c': 4}
resultado = d1 | d2
# Resultado: {'a': 1, 'b': 3, 'c': 4}
```

## Com operador de desempacotamento:

```python
d1 = {'a': 1, 'b': 2}
d2 = {'b': 3, 'c': 4}
resultado = {**d1, **d2}
# Resultado: {'a': 1, 'b': 3, 'c': 4}
```

## Usando o método `update()`:

```python
d1 = {'a': 1, 'b': 2}
d2 = {'b': 3, 'c': 4}
d1.update(d2)
# d1 agora é: {'a': 1, 'b': 3, 'c': 4}
```



