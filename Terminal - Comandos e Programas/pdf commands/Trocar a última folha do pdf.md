# Trocar a última folha do pdf

Suponha que total.pdf possui 4 páginas e será necessário trocar a última página por outra:

```bash

	# separa páginas de total.pdf:
	pdfseparate total.pdf separado-%d.pdf

	# lista:
	ls separado-*

	# deleta a última folha, assumindao que são 4:
	mv separado-4.pdf __separado-4.pdf

	# merge com última nova folha atualizada:
	pdfunite separado-1.pdf  separado-2.pdf  separado-3.pdf  nova_folha.pdf versao_final.pdf

```

