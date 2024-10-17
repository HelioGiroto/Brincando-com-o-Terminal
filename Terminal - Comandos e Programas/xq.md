# comando xq

Extrai dados de um arquivo XML

## Sintaxe e exemplos (no Terminal):

Exemplos aplicados num documento de NFe (Nota Fiscal eletrônica):

```bash
# captura as tags xProd (nome do Produto)
cat doc.xml | xq -x //xProd 

# faz o mesmo de acima, com nro de linha
cat doc.xml | xq -x //xProd  | cat -n

# Os 3 exemplos a seguir retornam (quase) ao mesmo resultado...
cat doc.xml | xq -x //imposto//ICMS//vICMS

# captura o 'vicms' apenas das tags 'det':
cat doc.xml | xq -x //det//vICMS

# este inclui um 16o. item (valor total dos icms):
cat doc.xml | xq -x //vICMS

# com nro de linhas/itens:
cat doc.xml | xq -x //det//vICMS | cat -n

# captura o valor dos produtos
cat doc.xml | xq -x //det//vProd | cat -n

# captura o valor dos produtos (com o total - 16o. item)
cat doc.xml | xq -x //vProd | cat -n

# conta quantas tags 'det' existem:
cat doc.xml | xq -x //det | wc -l
cat doc.xml | xq -x //prod | wc -l


##### EXEMPLOS MAIS COMPLEXOS:

# imprime o 1o elemento de tag 'det' 
# numa única linha
# mas sem delimitadores:
cat doc.xml | xq -x //det[1]

# o mesmo de cima
# em duas linhas (pq o elemento tem dois sub-elementos/filhos = prod e imposto)
# mas sem delimitadores:
cat doc.xml | xq -x //det[1]/*

# imprime o elemento-filho produto
# do 1o elemento
# (os campos/especificações deste produto)
# numa única linha
# mas sem delimitadores:
cat doc.xml | xq -x //det[1]/prod

# o mesmo de acima...
# mas cada campo numa linha (!!!):
# i. é, imprime todos os dados do 1o elemento:
cat doc.xml | xq -x //det[1]/prod/*

# qtos campos (dados de especificações) tem cada registro (=15):
cat doc.xml | xq -x //det[1]/prod/* | wc -l

# o mesmo de 2 acima...
# todos os campos do 1o. registro numa única linha 
# separados pelo delimitador ";":
cat doc.xml | xq -x //det[1]/prod/* | paste -sd ";"
cat doc.xml | xq -x //det[1]/prod/* | tr "\n" ";"

# obtem qtos produtos existem (ou quantas tags 'det'):
QTOS=$(cat doc.xml | xq -x //det | wc -l )
QTOS=$(cat doc.xml | xq -x //prod | wc -l )


##### UM LAÇO E EXTRAIR DADOS DE TODOS OS PRODUTOS:

# faz o laço:
for CADA in $(seq $QTOS)
do 
	cat doc.xml | xq -x //det[$CADA]/prod/* | paste -sd ";"
	# com saida para planilha:
	# cat doc.xml | xq -x //det[$CADA]/prod/* | paste -sd ";" >> arq.csv
	# cat doc.xml | xq -x //det[$CADA]/prod/* | tr '\n' ';' >> arq.csv
done

# Ao abrir a planilha CSV, é possivel que alguma linha -
# não esteja com o nro de colunas identico ao das demais,
# porém isso é devido que alguns produtos na NFe -
# não possuem o mesmo nro de tags (campos/especificações).
# Nesse caso, se pode corrigir fácilmente na planilha de forma manual



#### PARA EXTRAIR OS IMPOSTOS

# Veja os dados (cada registro numa linha) mas sem separador de campos:
cat doc.xml | xq -x //imposto

# Solução opcional: Imprimir com os campos na vertical (apenas o 1o registro):
cat doc.xml | xq -x //det[1]//imposto/*/*/*

# Solução (apenas o 1o registro):
cat doc.xml | xq -x //det[1]//imposto/*/*/* | paste -sd";"

# Ou (melhor):
cat doc.xml | xq -x //det[1]//imposto/*/*/* | xargs | sed 's/ /;/g'


# Extração mais detalhada:
cat doc.xml | xq -x //det[1]//ICMS/*/* | paste -sd ';'
cat doc.xml | xq -x //det[1]//IPI/*/* | paste -sd ';'
cat doc.xml | xq -x //det[1]//II/* | paste -sd ';'
cat doc.xml | xq -x //det[1]//PIS/*/* | paste -sd ';'
cat doc.xml | xq -x //det[1]//COFINS/*/* | paste -sd ';'

```

## Sintetizando num único arquivo:

Em um único script, converte uma NFe numa planilha com os campos de cada produto e seus impostos:

