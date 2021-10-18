#!/bin/bash

# obtem o horário do site:

# curl "http://worldtimeapi.org/api/timezone/America/Sao_Paulo" | jq 


curl -s "http://worldtimeapi.org/api/timezone/America/Sao_Paulo" | jq .datetime

# "2021-09-23T18:26:45.857737-03:00"


curl -s "http://worldtimeapi.org/api/timezone/America/Sao_Paulo" | jq .datetime | cut -d'T' -f2 | cut -d'.' -f1

# 18:29:43





