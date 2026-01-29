# TESSERACT

## Como instalar e usar o tesseract
sudo apt install tesseract-ocr imagemagick -y


### Agora lista as linguagens disponíveis:
tesseract --list-langs


### Procura o tesseract do idioma preferido:
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


### Instalando o tesseract do português, por ex.:
sudo apt install tesseract-ocr-por


## PARA EXECUTAR O COMANDO - DIGITALIZANDO UMA IMAGEM PNG:

 - Sintaxe:
 
`tesseract <image_name> <output file_name>`

 - Exemplos:
 
Converte imagem a um texto:
`tesseract image.png new`

A um pdf:
`tesseract image.png new pdf`

 - Digitalizando uma imagem de outro idioma:
 
`tesseract image.png new -l ell`

 - Quando uma imagem tem mais de um idioma:

`tesseract image.png textfile -l eng+por+fra`

 - Digitalizando várias imagens:
 
` for i in *.png; do tesseract "$i" "ocr-$i"; done; `
` for i in img*.png; do tesseract "$i" "ocr-$i" -l eng; done; `


 - ver
 
`tesseract img-63.png arquivo --dpi 150`

## PARA DIGITALIZAR UM PDF (USAR OUTRO COMANDO):

`pdftoppm -png arquivo.pdf arquivo`

(acima: não colocar a extensão .png em arquivo)

*A flag -png converterá primeiramente o pdf em png e depois para texto:*

`tesseract arquivo.png arquivo`

**Para fazer um laço e fazer o OCR de pdf:**

Em caso do pdf ter várias páginas:

```bash 
	# passa o pdftoppm para gerar várias imagens png, uma para cada página do pdf:
	pdftoppm -png "arquivo.pdf" arquivopng 	# não colocar/digitar extensão .png no final

	# converte cada png em txt:
	for ARQ in arquivopng*; do tesseract "$ARQ" "$ARQ".txt; done

	# une todos os txt em um único:
	cat arquivopng*.txt > unico.txt
```


---
Fonte: https://www.howtogeek.com/682389/how-to-do-ocr-from-the-linux-command-line-using-tesseract/


Em py: https://pypi.org/project/pytesseract/

