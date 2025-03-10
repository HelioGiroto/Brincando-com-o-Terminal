# Exemplos de uso do lynx, curl e html-utils em scrapping com Bash:

- pega palavra no site do jornal:
`lynx -dump https://www.folha.uol.com.br | grep -ic 'pix*'`

- pega todos os links dos estados:
`lynx -listonly -dump -nonumbers https://www.prensaescrita.com/portugues/brasil.php | grep '/portugues/' >> jornais.md`

- pega todos os links de jornais de todos os estados:
`for link in $(cat jornais.tmp); do lynx -listonly -dump -nonumbers $link | grep -vi 'prensaescrita' >> jornaisLista.md; done`

- pega todos os links de guiademidia...:
`lynx -listonly -dump -nonumbers https://www.guiademidia.com.br/jornais-brasileiros.htm | grep -i 'jornais'`


- procura termo dentro de uma lista de sites: 
`for ARQ in $(cat lista_sites.txt); do echo $ARQ; curl -s $ARQ | grep -ic 'termo'; done`


Aqui se deve usar o hxselect para pegar apenas links de dentro de td's:
`hxnormalize -x https://www.guiademidia.com.br/jornaisdoacre.htm | hxselect -c 'td' | hxref -x`

- Código certo:
`hxnormalize -x https://www.guiademidia.com.br/jornaisdoacre.htm | hxselect -c 'td'| hxwls | sort -u | grep 'http.*' | grep -v 'guiademidia'`

## Código correto:
_(Captura todos os links de um site)_

``` bash
# todos os links acima cola num arquivo chamado guiademidia.txt:

for url in $(cat guiademidia.txt); do hxnormalize -x $url | hxselect -c 'td'| hxwls | sort -u | grep 'http.*' | grep -v 'guiademidia' | tee -a 5000links.txt; done

```

### ok

```javascript 

	// uma vez aberto uma das urls acima:
	zz = document.querySelectorAll('tr td a');
	lista =[];
	zz.forEach(a=>lista.push(a.href));
	copy(lista);

```


`lynx -dump -nolist "https://www.olivetree.com/bible/?query=Genesis.2&version=RVR1960" | sed -n '/^[^ ]/d; /^$/d; / \[Reina/,/ \* /p' | sed 's/   //g; /^  */d; /^\[/d; s/\^(.)//g; s/\^\[.\]//g' | tr '\n' ' ' | sed -r 's/\^/\n/g; s/  / /g'













