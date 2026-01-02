desmembrar um pdf
unmerge
split 

fonte: https://superuser.com/questions/345086/split-pdf-document-from-command-line-in-linux

$ pdfseparate total.pdf separado-%d.pdf

---

Fonte: https://superuser.com/questions/345086/split-pdf-document-from-command-line-in-linux

I find pdfseparate very convenient to split ranges into individual pages. You can extract all pages into files named output-page1.pdf, output-page2.pdf, like this,

`pdfseparate input.pdf output-page%d.pdf`

And you can extract pages 1 - 5 of input.pdf by using the first-page and last-page flags, -f 1 -l 5,

`pdfseparate -f 1 -l 5 input.pdf output-page%d.pdf`

If you want to recombine them into page ranges, for example pages 1-3 in one document and pages 4-5 in another, you can use the companion program, pdfunite, as follows:

```
pdfunite output-page1.pdf output-page2.pdf output-page3.pdf final-pages1-3.pdf
pdfunite output-page4.pdf output-page5.pdf final-pages4-5.pdf
```

I believe theese tools are part of poppler and may already be installed on your system.


