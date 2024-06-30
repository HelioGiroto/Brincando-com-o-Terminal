# Thunar

## Plugins do Thunar

ver:
- https://itsfoss.com/thunar-tweaks/
- https://goodies.xfce.org/projects/thunar-plugins/start?ref=itsfoss.com
- https://docs.xfce.org/xfce/thunar/custom-actions
- https://help.ubuntu.com/community/ThunarCustomActions
- https://docs.xfce.org/xfce/thunar/media-tags





## Para acrescentar uma TECLA DE ATALHO no Thunar:

- ver: https://qastack.com.br/ubuntu/403922/keyboard-shortcut-for-thunar-custom-actions

0. navegue até .config/Thunar


1. Certifique que o arquivo abaixo...
uca.xml

2. Tem as seguintes linhas:
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


3. acrescente a seguinte linha abaixo no arquivo accels.scm:
(gtk_accel_path "<Actions>/ThunarActions/uca-action-1631809188049771-1" "<Alt>t")

4. Observe que o nro 1631809188049771 tem que ser igual ao do arquivo uca.xlm

5. Reconfigure o Openbox, reinicie o Thunar e pronto.

6. Pressione ALT + t e já se abre o lxterminal na janela atual.


