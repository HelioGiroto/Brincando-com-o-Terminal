# Tutorial de imagemagick para editar imagens

Fontes: 

**Página Principal:**
https://usage.imagemagick.org/

**Comandos:**
https://imagemagick.org/script/command-line-options.php

**Scripts:**
https://imagemagick.org/script/magick-script.php


## Como fazer uma IDLE de imagemagick com auto view

tmux com 2 painéis:

1o. painel: 
	- edita a imagem

2o. painel: 
	- `display -update 1 arq.saida`

usar o "Fixar no topo" a janela do display.

---

## Editando imagem pelo Terminal

- Adicionando 2 textos centralizados com contorno:
- Imagem original de tamanho: 896 X 537 pixels

```
 convert bibliaY.jpg -pointsize 100 -font Lato-Black -fill black -annotate +203+183 "Provérbios" -fill gold -annotate +200+180 "Provérbios" B.png # com sombra correção

 convert bibliaY.jpg -pointsize 100 -font Lato-Black -stroke black -strokewidth 2 -fill gold -annotate +200+180 "Provérbios" B.png # com contorno - correção

 convert bibliaY.jpg -gravity north -pointsize 100 -font Lato-Black -stroke black -strokewidth 2 -fill gold -annotate +0+100 "Provérbios" -gravity south -pointsize 150 -fill gold -annotate +0+140 "23" B.png # resultado final - 100% ok

 ```

 **Acima:**

 `-annotate +x+y`

 quando menor o nro, mais perto do ponto cardinal (seja Norte, Sul,.... etc).

FONTE: https://legacy.imagemagick.org/Usage/annotating/#gravity

---


- **Explicação do código abaixo:**

	Imagem de origem: bibliaY.jpg

	Nome do $LIVRO centralizado a Norte. Fonte: Lato-Black, 100, com contorno.

	Nro do $CAP [-ítulo] centralizado a Sul. Fonte 150.

	Saída de arquivo: #LIVRO-$CAP.png

```

convert bibliaY.jpg \
	-gravity north \
	-pointsize 100 \
	-font Lato-Black -stroke black -strokewidth 2 \
	-fill gold -annotate +0+80 "$LIVRO" \
	-gravity south \
	-pointsize 150 \
	-fill gold -annotate +0+140 "$CAP" \
	"$LIVRO"-"$CAP".png

```


---

`convert original.png \( -clone 0 -fill "#a0132e" -colorize 100 \) \( -clone 0,1 -compose difference -composite -separate +channel -evaluate-sequence max -auto-level \) -delete 1 -alpha off -compose over -compose copy_opacity -composite output.png`


`convert original.png +level-colors firebrick,yellow output.png`
FONTE: http://www.imagemagick.org/Usage/color_mods/

# ou:
`convert original.png -fill firebrick -tint 100 output1.png`


---

USAGE: colorfilter [-m method] [-c color] [-d density] infile [maskfile] outfile

`colorfilter original.png -m 2 -c red -d 100 output2.png`

FONTE: http://www.fmwconcepts.com/imagemagick/colorfilter/index.php


---


`convert -size 400X125 xc:skyblue -fill white -stroke black -draw "rectangle 20,10 80,50" retang.gif`


`convert -size 400X125 xc:red -font Candice -pointsize 72 -fill yellow -stroke black -strokewidth 15 -draw "text 25,65 'Carnaval'" -stroke none -draw "text 25,65 'Carnaval'" carnaval-faixa.jpg`


### RESULTADO FINAL:

convert -size 976X170 xc:red -font Candice -pointsize 130 -fill yellow -stroke black -strokewidth 15 -gravity North -draw "text -20,0 'Carnaval'" -stroke none -gravity North -draw "text -20,0 'Carnaval'" carnaval-faixaa.jpg

convert carnaval-faixaa.jpg -fill white -stroke black -font Impact -pointsize 40 -gravity south -annotate 0 'O QUE NINGUÉM TE CONTOU!' carnaa.jpg

convert output50.png carnaa.jpg -append aa.jpg



## MUDAR A COR DE UMA IMAGEM EM IMAGEMAGICK

`convert shell.jpg -fuzz 50% -fill red -opaque black troca.jpg # muda a cor black para red`


## TRANSPARENCIAS PARA .PNG

