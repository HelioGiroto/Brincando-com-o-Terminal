# Instalar Pandoc

sudo apt install pandoc
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-latex-extra
sudo apt install texlive-xetex

pdflatex latex_source_name.tex



*Fonte: https://gist.github.com/HelioGiroto/3a51d98d574c172e4624c43ee9e4e516*


---

\begin{center}
![](./img.jpg){height=30%}
\end{center}


![](./img.jpg){height=30% margin=auto}


tentar colocar uma imagem que tenha a margem exata de um cabeçalho, mas com a altura de 10% ou menos da folha.

================

retirar o numero das paginas:
(insere na 1a.)
\pagenumbering{gobble}


==================


pandoc --from markdown comunicado-inicio.md --pdf-engine=lualatex -V mainfont:'Liberation Serif' -V geometry:top=2cm,bottom=2cm,left=3cm,right=3cm -o teste1.pdf -f markdown+implicit_figures


pandoc --from markdown comunicado-inicio.md --pdf-engine=lualatex -V mainfont:'Liberation Serif' -V geometry:margin=1cm -o teste1.pdf -f markdown+implicit_figures









=======

LINKS: 

https://stackoverflow.com/questions/17232677/disable-page-numbering-converting-markdown-to-pdf-with-pandoc
https://duckduckgo.com/?q=pandoc+how+include+a+footer+on+pdf&ia=web
https://tex.stackexchange.com/questions/401473/how-to-add-a-header-footer-to-markdown-document
https://stackoverflow.com/questions/19397100/adding-a-title-page-page-headers-and-footers-using-pandoc
https://tex.stackexchange.com/questions/139139/adding-headers-and-footers-using-pandoc
https://duckduckgo.com/?q=pandoc+margins+padding+of+page&ia=web
https://stackoverflow.com/questions/13515893/set-margin-size-when-converting-from-markdown-to-pdf-with-pandoc
https://levelup.gitconnected.com/use-columns-adjust-margins-and-do-more-in-markdown-with-these-simple-pandoc-commands-adb4c19f9f35
https://tex.stackexchange.com/questions/524177/pandoc-changing-the-layout-when-compiling-markdown

---

formato do comando que converte de md para pdf com fonte diferente:

	pandoc --from markdown fzimport.com.md --pdf-engine=lualatex -V mainfont:'Liberation Serif' -o out.pdf



INSTALADO:

	??? 	423  sudo tlmgr install luaotfload
		424  sudo apt-get install texlive-luatex


FONTES:
	https://keep.google.com/#home
	file:///home/mkt/1-Projetos/Sites/comunicado-responsaveis-sites.md
	https://chromewebstore.google.com/detail/fonts-ninja/eljapbgkmlngdpckoiiibecpemleclhh
	https://github.com/HelioGiroto/Brincando-com-o-Terminal
	https://duckduckgo.com/?q=pandoc+change+a+font&ia=web
	https://pandoc.org/MANUAL.html
	https://learnbyexample.github.io/customizing-pandoc/
	https://tex.stackexchange.com/questions/234786/how-to-set-a-font-family-with-pandoc
	https://tex.stackexchange.com/questions/378488/font-tu-lmr-m-n-10-lmroman10-regulartlig-at-10pt-not-loadable





= CENTRALIZAR IMAGEM - PANDOC
	https://stackoverflow.com/questions/54701123/image-centering-with-pandoc-markdown
	https://stackoverflow.com/questions/54701123/image-centering-with-pandoc-markdown
	https://stackoverflow.com/questions/49482221/pandoc-markdown-to-pdf-image-position
	https://superuser.com/questions/796565/correctly-sizing-png-images-in-markdown-with-pandoc-for-html-pdf-docx
	https://mostlymaths.net/2021/06/centering.html/


---

\begin{center}
![](./img.jpg){height=30%}
\end{center}


![](./img.jpg){height=30% margin=auto}


tentar colocar uma imagem que tenha a margem exata de um cabeçalho, mas com a altura de 10% ou menos da folha.

================

retirar o numero das paginas:
(insere na 1a.)
\pagenumbering{gobble}


==================


pandoc --from markdown comunicado-inicio.md --pdf-engine=lualatex -V mainfont:'Liberation Serif' -V geometry:top=2cm,bottom=2cm,left=3cm,right=3cm -o teste1.pdf -f markdown+implicit_figures


pandoc --from markdown comunicado-inicio.md --pdf-engine=lualatex -V mainfont:'Liberation Serif' -V geometry:margin=1cm -o teste1.pdf -f markdown+implicit_figures









=======

LINKS: 

https://stackoverflow.com/questions/17232677/disable-page-numbering-converting-markdown-to-pdf-with-pandoc
https://duckduckgo.com/?q=pandoc+how+include+a+footer+on+pdf&ia=web
https://tex.stackexchange.com/questions/401473/how-to-add-a-header-footer-to-markdown-document
https://stackoverflow.com/questions/19397100/adding-a-title-page-page-headers-and-footers-using-pandoc
https://tex.stackexchange.com/questions/139139/adding-headers-and-footers-using-pandoc
https://duckduckgo.com/?q=pandoc+margins+padding+of+page&ia=web
https://stackoverflow.com/questions/13515893/set-margin-size-when-converting-from-markdown-to-pdf-with-pandoc
https://levelup.gitconnected.com/use-columns-adjust-margins-and-do-more-in-markdown-with-these-simple-pandoc-commands-adb4c19f9f35
https://tex.stackexchange.com/questions/524177/pandoc-changing-the-layout-when-compiling-markdown


---

formato do comando que converte de md para pdf com fonte diferente:

	pandoc --from markdown fzimport.com.md --pdf-engine=lualatex -V mainfont:'Liberation Serif' -o out.pdf



INSTALADO:

	??? 	423  sudo tlmgr install luaotfload
		424  sudo apt-get install texlive-luatex


FONTES:
	https://keep.google.com/#home
	file:///home/mkt/1-Projetos/Sites/comunicado-responsaveis-sites.md
	https://chromewebstore.google.com/detail/fonts-ninja/eljapbgkmlngdpckoiiibecpemleclhh
	https://github.com/HelioGiroto/Brincando-com-o-Terminal
	https://duckduckgo.com/?q=pandoc+change+a+font&ia=web
	https://pandoc.org/MANUAL.html
	https://learnbyexample.github.io/customizing-pandoc/
	https://tex.stackexchange.com/questions/234786/how-to-set-a-font-family-with-pandoc
	https://tex.stackexchange.com/questions/378488/font-tu-lmr-m-n-10-lmroman10-regulartlig-at-10pt-not-loadable





= CENTRALIZAR IMAGEM - PANDOC
	https://stackoverflow.com/questions/54701123/image-centering-with-pandoc-markdown
	https://stackoverflow.com/questions/54701123/image-centering-with-pandoc-markdown
	https://stackoverflow.com/questions/49482221/pandoc-markdown-to-pdf-image-position
	https://superuser.com/questions/796565/correctly-sizing-png-images-in-markdown-with-pandoc-for-html-pdf-docx
	https://mostlymaths.net/2021/06/centering.html/






















