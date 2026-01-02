# Rotacionar um pdf:

**Comadnop QPDF**

Para rotacionar todas as páginas:

`qpdf --rotate=+90 entrada.pdf saida.pdf`

Para girar páginas específicas (por exemplo, páginas 2, 4 e 6) 90 graus no sentido horário e forçar as páginas 7 e 8 a 180 graus:

` qpdf input.pdf output.pdf --rotate=+90:2,4,6 --rotate=180:7-8 `


