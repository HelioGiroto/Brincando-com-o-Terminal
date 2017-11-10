#!/bin/bash

dia=$(date | awk '{print $3 $2 $6}')
nomearq="BBC_noticias_"$dia".txt"

date >> $nomearq
echo >> $nomearq


temperatura=$(hxnormalize -x https://www.climatempo.com.br/previsao-do-tempo/cidade/558/saopaulo-sp | hxselect -c p#momento-temperatura | sed 's/&.*//')

condicao=$(hxnormalize -x https://www.climatempo.com.br/previsao-do-tempo/cidade/558/saopaulo-sp | hxselect -c p#momento-condicao)


echo "Temperatura em Sao Paulo:" $temperatura "ºC" >> $nomearq
echo "Clima: " $condicao >> $nomearq
echo >> $nomearq


echo "******** NOTICIAS *********" >> $nomearq
echo >> $nomearq


echo TECNOLOGIA >> $nomearq; echo >> $nomearq
hxnormalize -x http://www.bbc.com/mundo/topics/31684f19-84d6-41f6-b033-7ae08098572a | hxselect -s'|' -c h3 span | tr "\n" " " | sed 's/&quot;/"/g ; s/  //g; s/|/\n\n/g' >> $nomearq
echo Tecnologia completado


echo CIENCIA >> $nomearq; echo >> $nomearq
hxnormalize -x http://www.bbc.com/mundo/topics/0f469e6a-d4a6-46f2-b727-2bd039cb6b53 | hxselect -s'|' -c h3 span | tr "\n" " " | sed 's/&quot;/"/g ; s/  //g; s/|/\n\n/g' >> $nomearq
echo Ciencia completado


echo INTERNACIONAL >> $nomearq; echo >> $nomearq
hxnormalize -x http://www.bbc.com/mundo/internacional | hxselect -s'|' -c h3 span | tr "\n" " " | sed 's/&quot;/"/g ; s/  //g; s/|/\n\n/g' >> $nomearq 
echo Internacional completado


echo; echo "---------------" >> $nomearq

cp $nomearq ~/Dropbox


# Instalar dropbox via terminal: https://www.dropbox.com/install
