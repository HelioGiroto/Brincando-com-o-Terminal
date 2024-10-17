# Como instalar e usar o tesseract


## No Terminal:
sudo apt install tesseract-ocr imagemagick -y


## Agora lista as linguagens disponíveis:
tesseract --list-langs


## Procura o tesseract do idioma preferido:
apt-cache search tesseract-ocr


*Exemplos:*
tesseract-ocr-heb
tesseract-ocr-spa
tesseract-ocr-por
tesseract-ocr-ell 
tesseract-ocr-fra


_Se for instalar idiomas com letras exóticas, não esquecer de instalar o script, por ex:_

tesseract-ocr-script-grek
tesseract-ocr-script-hebr


## Instalando o tesseract do português, por ex.:
sudo apt install tesseract-ocr-por



## Para executar o comando:

 - Sintaxe:
 
`tesseract <image_name> <output file_name>`

 - Exemplos:
 
Converte imagem a um texto:
`tesseract image.png new`

A um pdf:
`tesseract image.png new pdf`

 - Digitalizando uma imagem de uoutro idioma:
 
`tesseract image.png new -l ell`

 - Quando uma imagem tem mais de um idioma:

`tesseract image.png textfile -l eng+por+fra`

 - Digitalizando várias imagens:
 
`for i in img*.png; do tesseract "$i" "text-$i" -l eng; done;`

 - ver
 
`tesseract img-63.png arquivo --dpi 150`

## Para digitalizar um pdf (usar outro comando):

`pdftoppm -png arquivo.pdf arquivo`

*A flag -png converterá primeiramente o pdf em png e depois para texto:*

`tesseract arquivo.png arquivo`




---
Fonte: https://www.howtogeek.com/682389/how-to-do-ocr-from-the-linux-command-line-using-tesseract/


Em py: https://pypi.org/project/pytesseract/

