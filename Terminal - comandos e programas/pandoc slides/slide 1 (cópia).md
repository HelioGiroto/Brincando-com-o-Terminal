---
title:
- Apresentação exemplo para pandoc
author:
- "Hélio Giroto"
date:
- Junho/2021
geometry:
- top=10mm
- bottom=10mm
- left=30mm
- right=10mm

---

# CAPA



# Slide 1	{#sec:slide1}
	- Frase 1 \pause
	- Frase 2 \pause
	- Frase 3 \pause
	- Frase 4

# Slide 2 {#sec:slide2}
 Conforme tabela 1 [@tbl:tab1]
 Conforme slide 1 [@sec:slide1]
 Conforme slide 3 [@sec:slide3]
 Conforme figura 1 [@fig:fig1]
 Conforme figura 2 [@fig:fig2]

# Slide 3 {#sec:slide3}

Tabelas

| Nome | Tipo | Nro |
|---|---|---|
| João | Aluno | 1200 |
| Maria | Aluno | 5000 |
| Antônia | Professora | 200 |

: Tabela da escola {#tbl:tab1}

ver [link][link4]

Volta para slide 2 [@sec:slide2]

# Slide 4 {#sec:slide4}

Figuras

![Fig 1](fig1.jpg){#fig:fig1}


# Slide 5 {#sec:slide5}

![Fig 2](fig2.jpg){#fig:fig2}

# Slide 6 
---------------------------------------
Número   Tipo     Itens para
da vaga  da aula  análise
-------- -------- ---------------------
Primeiro Obrigat. Exemplo de máquinas
                  usadas na contrução.

Segundo  Opcional Convivência no
                  campus com os demais
---------------------------------------

:Exemplo de mais uma tabela {#tab:tab2}


\listoffigures
\listoftables


[link4]:https://github.com/HelioGiroto
