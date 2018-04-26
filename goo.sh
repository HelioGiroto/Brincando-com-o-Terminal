#!/bin/sh

q=""
i=0
for var in "$@"
do
   if [ "$i" -eq "0" ]; then
      q+=$var
   else
      q+="+"$var
   fi
i+=1
done
echo "googling $q ...."
curl -s -A Mozilla http://www.google.com/search?q=$q -o temp.html
hxnormalize -l 240 -x temp.html 2>/dev/null | \
hxselect -s '\n' -c 'li.g' | \
hxselect -s '\n' -c 'h3.r' | \
hxselect -s '\n********\n' -c 'a' | \
html2text -width 100 > midResult.txt

OIFS=$IFS
IFS='********'
while read line
do
   printf "\n%s" $line
done < midResult.txt

# rm midResult.txt
# rm temp.html
IFS=$OIFS


# -------------------------------------------------------


# Fazer laço que abre várias páginas --> [ &start=(DE 0 A 90 - DE 10 EM 10) ] - seq 0 10 90 :
# https://www.google.com/search?q=esperanza&start=10

# primeiro baixa a página:
# 1006  # curl -s -A Mozilla http://www.google.com/search?q=alegria | iconv -f iso8859-1 -t utf-8 > temp.html # OK - baixar com curl usando utf-8 (acentos) 

# Segundo: Extrai apenas o BODY da página:
# 1017  sed -n '/<body /,/<\/body>/p' temp.html > temp2.html  # OK

# Terceiro: Extrai os links da busca:
# 1019  hxnormalize -x -i0 -l1000 temp2.html | hxselect -s'\n' -c 'h3.r' | hxunent | grep -o 'http.*"' | sed 's/&sa.*//'  # OK

# Quarto: Extrai o texto de cada item na busca:
# 1024  hxnormalize -x -i0 -l1000 temp2.html | hxselect -s'\n\n' -c 'span.st' | hxunent # OK

# -------------------------------------------------------





# https://raw.githubusercontent.com/sotw/hmDictUtils/fe66c5098f45bad7a11cc98a92886860d8ab6b95/googleBak
# https://www.google.com/search?q=esperanza&ei=XhvhWuiEKcKswgSa67OQAw&start=10&sa=N&biw=1211&bih=614

# https://www.google.com/search?q=esperanza
# https://www.google.com/search?q=esperanza&start=10
# https://www.google.com/search?q=esperanza&start=20 

# curl URL | iconv -f iso8859-1 -t utf-8 > output.xml
# curl -s -A Mozilla http://www.google.com/search?q=alegria | iconv -f iso8859-1 -t utf-8 > temp.html
# h@lenovo:~$ history | grep OK
#  979  hxnormalize -x -i0 -l1000 temp.html | hxselect -s'\n' -c 'h3.r' | hxunent | grep -o 'http.*"' | tr '"' ' ' # OK
#  982  hxnormalize -x -i0 -l1000 temp.html | hxselect -s'\n' -c 'span.st' | hxunent # OK
#  983  curl -s -A Mozilla http://www.google.com/search?q=esperança -o temp.html # OK
# 1005  history | grep OK
# 1008  hxnormalize -x -i0 -l1000 temp.html | hxselect -s'\n' -c 'h3.r' | hxunent | grep -o 'http.*"' | tr '"' ' ' # OK
# 1012  sed -i 's/>/>\n/g' temp.html # OK
# 1013  hxnormalize -x -i0 -l1000 temp.html | hxselect -s'\n' -c 'h3.r' | hxunent | grep -o 'http.*"' | tr '"' ' ' # OK






