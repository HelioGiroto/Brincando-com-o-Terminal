hxnormalize -x http://72.55.164.118:8566 | hxselect -c "div:nth-child(4) table tr:nth-child(6) td.streamstats"; echo  
#ou:
hxnormalize -x http://72.55.164.118:8566 | hxselect -s'\n' -c "div:nth-child(4) table tr:nth-child(6) td.streamstats"



# radio
