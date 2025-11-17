#  SORT

- Exemplo de arquivo csv:

```csv
João;10/10/1998;M;Programador;6000
Maria da Rua;01/12/2001;F;Contadora;7000
Pedro;15/04/1995;M;Diretor;10000
Ana;03/março/2000;F;Analista;4500
Lucia;23/Março/1999;F;'Recepcionistas';3100
José;25/12/2003;M;Auxiliar;2000
Iara;01/01/2010;F;Aprendiz;500
```

- Ordena em ordem alfabética - a partir da primeira coluna:
` sort arq.csv `


- Para ordenar numéricamente a partir da coluna 5 - ordem crescente:
` sort -n -t';' -k5 arq.csv `


- Para ordenar numéricamente a partir da coluna 5 - ordem decrescente:
` sort -nr -t';' -k5 arq.csv `


- Ordena de forma randomica:

```
seq 10 | sort -R
sort -R arq.csv
```

(ver também comando `shuf`)