`convert shell.jpg -fuzz 50% -transparent white shell_transp.png`


## OBTER O TAMANHO DA IMAGEM:

```
identify -ping bash.jpg
identify -ping -format '%w %h' bash.jpg
identify -ping -format '%w %h \n' bash.jpg
```


## CRIANDO IMAGENS E ADICINANDO TEXTO:

**Criando uma imagem vazia:**

https://stackoverflow.com/questions/39504522/create-blank-image-in-imagemagick#39504523

```bash
    convert -size 800x800 xc:white white.png
    convert -size 800x800 canvas:white white.jpg
```


**Exemplo para imprimir texto em imagem 1080x1080:**

```
    convert origem.jpg \ 
    -pointsize 60 -fill black -family "Lato"  \
    -weight 500 -annotate +490+330 "$ 1,00 =" \
    -weight 800 -annotate +720+330 "R$ 6,028" \
    output.jpg
```

Ref.:  https://www.imagemagick.org/Usage/fonts/


**Mais exemplos:**

```
convert -size 1200X800 canvas:orange abelha.png -gravity west -composite gato.png -gravity east -composite zz.png #OK
 convert -size 1200X800 canvas:orange abelha.png -composite zz.png #OK
 convert -size 1200X800 canvas:orange zz.png #OK
 convert -size 1200X800 canvas:orange -gravity west abelha.png -composite -gravity east gato.png -composite zz.png #OK
 #convert -size 1200X800 plasma:orange-red -gravity west abelha.png -composite -gravity east gato.png -composite zz.png #OK
 convert -size 1200X800 canvas:orange -gravity west abelha.png -composite -gravity center gato.png -composite zzz.png #OK
 convert -size 800X600 canvas:darkgreen cachorro.png -geometry +100+200 -composite aa.png #OK
 convert -size 800X600 canvas:darkgreen cachorro.png -geometry +100+200 -composite gato.png -gravity north -composite aa.png #OK
 convert -size 800X600 canvas:darkgreen cachorro.png -geometry +100+200 -composite -annotate +300+250 'Bibita!!!' aa.png #OK
 convert -size 800X600 canvas:darkgreen cachorro.png -geometry +100+200 -composite -pointsize 100 -annotate +300+250 'Bibita!!!' aa.png #OK
 convert -size 800X600 canvas:darkgreen cachorro.png -geometry +100+200 -composite -pointsize 100 -annotate +300+350 'Bibita!!!' aa.png #OK
 convert -size 800X600 canvas:darkgreen cachorro.png -geometry +100+200 -composite -pointsize 100 -annotate +300+310 'Bibita!!!' aa.png #OK
 convert -size 800X600 canvas:darkgreen cachorro.png -geometry +100+200 -composite -pointsize 100 -font Lato-Black -fill white -annotate +300+310 'Bibita!!!' aa.png #OK
 history | grep 'convert' | grep -i 'ok'

convert -size 700X200 canvas:darkgreen cachorro.png -geometry +60+20 -composite -pointsize 100 -font Luckiest-Guy-Regular -fill white -annotate +220+130 'Bibita!!!' bibita3.png
```


### Imprimir um texto centralizado

Centraliza um texto numa imagem de 1080x1080 (para post de Instagram e outras redes sociais).

No caso abaixo, somente configura o eixo Y (-358) com valor negativo, já que y:0 é o centro vertical.

```bash
	# cria uma variável com um texto (a data atual, p.ex.):
	DATA=$(date "+%^A, %d DE %^B DE %Y")

	# cria uma imagem vazia cor negro
	convert -size 1080x1080 xc:black origem.jpg

	# imprime a frase com o texto acima de forma centralizada: 
	convert origem.jpg \
		-pointsize 25 -fill white -family "Lato" -weight 500 \
		-gravity center -annotate +0-358 "$DATA" \
	resultado.jpg
```

Ver: 

https://www.imagemagick.org/discourse-server/viewtopic.php?t=21350

https://www.imagemagick.org/discourse-server/viewtopic.php?t=32859

https://github.com/ImageMagick/ImageMagick/discussions/2854


