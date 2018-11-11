# radio:
hxnormalize -x http://72.55.164.118:8566 | hxselect -c "div:nth-child(4) table tr:nth-child(6) td.streamstats"; echo  
#ou:
hxnormalize -x http://72.55.164.118:8566 | hxselect -s'\n' -c "div:nth-child(4) table tr:nth-child(6) td.streamstats"

#Pixeluvo - preço:
hxnormalize -x -i0 https://store.steampowered.com/app/314500/Pixeluvo | hxselect -c -s'\n' "div.price" # pixeluvo pixelmator

# Sem mensagem de erros
hxnormalize -x -i0 https://store.steampowered.com/app/314500/Pixeluvo 2> /dev/null | hxselect -c -s'\n' "div.price" 2> /dev/null


# ultimos registros de audiencia - net:
sex nov 9 19:07:37 -02 2018;3;
sex nov 9 19:22:37 -02 2018;2;
sex nov 9 19:37:38 -02 2018;2;
sex nov 9 19:52:39 -02 2018;2;
sex nov 9 20:07:39 -02 2018;1;
sex nov 9 20:22:40 -02 2018;2;
sex nov 9 20:37:40 -02 2018;2;
sex nov 9 20:52:41 -02 2018;1;
sex nov 9 21:07:41 -02 2018;3;
sex nov 9 21:22:42 -02 2018;;
sáb nov 10 20:01:06 -02 2018;1;
sáb nov 10 20:16:07 -02 2018;2;
sáb nov 10 20:31:07 -02 2018;;
sáb nov 10 20:46:07 -02 2018;1;
sáb nov 10 21:01:07 -02 2018;2;
sáb nov 10 21:16:08 -02 2018;2;
