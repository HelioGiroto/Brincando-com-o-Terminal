# OBSERVAÇÕES IMPORTANTES SOBRE OS COMANDOS AWK E SORT 

## Temos o arquivo bairros.csv (tipo Planilha) dessa forma (head...):

CAMPOS: 
```
Bairro; População; Área (Km2):
Água Rasa;84963;6.9
Alto de Pinheiros;43117;7.7
Anhanguera;65859;33.3
Aricanduva;89622;6.6
Artur Alvim;105269;6.6
Barra Funda;14383;5.6
Bela Vista;69460;2.6
Belém;45057;6
Bom Retiro;33892;4
Brás;29265;3.5
```
---

## 1. COMO CALCULAR CAMPOS DE CADA REGISTRO NO AWK COM NÚMEROS (VALORES) DECIMAIS

**Como podemos agregar um novo CAMPO (coluna) com o cálculo da densidade (Hab/Km2) ??.**

Assim:

` awk -F';' '{dens=$2/$3; print $1 ";" $2 ";" $3 ";" dens}' bairros.csv `

- Resultado:
```
Água Rasa;84963;6.9;12313.5
Alto de Pinheiros;43117;7.7;5599.61
Anhanguera;65859;33.3;1977.75
Aricanduva;89622;6.6;13579.1
Artur Alvim;105269;6.6;15949.8
Barra Funda;14383;5.6;2568.39
Bela Vista;69460;2.6;26715.4
Belém;45057;6;7509.5
Bom Retiro;33892;4;8473
Brás;29265;3.5;8361.43
```

- A 4a. COLUNA (acima) se refere à Densidade demográfica!

IMPORTANTE: O AWK somente calcula números decimais (com ponto flutuante) se for ponto (em vez de vírgula - como usamos no BR para centavos)!!!

Se usarmos valores com vírgula o AWK não calculará corretamente.

Suponhamos agora que o arquivo bairros.csv contenha os dados acima mostrados (i.é, com o campo densidade)...

---

## 2. COMO ORDENAMOS ESSA LISTA DE REGISTROS POR ORDEM DE NOME, OU DE POP., OU DE ÁREA, OU DE DENSIDADE:

Obs.: Se o seu sistema está em português/BR (o idioma) talvez seja necessário mudar o ponto flutuante de ponto para vírgula (no caso dos números decimais ou centavos)!!!

IMPORTANTE: O Comando SORT somente ordenará uma lista de números decimais se o ponto flutuante desses números esteja conforme o idioma do Sistema.

- Ordenar por Nome:

` sort bairros.csv | cat -n `

- Resultado:
```
     1	Água Rasa;84963;6.9;12313.5
     2	Alto de Pinheiros;43117;7.7;5599.61
     3	Anhanguera;65859;33.3;1977.75
     4	Aricanduva;89622;6.6;13579.1
     5	Artur Alvim;105269;6.6;15949.8
     6	Barra Funda;14383;5.6;2568.39
     7	Bela Vista;69460;2.6;26715.4
     8	Belém;45057;6;7509.5
     9	Bom Retiro;33892;4;8473
    10	Brás;29265;3.5;8361.43
```

- Ordenar por População (campo 2):
```
 sort -t';' -nk2 bairros.csv | cat -n    - Por ordem CRESCENTE
 sort -t';' -nrk2 bairros.csv | cat -n   - Por ordem DECRESCENTE
```

- Ordenar por Área (Campo 3):
` cat bairros.csv | tr '.' ',' | sort -t';' -nrk3 | cat -n `

- Ordenar por Densidade demográfica (Campo 4):
` cat bairros.csv | tr '.' ',' | sort -t';' -nrk4 | cat -n `

Note que nos 2 últimos exemplos acima, foi necessário converter o ponto para vírgula para que o SORT ordenasse corretamente (no caso do Sistema esteja em Português/BR)

## Outros detalhes das sintaxes acima:
- SORT -t:  Serve para definir o Tabulador (delimitador)
- SORT -kn: Esse Kn seria o número do (K)ampo - ou para memorizar (K)oluna!!!
- CAT -n:   Apenas para estética! Coloca um Número de linhas.



Ver: 
` awk -F';' '{if ($6 == "C") { suma = suma + $5 }} END {printf "%.2f\n", suma}' *.txt `








