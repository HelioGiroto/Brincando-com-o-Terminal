#!/bin/bash

# Como calcular o número de dias entre duas datas:

# Entre hoje e um dia no passado:
# echo $(( ($(date +%s) - $(date --date="20180101" +%s)) / (60*60*24) ))
# ou
# echo $(( ($(date +%s) - $(date -d "20180101" +%s)) / (60*60*24) ))

# Entre duas datas - A mais atual menos a mais passada (Retorna o número de dias)::
# echo $(( ($(date --date="20130101" +%s) - $(date --date="20000101" +%s)) / (60*60*24) ))

# Pega a data de modificação do arquivo sismos5+ e converte em segundos linux:
anterior=$( date -r sismos5+ +%s )

# Transforma tb a data de hoje em epoch (tempo linux) - segundos:
hoje=$( date +%s )


# Como converter data epoch em data comúm:
# date -d @1518223872



# Calcula o dia atual (em segundos linux) MENOS a data $anterior:
periodo=$( echo $(( ($hoje - $anterior) / (60*60*24) +2 )) )			# o número 2 no final indica uma margem de 2 dias a mais.


# Forma (concatena) a URL para scrapear os dados do periodo em que o arquivo sismos5+ não foi atualizado:
# Ex. de URL:   https://earthquake.usgs.gov/fdsnws/event/1/query?format=text&minmagnitude=5&starttime=-7days

curl -sX GET 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=text&minmagnitude=5&starttime=-'$periodo'days' | awk -F'|' '{print $2 "|" $11 "|" $9 "|" $13}' | sed '1d; s/T/|/'



# Fonte: https://stackoverflow.com/questions/4946785/how-to-find-the-difference-in-days-between-two-dates#6948865






