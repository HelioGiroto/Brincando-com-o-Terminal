# BÁSICO DO REGEX E SED

## 
(No grep se requer flag -E)

{0,1}	?	OPCIONAL
{1, }	+	1 OU MAIS (INFINITO)
{0. }	*	0 OU MAIS (INFINITO)


## [ CLASSES ]

Os caracteres que estejam entre colchetes são todos opcionais.

[0-9]		QUALQUER DÍGITO ENTRE 0 A 9. O MESMO QUE \d.
[a-Z]		DE a (MINÚSCULO) A Z (MAIÚSCULO).
[AB]		OU A (APENAS) OU B (APENAS).
[CLASSE]	PODE SER APENAS UMA LETRA: C-L-A-S-E. SERIA O MESMO QUE (C|L|A|S|E).

* [Classes] somente aceitam caracteres individuais (i.é, não se aceita (grupos) dentro de [classes]).


## ( GRUPOS )
(No grep se requer flag -E)

Obtem a ocorrência que está entre parêntesis. 

(\d\d\d)-(\d\d\d\d)-(\d\d\d\d)		CAPTURARIA ALGO COMO 011-9000-1230.
(a|o)lho				CAPTURA alho E olho. O MESMO QUE [ao]lho

* Dentro de (grupos) se aceita usar [classes].


## 



