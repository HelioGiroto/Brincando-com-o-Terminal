# Para acrescentar uma tecla de atalho no Thunar:

- ver: https://qastack.com.br/ubuntu/403922/keyboard-shortcut-for-thunar-custom-actions

# navegue até .config/Thunar


## Certifique que o arquivo abaixo...
uca.xml

## tem as seguintes linhas:
<?xml version="1.0" encoding="UTF-8"?>
<actions>
<action>
	<icon>utilities-terminal</icon>
	<name>Abrir terminal nessa pasta</name>
	<unique-id>1631809188049771-1</unique-id>
	<command>lxterminal</command>
	<description>ALT + t</description>
	<patterns>*</patterns>
	<startup-notify/>
	<directories/>
</action>
</actions>


## acrescente a seguinte linha abaixo no arquivo accels.scm:
(gtk_accel_path "<Actions>/ThunarActions/uca-action-1631809188049771-1" "<Alt>t")

- Observe que o nro 1631809188049771 tem que ser igual ao do arquivo uca.xlm

## Reconfigure o Openbox, reinicie o Thunar e pronto.

## Pressione ALT + t e já se abre o lxterminal na janela atual.