```bash

#!/bin/bash

# obtem a data:
DATA=$(cat doc.xml | xq -x //dhEmi | cut -d'T' -f1)

# define quantos produtos na NFe:
QTOS=$(cat doc.xml | xq -x //prod | wc -l)

for CADA in $(seq $QTOS)
do 
	# obtem os dados de cada:
	PROD=$(cat doc.xml | xq -x //det[$CADA]/prod/* | paste -sd ";")
	ICMS=$(cat doc.xml | xq -x //det[$CADA]//ICMS/*/* | paste -sd ';')
	IPI=$(cat doc.xml | xq -x //det[$CADA]//IPI/*/* | paste -sd ';')
	II=$(cat doc.xml | xq -x //det[$CADA]//II/* | paste -sd ';')
	PIS=$(cat doc.xml | xq -x //det[$CADA]//PIS/*/* | paste -sd ';')
	COFINS=$(cat doc.xml | xq -x //det[$CADA]//COFINS/*/* | paste -sd ';')
	
	# com saida para planilha:
	echo "$DATA;$PROD;$ICMS;$IPI;$II;$PIS;$COFINS" >> planilha.csv
done

```

## Como extrair os nomes de todas as tags de um documento XML 

### No Terminal Linux:

Sem `uniq`:

`xmlstarlet elements -v doc.xml`

Com `uniq`:

`xmlstarlet elements -u doc.xml`

Ou:

`xmlstarlet el -u doc.xml`

Resultado de um exemplo retirado de uma NFe.xml:

```txt
...
nfeProc/NFe/infNFe/det/prod
nfeProc/NFe/infNFe/det/prod/CEST
nfeProc/NFe/infNFe/det/prod/CFOP
nfeProc/NFe/infNFe/det/prod/NCM
nfeProc/NFe/infNFe/det/prod/cEAN
nfeProc/NFe/infNFe/det/prod/cEANTrib
nfeProc/NFe/infNFe/det/prod/cProd
nfeProc/NFe/infNFe/det/prod/indTot
nfeProc/NFe/infNFe/det/prod/qCom
nfeProc/NFe/infNFe/det/prod/qTrib
nfeProc/NFe/infNFe/det/prod/uCom
nfeProc/NFe/infNFe/det/prod/uTrib
nfeProc/NFe/infNFe/det/prod/vProd
nfeProc/NFe/infNFe/det/prod/vUnCom
nfeProc/NFe/infNFe/det/prod/vUnTrib
nfeProc/NFe/infNFe/det/prod/xProd
...
```

### No Navegador com Javascript:

*(Pode-se criar um Bookmarklet para isso)*

- Abrir o XML no navegador
- Comandos no Console:

``` javascript
// obtem todas as tags
let tags = document.body.getElementsByTagName("*");

// cria lista vazia
let lista = [];

// itera todas as tags extraindo apenas o nome delas (sem valor)
for (tag of tags){lista.push(tag.tagName)};
 
// passa um comando "uniq"
let unique = [...new Set(lista)];

// copia para o clipboard
copy(unique)
```

Resultado:

```txt
["div", "nfeProc", "NFe", "infNFe", "ide", "cUF", "cNF", "natOp", "mod", "serie", "nNF", "dhEmi", "dhSaiEnt", "tpNF", "idDest", "cMunFG", "tpImp", "tpEmis", "cDV", "tpAmb", "finNFe", "indFinal", "indPres", "indIntermed", "procEmi", "verProc", "emit", "CNPJ", "xNome", "xFant", "enderEmit", "xLgr", "nro", "xBairro", "cMun", "xMun", "UF", "CEP", "cPais", "xPais", "fone", "IE", "CRT", "dest", "enderDest", "indIEDest", "autXML", "det", "prod", "cProd", "cEAN", "xProd", "NCM", "CEST", "CFOP", "uCom", "qCom", "vUnCom", "vProd", "cEANTrib", "uTrib", "qTrib", "vUnTrib", "indTot", "imposto", "ICMS", "ICMS00", "orig", "CST", "modBC", "vBC", "pICMS", "vICMS", "IPI", "cEnq", "IPITrib", "pIPI", "vIPI", "II", "vDespAdu", "vII", "vIOF", "PIS", "PISAliq", "pPIS", "vPIS", "COFINS", "COFINSAliq", "pCOFINS", "vCOFINS", "total", "ICMSTot", "vICMSDeson", "vFCP", "vBCST", "vST", "vFCPST", "vFCPSTRet", "vFrete", "vSeg", "vDesc", "vIPIDevol", "vOutro", "vNF", "transp", "modFrete", "transporta", "xEnder", "vol", "qVol", "esp", "pesoL", "pesoB", "cobr", "fat", "nFat", "vOrig", "vLiq", "dup", "nDup", "dVenc", "vDup", "pag", "detPag", "indPag", "tPag", "vPag", "infAdic", "infCpl", "infRespTec", "xContato", "email", "Signature", "SignedInfo", "CanonicalizationMethod", "SignatureMethod", "Reference", "Transforms", "Transform", "DigestMethod", "DigestValue", "SignatureValue", "KeyInfo", "X509Data", "X509Certificate", "protNFe", "infProt", "verAplic", "chNFe", "dhRecbto", "nProt", "digVal", "cStat", "xMotivo", "span", "br"]
```

