#!/bin/awk -f 

# Script AWK para calcular PMV: Prazo Médio de Venda.
# Autor: Hélio Giroto
# Data: Início: Mar/2025

# PARA RODAR ESTE SCRIPT:
# exporta para o awk o conteúdo das variáveis NCM e PRODUTO:


# SEM EMPRESA ESPECÍFICA:
# NCM="42022210"; PRODUTO="necessaire"; ARQ="todos.csv"
# NCM="39269090"; PRODUTO='unha'; ARQ="todos.csv"
# NCM="85102000"; PRODUTO='m.quina'; ARQ="todos.csv"
# grep "$NCM" todos.csv | grep -i "$PRODUTO" | sort -t';' -k7 | awk -v NCM="$NCM" -v PRODUTO="$PRODUTO" -f pmv.awk


# QUANDO ESPECIFÍCA UMA EMPRESA:
# com grep tem que escrever o nome mais próx possível para não se confundir com outras 2 ou 3 letras dentro da frase:
# ARQ="todos.csv"; NCM="71179000"; PRODUTO="chaveiro"; EMPRESA="Marcpalm"

# grep "$NCM" todos.csv | grep -i "$PRODUTO" | grep -i "$EMPRESA" | sort -t';' -k7 | awk -v NCM="$NCM" -v PRODUTO="$PRODUTO" -v EMPRESA="$EMPRESA" -f pmv.awk



# ERRO porque awk não está ignorando case:
# ARQ="todos.csv"; NCM="71179000"; PRODUTO="chaveiro"; EMPRESA="GT COM"
# grep "$NCM" todos.csv | grep -i "$PRODUTO" | awk -F';' '{if($10 ~ /'"$EMPRESA"'/) print $0}' | sort -t';' -k7 | awk -v NCM="$NCM" -v PRODUTO="$PRODUTO" -v EMPRESA="$EMPRESA" -f pmv.awk




# função para calcular o intervalo de venda de cada linha:
function INTERVALO(data_desta_linha, data_linha_anterior){
	diferenca = data_desta_linha - data_linha_anterior;
	# resulta em valores data unix:
	umdia = 24*60*60;	
	# converte para nro de dias:
	intervalo_venda = diferenca / umdia;
	return intervalo_venda;
}

# função para calcular pmv de cada linha:
function PMV(diferenca_dias, qtde){
	if(qtde == 0) qtde = $18;
	# pmv = diferenca_dias / qtde;	
	# para evitar notação científica: 4.40306e-05
	pmvNaoFormatado = diferenca_dias / qtde;	
	pmv = sprintf("%.12f", pmvNaoFormatado);
	return pmv;
}


# função para imprimir nova linha de vendas acumuladas realizadas na mesma data:
function IMPRIME_LINHA(){
	# imprime linha SOMENTE SE NÃO for a 1a linha de 'todos.csv':
	if(FNR!=1){
		data_chegada = strftime("%d/%m/%Y", data_linha_anterior);
		# e se estiver na venda #1: pmv e intervalo = 0
		if(qtas_vendas == 1){
			# Empresa; NCM; Descrição; Data Chegada; Qtde; Intervalo; PMV
			print $10";" $12 ";" $15 ";" data_chegada ";" qtde ";" intervalo_anterior ";0;";
			# imprime linha para arquivo JS para dados de gráfico:
			print "['" $10 "','" $15 "','" data_chegada "'," qtde "," intervalo_anterior "," pmv "]," >> "tabela.js"
		} else {
			# chama PMV qtde aqui é a da linha anterior (não-atualizada):
			pmv = PMV(intervalo_anterior, qtde_anterior); 
			# imprime na tela
			# Empresa; NCM; Descrição; Data Chegada; Qtde; Intervalo; PMV
			print $10 ";" $12 ";" $15 ";" data_chegada ";" qtde ";" intervalo_anterior ";" pmv ";";
			
			# imprime linha para arquivo JS para dados de gráfico:
			print "['" $10 "','" $15 "','" data_chegada "'," qtde "," intervalo_anterior "," pmv "]," >> "tabela.js"
			
			intervalo_ultimo = intervalo_anterior;
			# acumula o pmv - para depois calcular a média:
			# e armazena o pmv da última compra:
			pmv_acum += pmv;
			pmv_ultimo = pmv;
		}
		intervalo_anterior = intervalo_venda;
	} else {
		# caso cont., i.é: 
		# se for a primeira linha, não vai calcular intervalo pq não tem data anterior à 1a compra,
		# por isso, o intervalo é 0.
		intervalo_venda = 0;
	}
}


