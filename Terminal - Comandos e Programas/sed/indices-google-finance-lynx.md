# ÍNDICES ECONÔMICOS

https://www.google.com/finance/markets/most-active

https://www.google.com/finance/quote/TSLA34:BVMF?window=1Y

# Criptomoedas:
`lynx -nolist -dump https://www.google.com/finance/markets/cryptocurrencies | sed -n '/Google Finance/,/.*In the news/p'`

Nao: 
`lynx -nolist -dump https://www.google.com/finance/markets/cryptocurrencies | sed -n '/Google Finance/,/.*In the news/p' | head -n13 | sed '1d;/*/N;/(/N;/,/N;/./N;/%/N;s/\n//g'`

Uma só linha:
`lynx -nolist -dump https://www.google.com/finance/markets/cryptocurrencies | sed -n '/Google Finance/,/.*In the news/p' | sed '1d;/*/N;/(/N;/[0-9]/N;/[0-9]/N;/[0-9]/N;s/\n//g'`

Ou:
`lynx -nolist -dump https://www.google.com/finance/markets/cryptocurrencies | sed -n '/Google Finance/,/.*In the news/p' | sed '1d;/*/N;/*/N;/*/N;/*/N;/*/N;s/\n//g'`

Ou: 
`lynx -nolist -dump https://www.google.com/finance/markets/cryptocurrencies | sed -n '/Google Finance/,/.*In the news/p' | sed '1d;N;N;N;N;N;s/\n//g'`

Sem espaços e com ";":
`lynx -nolist -dump https://www.google.com/finance/markets/cryptocurrencies | sed -n '/Google Finance/,/.*In the news/p' | sed '1d;/*/N;/*/N;/*/N;/*/N;/*/N;s/\n/;/g; s/add_circle_outline//g; s/  \+/ /g'`

Sem espaços e última linha deletada: 
`lynx -nolist -dump https://www.google.com/finance/markets/cryptocurrencies | sed -n '/Google Finance/,/.*In the news/p' | sed '1d;N;N;N;N;N;s/\n/;/g; s/add_circle_outline//g; s/  \+//g;' | sed '$d'`

Idêntico ao de cima, mas mais legível:
`lynx -nolist -dump https://www.google.com/finance/markets/cryptocurrencies | sed -n '/Google Finance/,/.*In the news/p' | sed '1d;N;N;N;N;N;s/\n/;/g; s/add_circle_outline//g; s/  \+//g;' | head -n -2`


[The N command appends the next line to the pattern space (thus ensuring it contains two consecutive lines in every cycle).](https://www.gnu.org/software/sed/manual/sed.html)


# Rentáveis
## As principais ações ou fundos (por variação percentual) durante a sessão de negociação atual:
`lynx -dump -nolist https://www.google.com/finance/markets/gainers | sed -n '/.*trading session/,/.*In the news/p'`

`lynx -dump -nolist https://www.google.com/finance/markets/gainers | sed -n '/.*trading session/,/.*In the news/p' | sed '1d;N;N;N;N;N;s/\n/;/g; s/add_circle_outline//g; s/  \+//g;' | head -n -2`



# Menos rentáveis
## As ações ou fundos com pior desempenho (por variação percentual) durante a sessão de negociação atual:
`lynx -dump -nolist https://www.google.com/finance/markets/losers | sed -n '/.*trading session/,/.*In the news/p'`



