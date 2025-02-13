# LIBREOFFICE CALC

## MUDAR A COR DA FONTE CONFORME O VALOR DA CÉLULA
 - Selecionar toda a área desejada
 - Formatar > Condicional > Gerenciar
 - Adicionar BT
 - Em: Valor da Célula = é igual a => (insere o valor)
 - Em: Aplicar estilo => Novo Estilo > Escolhe o novo estilo que assumirá as células com aquele valor (Aba: Efeitos a fonte - para mudar a cor da fonte) 
 - OK > OK > OK
 - Salva Planilha
 - Fecha Planilha
 - Abre de novo a Planilha - para aplicar o efeito.

OBS.: Sensível a espaços, e não a Case.

==========

## COR ZEBRADA DAS LINHAS
 - Selecionar toda a área desejada
 - Formatar > Condicional > Condição
 - Em: Condição1 => Escolher: "A fórmula é" > =épar(linha()) 
 - Aplicar estilo: "Novo Estilo"
 - Plano de Fundo > Escolher COR
 - OK 
 - Salvar planilha
 - Fechar Planilha
 - Reabrir planilha

https://essenzialeprime.blogspot.com/2017/01/linhas-zebradas-no-libreoffice-calc.html

=============


## CONGELAR LINHAS OU COLUNAS COMO CABEÇALHOS

Se houver linhas ou colunas longas de dados que vão além da área visível na planilha, será possível fixá-las, o que permite que as colunas ou linhas fixas sejam vistas quando percorrer o resto dos dados.

Selecione **a linha abaixo** ou **a coluna à direita da linha ou coluna** que deseja incluir na região congelada. Todas as linhas acima ou todas as colunas à esquerda da seleção serão congeladas.

Para fixar horizontalmente e verticalmente, selecione a célula que está abaixo da linha e à direita da coluna que deseja fixar.

**Selecione: Exibir > Fixar linhas e colunas.**

Para desativar, selecione novamente Exibir - Fixar linhas e colunas.

Ícone Nota 
Se a área definida deve poder rolar, aplique o comando Exibir - Dividir janela.

Ícone Nota 
Para imprimir uma certa linha em todas as páginas de um documento, escolha Formatar - Intervalos de impressão - Editar.

https://help.libreoffice.org/latest/pt-BR/text/scalc/guide/line_fix.html



## Obter dados de outra planilha (arquivo ou aba)

Fonte: https://maisgeek.com/como-fazer-referencia-cruzada-de-celulas-entre-planilhas-do-microsoft-excel/


- Basta deixar abertas as duas planilhas (origem e destino).
- Na planilha destino, na célula em que será inserido o valor, digitar '='
- Simplesmente vá até a planilha origem e clique (ou marque) sobre a célula que contém o valor desejado.
- De volta à planilha destino pressione enter. 

O resultado será algo assim:

```
='file:///home/mkt/Downloads/plan1.ods'#$PL1.B1
```

Para refrescar basta pressinar: "Crtl + Shift + F9"



