# CHROMIUM

**Usando o Chrome na linha de comando do Terminal**

- Para abrir um arquivo de lista de URLs no navegador:

```bash
xargs -n1 firefox -new-tab < listaURLs.txt
xargs chromium-browser --new-tab < listaURLs.txt

xargs chromium-browser < lista.txt

google-chrome --new-tab http://www.url{1..4}.com
```


- Abre link principal do resultado de busca:

` chromium $(lynx --listonly --dump https://www.google.com/search?q=site+treecomex | grep ' 5. ' | sed 's/ //g; s/5.//') `


https://www.google.com/search?q=comercio+exterior&tbm=nws
https://www.google.com/search?q=com%C3%A9rcio+exterior&tbm=nws