# função para alterar se preciso o intervalo e pmv máximos e mínimos:
function CALCULA_MAX_MIN(){
	# Verifica se o valor intervalo máximo de dias entre uma venda e outra precisa ser atualizado:
	if(intervalo_venda > 0 && intervalo_venda > intervalo_maximo) intervalo_maximo = intervalo_venda;

	# Verifica se o valor intervalo mínimo de dias entre uma venda e outra precisa ser atualizado:
	if(intervalo_venda > 0 && intervalo_venda < intervalo_minimo) intervalo_minimo = intervalo_venda;

	# Verifica se o PMV máximo precisa ser atualizado:
	if(pmv > 0 && pmv > pmv_maximo) pmv_maximo = pmv;

	# Verifica se o PMV mínimo precisa ser atualizado:
	if(pmv > 0 && pmv < pmv_minimo) pmv_minimo = pmv;
}


BEGIN {
	# define delimitador de arq de entrada:
	FS=";";
	# Cabeçalho de total.csv:
	# print "Numero DI; Ref; BL; Data Embarque; Data Chegada; Data Embarque AWK; Data Chegada AWK; Fabricante; Fornecedor; Importador; Porto; NCM; NCM Nome; Referência-Descrição; Descrição; Dolar; VMLD; Quantidade; Valor Unitário US$; Valor Unitário R$";
	# ($12 = NCM // $15 = nome_prod // $18 = qtde // $10 = empresa importadora)
	
	# imprime cabeçalho:
	print "Empresa;NCM;Descrição;Data Chegada;Qtde;Intervalo;PMV";
	
	# inicia o arquivo tabela js (para gráfico):
	print "const dados = [" > "tabela.js"
	
	# variáveis de inicio:
	data_linha_anterior=0;
	intervalo_venda = 0;
	intervalo_anterior = 0;
	intervalo_maximo=0;
	intervalo_minimo=10000;	# 27 anos! 
	pmv = 0;
	pmv_maximo=0;
	pmv_minimo=10000;
	qtde=0;
	qtde_anterior = 0; 	# ++ linha toda
	qtas_vendas=0;
}

{
	# EXECUÇÃO PARA IMPRIMIR AO LADO DE CADA LINHA, CRIANDO DUAS COLUNAS MAIS:
	# pega data:
	data_desta_linha = mktime($7 " 0 0 0");
	
	# intervalo_venda = funcao intervalo (calcula se há diferença entre data da linha atual para a data da linha anterior)
	intervalo_venda = INTERVALO(data_desta_linha, data_linha_anterior);
	# se intervalo_venda > 0 - SE A DATA É DIFERENTE:
	# o dia da linha atual é DIFERENTE do da linha de cima
	if(intervalo_venda > 0){
		# chama funcao:
		IMPRIME_LINHA();
		# qtde atualizada ao valor da linha atual:
		qtde_anterior = qtde;	# ++ linha toda
		qtde = $18;
		# qtde de vendas (vezes que vendeu em OUTRO DIA) servirá para calcular médias:
		qtas_vendas++;
	}
	
	# e caso a DATA dessa linha atual É IGUAL ao da LINHA ANTERIOR:
	# MESMO dia da linha acima:
	# (ou seja, continua sendo a mesma venda apenas mudou tz a cor do mesmo produto, etc)
	else {
		qtde += $18;
	}

	# atualiza o dia anterior substituindo-o para o dia atual:
	data_linha_anterior = data_desta_linha; 
	
	intervalo_acum += intervalo_venda;
	qtde_acum += $18;

	# verifica se alterou o PMV máx e mín como tb o Intervalo máx e min.
	CALCULA_MAX_MIN();

	# FIM DO BLOCO QUE PERCORRE TODAS AS LINHAS
}
	
