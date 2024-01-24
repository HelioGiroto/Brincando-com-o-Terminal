#!bin/bash

# Transforma CSS em CSS MINIMAL !!!
cat s.css | tr '\n' ' ' | sed -r 's/\t//g; s/  //g'

# Transforma MINIMAL em CSS pretty:
echo; sed 's/>/>\n\n\t/; s/{/ {\n\t\t/g; s/}/\n\t}\n\n\t/g; s/;/;\n\t\t/g; s|\t</s|</s|' c.css; echo

# <style type="text/css">body{background:tomato;text-align:center}.centro{position:relative;width:50%;left:25%}.images{display:flex;flex-flow:column nowrap;justify-content:center}.images>div{width:auto;height:auto;margin:15px 0;justify-content:center}.foto{}.ficha{}.obs{width:50%;padding:30px 0;background:#acf5ff;margin-bottom:25px}.botoes{display:flex;flex-flow:row nowrap;justify-content:space-around}.botoes>div{background:#c1c1c1;padding:7px 20px;font-size:2em}</style>

# Criar filtro externo para BlueFish para dar um pretty css na linha acima:
# |sed 's/>/>\n\t/; s/}/}\n\t/g; s/{/ {\n/g; s/;/;\n/g'|

# Salvar esse arquivo como .sh e executá-lo no Blue Fish dentro do diretório especificado: |/usr/share/bluefish/cssBeauty.sh|

# Para editar o FILTRO - Menú:
# EDITAR > PREFERENCIAS > FILTROS EXTERNOS

# Para aplicar o FILTRO: 
# FERRAMENTAS > FILTROS


# Ver video em /Videos/:
# omxplayer vokoscreen-2018-01-29_23-18-57.mkv
