# comando xq

Extrai dados de um arquivo XML

## Sintaxe e exemplos (no Terminal):

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


```

## Extraindo os nomes de todas as tags de um documento XML (com Javascript):

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


## Exemplo:

Exemplo retirado de um NFe.xml:

``` txt
["div", "nfeProc", "NFe", "infNFe", "ide", "cUF", "cNF", "natOp", "mod", "serie", "nNF", "dhEmi", "dhSaiEnt", "tpNF", "idDest", "cMunFG", "tpImp", "tpEmis", "cDV", "tpAmb", "finNFe", "indFinal", "indPres", "indIntermed", "procEmi", "verProc", "emit", "CNPJ", "xNome", "xFant", "enderEmit", "xLgr", "nro", "xBairro", "cMun", "xMun", "UF", "CEP", "cPais", "xPais", "fone", "IE", "CRT", "dest", "enderDest", "indIEDest", "autXML", "det", "prod", "cProd", "cEAN", "xProd", "NCM", "CEST", "CFOP", "uCom", "qCom", "vUnCom", "vProd", "cEANTrib", "uTrib", "qTrib", "vUnTrib", "indTot", "imposto", "ICMS", "ICMS00", "orig", "CST", "modBC", "vBC", "pICMS", "vICMS", "IPI", "cEnq", "IPITrib", "pIPI", "vIPI", "II", "vDespAdu", "vII", "vIOF", "PIS", "PISAliq", "pPIS", "vPIS", "COFINS", "COFINSAliq", "pCOFINS", "vCOFINS", "total", "ICMSTot", "vICMSDeson", "vFCP", "vBCST", "vST", "vFCPST", "vFCPSTRet", "vFrete", "vSeg", "vDesc", "vIPIDevol", "vOutro", "vNF", "transp", "modFrete", "transporta", "xEnder", "vol", "qVol", "esp", "pesoL", "pesoB", "cobr", "fat", "nFat", "vOrig", "vLiq", "dup", "nDup", "dVenc", "vDup", "pag", "detPag", "indPag", "tPag", "vPag", "infAdic", "infCpl", "infRespTec", "xContato", "email", "Signature", "SignedInfo", "CanonicalizationMethod", "SignatureMethod", "Reference", "Transforms", "Transform", "DigestMethod", "DigestValue", "SignatureValue", "KeyInfo", "X509Data", "X509Certificate", "protNFe", "infProt", "verAplic", "chNFe", "dhRecbto", "nProt", "digVal", "cStat", "xMotivo", "span", "br"]
```

---

### Fontes:
file:///home/helio/Downloads/NFe_001-000000019.xml
https://github.com/sibprogrammer/xq
https://kislyuk.github.io/yq/
https://duckduckgo.com/?q=jq+command+to+convert+a+xml+to+json&ia=web
https://www.howtogeek.com/devops/how-to-convert-xml-to-json-on-the-command-line/
https://stackoverflow.com/questions/73038301/is-it-possible-to-convert-from-json-or-yaml-to-xml-using-jq-yq-xq
https://duckduckgo.com/?q=linux+command+xq+with+spaces+between+data&ia=web
https://github.com/sibprogrammer/xq/blob/master/README.md


