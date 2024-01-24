#!/bin/bash
# Baixa o(s) último(s) episódio(s) do meu canal do Spreaker:
curl -s https://www.spreaker.com/user/8325705/episodes/feed | sed "s/url=/*/g" | tr '*' '\n' | grep -o 'https.*mp3' >> spreaker-episodios-baixados.txt
nao_baixado=$(sort spreaker-episodios-baixados.txt | uniq -u)
google-chrome $nao_baixado