END {
	# imprime linha da última venda (que normalmente não imprimia pq não havia outra data com intervalo > 0
	# agora está imprimindo a última venda (nro.16) 90+90+90=270 pq executa a função pela últ vez:
	IMPRIME_LINHA();
	# verifica se alterou o PMV máx e mín como tb o Intervalo máx e min.
	CALCULA_MAX_MIN();
	
	# última linha do arquivo tabela js:
	print "];" >> "tabela.js"
	
	# retira notação científica de nro do total da qtde (ver p. ex: NCM = 39269090):
	# qtde_acum = sprintf("%.2f", qtde_acum);
	# arredondar:
	qtde_acum = int(qtde_acum);
	
	# médias:
	intermed = intervalo_acum / qtas_vendas;
	pmvmed = pmv_acum / qtas_vendas;

	# previsão em qtde de dias:
	prevmed = pmvmed * qtde;
	prevmin = pmv_minimo * qtde;
	prevmax = pmv_maximo * qtde;
	prevult = pmv_ultimo * qtde;

	# previsão em datas:
	datamedia = strftime("%d/%m/%Y", int(prevmed * 86400) + data_desta_linha);
	datamin  =  strftime("%d/%m/%Y", int(prevmin * 86400) + data_desta_linha);
	datamax  =  strftime("%d/%m/%Y", int(prevmax * 86400) + data_desta_linha);
	datault  =  strftime("%d/%m/%Y", int(prevult * 86400) + data_desta_linha);

	# data de chegada da ultima compra:
	data_ult_compra = strftime("%d/%m/%Y", data_desta_linha);
	
	# Caso não exista a variável EMPRESA (por não vir de um parâmetro de linha de comando):
	if(!EMPRESA) EMPRESA = "TODAS";

	# saida final para Terminal:
	print "\n=============\nEmpresa:", EMPRESA, "\n\nTotal de produtos comprados:", qtde_acum, "unidades.\nQtas vendas (realizadas em datas diferentes):", qtas_vendas, "\n\nIntervalo Médio de compra ...:", intermed, "dias.\nIntervalo Mínimo ............:", intervalo_minimo, "dias.\nIntervalo Máximo ............:", intervalo_maximo, "dias.\nIntervalo da Última Compra ..:", intervalo_ultimo, "dias.\n\nPMV Média ................:", pmvmed, "dias/cada unid.\nPMV Mínimo ...............:", pmv_minimo, "dias/cada unid.\nPMV Máximo ...............:", pmv_maximo, "dias/cada unid.\nPMV Última Compra ........:", pmv_ultimo, "dias/cada unid.\n\nPrevisão Média para nova compra ...........:", prevmed, "dias.", "\nPrevisão Mínima para nova compra ..........:", prevmin " dias.", "\nPrevisão Máxima para nova compra ..........:", prevmax " dias.", "\nPrevisão conforme a última compra .........:", prevult, "dias.", "\n\nQtde da última compra .....:", qtde, "unidades.\nData de chegada da última compra ..:", data_ult_compra, "\n\nData para nova compra - conforme média ............:", datamedia, "\nData para nova compra - conforme PMV mínimo .......:", datamin, "\nData para nova compra - conforme PMV máximo .......:", datamax, "\nData para nova compra - conforme PMV última compra :", datault, "\n";


	# gráficos:


	# qtde_acum,  qtas_vendas, intermed,  intervalo_minimo,  intervalo_maximo, intervalo_ultimo, pmvmed, pmv_minimo, pmv_maximo, pmv_ultimo, prevmed, prevmin, prevmax, prevult, qtde_ult_compra, data_ult_compra, datamedia, datamin, datamax, datault 

	## SAÍDA -> EXPORTAR PARA UM JSON:
	print "{" > "saida.json";
	
	printf "\"ncm\": \"%s\",\n", NCM >> "saida.json";
	printf "\"produto\": \"%s\",\n", PRODUTO >> "saida.json";
	printf "\"empresa\": \"%s\",\n", EMPRESA >> "saida.json";	
	
	printf "\"qtde_acum\": %s,\n", qtde_acum >> "saida.json";
	printf "\"qtas_vendas\": %s,\n", qtas_vendas >> "saida.json";
	
	printf "\"intermed\": %s,\n", intermed >> "saida.json";
	printf "\"intervalo_minimo\": %s,\n", intervalo_minimo >> "saida.json";
	printf "\"intervalo_maximo\": %s,\n", intervalo_maximo >> "saida.json";
	printf "\"intervalo_ultimo\": %s,\n", intervalo_ultimo >> "saida.json";

	printf "\"pmvmed\": %s,\n", pmvmed >> "saida.json";
	printf "\"pmv_minimo\": %s,\n", pmv_minimo >> "saida.json";
	printf "\"pmv_maximo\": %s,\n", pmv_maximo >> "saida.json";
	printf "\"pmv_ultimo\": %s,\n", pmv_ultimo >> "saida.json";

	printf "\"prevmed\": %s,\n", prevmed >> "saida.json";
	printf "\"prevmin\": %s,\n", prevmin >> "saida.json";
	printf "\"prevmax\": %s,\n", prevmax >> "saida.json";
	printf "\"prevult\": %s,\n", prevult >> "saida.json";

	printf "\"qtde_ult_compra\": %s,\n", qtde >> "saida.json";
	printf "\"data_ult_compra\": \"%s\",\n", data_ult_compra >> "saida.json";

	printf "\"datamedia\": \"%s\",\n", datamedia >> "saida.json";
	printf "\"datamin\": \"%s\",\n", datamin >> "saida.json";
	printf "\"datamax\": \"%s\",\n", datamax >> "saida.json";
	printf "\"datault\": \"%s\",\n", datault >> "saida.json";
	
	print "}" >> "saida.json";

	close("saida.json");
	
	
	# SAÍDA -> PARA ARQUIVO JS:
	print "let ncm = '" NCM "';" > "saida.js";
	print "let produto = '" PRODUTO "';" >> "saida.js";
	print "let empresa = '" EMPRESA "';" >> "saida.js";

	print "let qtde_acum = " qtde_acum ";" >> "saida.js";
	print "let qtas_vendas = " qtas_vendas ";" >> "saida.js";
	
	print "let intermed = " intermed ";" >> "saida.js";
	print "let intervalo_minimo = " intervalo_minimo ";" >> "saida.js";
	print "let intervalo_maximo = " intervalo_maximo ";" >> "saida.js";
	print "let intervalo_ultimo = " intervalo_ultimo ";" >> "saida.js";

	print "let pmvmed = " pmvmed ";" >> "saida.js";
	print "let pmv_minimo = " pmv_minimo ";" >> "saida.js";
	print "let pmv_maximo = " pmv_maximo ";" >> "saida.js";
	print "let pmv_ultimo = " pmv_ultimo ";" >> "saida.js";

	print "let prevmed = " prevmed ";" >> "saida.js";
	print "let prevmin = " prevmin ";" >> "saida.js";
	print "let prevmax = " prevmax ";" >> "saida.js";
	print "let prevult = " prevult ";" >> "saida.js";

	print "let qtde_ult_compra = " qtde ";" >> "saida.js";
	print "let data_ult_compra = '" data_ult_compra "';" >> "saida.js";
	
	print "let datamedia = '" datamedia "';" >> "saida.js";
	print "let datamin = '" datamin "';" >> "saida.js";
	print "let datamax = '" datamax "';" >> "saida.js";
	print "let datault = '" datault "';" >> "saida.js";

	close("saida.js");
	
	# abre o navegador com o dashboard específico:
	# system("firefox-esr './pmv.html/?ncm="NCM"'"); # ??
	system("firefox-esr './pmv.html'"); 
}

