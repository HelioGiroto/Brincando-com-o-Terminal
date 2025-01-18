# executa sed e extrai apenas conteudo entre frases

## exibe todo o texto que está entre "x" e "z"
sed -n "/x/,/z/p"


lynx --nolist --dump https://comexdobrasil.com/porto-de-santos-devera-movimentar-180-milhoes-de-toneladas-este-ano-diz-presidente-da-aps/ | sed -n "/Da Redação/,/Com informações da Autoridade Portuária de Santos/p" 


Fonte: 
https://stackoverflow.com/questions/3434462/print-lines-in-file-from-the-match-line-until-end-of-file
https://unix.stackexchange.com/questions/78472/print-lines-between-start-and-end-using-sed



---

## Operating in a pattern range except for the patterns

(substitui um trecho de todo o texto):

You may remember that I mentioned you can do a substitute on a pattern range, like changing "old" to "new" between a begin/end pattern:

```

#!/bin/sh
sed '
	/begin/,/end/ s/old/new/
'
Another way to write this is to use the curly braces for grouping:

#!/bin/sh
sed '
	/begin/,/end/ {
	    s/old/new/
	}
'
```

Ou substitui desde a 1a linha até o padrao final:

`sed '1,/padrao_final/ {s/.*/blablabla/}' file` 


Ou deleta do inicio ao final do padrao:
`sed "/inicio/,/final/d" file`


- fonte: https://www.grymoire.com/Unix/Sed.html#uh-35a