---

### Exemplo de XML 

*(Valores fictícios)*

```xml
<det nItem="1">
	<prod>
		<cProd>11111</cProd>
		<cEAN>bla bla bla</cEAN>
		<xProd>Produto 001</xProd>
		<NCM>11111</NCM>
		<CEST>22222</CEST>
		<CFOP>3333</CFOP>
		<uCom>PECAS</uCom>
		<qCom>1000.0000</qCom>
		<vUnCom>1.1000</vUnCom>
		<vProd>350.50</vProd>
		<cEANTrib>blablabla</cEANTrib>
		<uTrib>PECAS</uTrib>
		<qTrib>1000.0000</qTrib>
		<vUnTrib>2.1234</vUnTrib>
		<indTot>1</indTot>
	</prod>
	<imposto>
		<ICMS>
			<ICMS00>
			<orig>1</orig>
			<CST>00</CST>
			<modBC>3</modBC>
			<vBC>350.50</vBC>
			<pICMS>4.00</pICMS>
			<vICMS>255.92</vICMS>
			</ICMS00>
		</ICMS>
		<IPI>
			<cEnq>999</cEnq>
			<IPITrib>
			<CST>50</CST>
			<vBC>350.50</vBC>
			<pIPI>5.00</pIPI>
			<vIPI>30</vIPI>
			</IPITrib>
		</IPI>
		<II>
			<vBC>350.50</vBC>
			<vDespAdu>0.00</vDespAdu>
			<vII>0.00</vII>
			<vIOF>0.00</vIOF>
		</II>
		<PIS>
			<PISAliq>
			<CST>01</CST>
			<vBC>350.50</vBC>
			<pPIS>1.65</pPIS>
			<vPIS>80</vPIS>
			</PISAliq>
		</PIS>
		<COFINS>
			<COFINSAliq>
			<CST>01</CST>
			<vBC>350.50</vBC>
			<pCOFINS>7.60</pCOFINS>
			<vCOFINS>1200</vCOFINS>
			</COFINSAliq>
		</COFINS>
	</imposto>
</det>

<det nItem="2">
	<prod>
		<cProd>22222</cProd>
		<cEAN>bla bla bla</cEAN>
		<xProd>Produto 002</xProd>
		<NCM>11111</NCM>
		<CEST>22222</CEST>
		<CFOP>3333</CFOP>
		<uCom>PECAS</uCom>
		<qCom>1000.0000</qCom>
		<vUnCom>1.1000</vUnCom>
		<vProd>500.50</vProd>
		<cEANTrib>blablabla</cEANTrib>
		<uTrib>PECAS</uTrib>
		<qTrib>1000.0000</qTrib>
		<vUnTrib>2.1234</vUnTrib>
		<indTot>1</indTot>
	</prod>
	<imposto>
		<ICMS>
			<ICMS00>
			<orig>1</orig>
			<CST>00</CST>
			<modBC>3</modBC>
			<vBC>500.50</vBC>
			<pICMS>4.00</pICMS>
			<vICMS>255.92</vICMS>
			</ICMS00>
		</ICMS>
		<IPI>
			<cEnq>999</cEnq>
			<IPITrib>
			<CST>50</CST>
			<vBC>500.50</vBC>
			<pIPI>5.00</pIPI>
			<vIPI>30</vIPI>
			</IPITrib>
		</IPI>
		<II>
			<vBC>500.50</vBC>
			<vDespAdu>0.00</vDespAdu>
			<vII>0.00</vII>
			<vIOF>0.00</vIOF>
		</II>
		<PIS>
			<PISAliq>
			<CST>01</CST>
			<vBC>500.50</vBC>
			<pPIS>1.65</pPIS>
			<vPIS>80</vPIS>
			</PISAliq>
		</PIS>
		<COFINS>
			<COFINSAliq>
			<CST>01</CST>
			<vBC>500.50</vBC>
			<pCOFINS>7.60</pCOFINS>
			<vCOFINS>1200</vCOFINS>
			</COFINSAliq>
		</COFINS>
	</imposto>
</det>
```


---

### Fontes:
	file:///home/helio/Downloads/NFe_001-000000019.xml
	https://en.wikipedia.org/wiki/XPath
	https://github.com/sibprogrammer/xq
	https://kislyuk.github.io/yq/
	https://duckduckgo.com/?q=jq+command+to+convert+a+xml+to+json&ia=web
	https://www.howtogeek.com/devops/how-to-convert-xml-to-json-on-the-command-line/
	https://stackoverflow.com/questions/73038301/is-it-possible-to-convert-from-json-or-yaml-to-xml-using-jq-yq-xq
	https://duckduckgo.com/?q=linux+command+xq+with+spaces+between+data&ia=web
	https://github.com/sibprogrammer/xq/blob/master/README.md


---

## Ver tb:

Comando `xmlstarlet`