```
magick rose: -resize 240x240! \( -size 240x30 -background white -gravity center label:"very very very long long string" \) -alpha off -append rose_text1.png

magick rose: -resize 240x240! \( -size 240x30 xc:white -pointsize 20 -gravity west -annotate +0+0 "very very very long long string" \) -alpha off -append rose_text2.png

```

P.S. there should be no spaces in *.jpg or 240x240!+0+0. You command above has extraneous spaces which should keep it from working properly. Probably a typo.



## Redimensionar imagens:

```
convert imagem-original -resize 60% nova-imagem

# Em lote: converte para mini-thumbnail:
for IMG in *.png; do convert -resize 50% $IMG capa-$IMG;  done
```

## MONTAGE & APPEND IMAGES

Junta duas imagens mantendo (keeping) o tamanho original:
``` 
montage cachorro.png gato.png -geometry +0+0 aa.png
montage cachorro.png gato.png -geometry +1+1 aa.png 
```

- Acima: -geometry +1+1= É melhor! Pq define que só serão redimensionadas imagens menores que 1 px!

- VEJA: https://www.imagemagick.org/Usage/montage/#zero_geometry
- Fonte: https://www.imagemagick.org/discourse-server/viewtopic.php?t=17541


### Com fundo colorido:

`montage cachorro.png gato.png -geometry +1+1 -background lightblue aa.png`

### Com frame (marco):
`montage cachorro.png gato.png -geometry +1+1 -frame 5 aa.png`


### Com nomes abaixo (como legenda):
```
montage cachorro.png gato.png -geometry +1+1 -set label '%f' aa.png 
montage cachorro.png gato.png -geometry +1+1 -set label '%f \n' aa.png    			# Com uma quebra de linha
montage cachorro.png gato.png -geometry +1+1 -frame 5 -set label '%f \n' aa.png  	# Com moldura junto.
```

### Com sombra:
`montage cachorro.png gato.png -shadow -geometry +1+1 aa.png`

---

### append

Esta opção cria uma única imagem mais longa, unindo todas as imagens atuais em sequência de cima para baixo.

Use append para empilhar imagens da esquerda para a direita. Se elas não tiverem a mesma largura, imagens mais estreitas serão preenchidas com a configuração atual de cor de fundo, e suas posições relativas umas às outras podem ser controladas pela configuração atual de gravidade. Para opções mais flexíveis, incluindo a capacidade de adicionar espaço entre as imagens, use -smush.

(https://imagemagick.org/script/command-line-options.php#append)

`convert -append in-*.jpg out.jpg`

In order to have specific files appended, or skip numbers instead of getting the full "glob", you can mention the input files explicitly and put the append command afterwards

`convert 1.jpg 5.jpg N.jpg +append out.jpg`

You can use -append (instead of +append) **for vertical** paste-up.

Or:

`montage -mode concatenate -tile 1x in-*.jpg out.jpg`

will also create a file out.jpg that contains a vertical concatenation of the source images.


### convert

For simple concatenation in a single row or column, the append option of the convert tool is sufficient. Note that -append concatenates all images vertically, creating one column with n rows, and +append concatenates horizontally, creating one row with n columns.

(See ImageMagick: Command-line Options.)

### montage

To get finer control over the layout, we would need the montage tool. montage -mode concatenate will glue the input images together like the append option and -tile 1x controls the layout to be applied.

tile follows the format columns×rows, but either side may be missing and montage will figure out how to meet the constraints.

We're using 1x (exactly one column with any number of rows) here to get the same effect as -append. Without -tile 1x, it would join the images like +append, defaulting to -tile x1 (any number of columns on one row).

Fonte: https://superuser.com/questions/290656/combine-multiple-images-using-imagemagick

### Sobrepor uma imagem:

Ver: https://superuser.com/questions/1581256/how-to-overlay-two-images-with-position-and-scale-in-imagemagick

`magick convert circle.png inner.png -gravity Center -geometry 256x256+30+5 -composite -resize 64x64 output.png`




### Scripts imagemagick

Ver: https://imagemagick.org/script/magick-script.php

Here is an example script:

```
#!/bin/env magick-script
-size 100x100 xc:red ( rose: -rotate -90 ) +append  -write show:
```


Or use the magick utility with the scripting option like this:
```
#!/bin/magick -script
-size 100x100 xc:red ( rose: -rotate -90 ) +append  -write show:
```





