como configurar teclas no openbox

ver os nomes das teclas: 
http://openbox.org/wiki/Help:Bindings

como configurar no rc.xml:
https://github.com/HelioGiroto/Brincando-com-o-Terminal/blob/master/.config/openbox/dicas_mudar_rc_xml.md

<!-- Teclas de atalho para posicionamento da janela na tela - Shift + Super + Teclado Numérico -->

<keybind key="S-W-7">        # UpperQuarterLeft
  <action name="UnmaximizeFull"/>
  <action name="MoveResizeTo"><x>0</x><y>0</y><height>50%</height><width>50%</width></action>
</keybind>

<keybind key="S-W-9">        # UpperQuarterRight
  <action name="UnmaximizeFull"/>
  <action name="MoveResizeTo"><x>-0</x><y>0</y><height>50%</height><width>50%</width></action>
</keybind>

<keybind key="S-W-1">        # LowerQuarterLeft
  <action name="UnmaximizeFull"/>
  <action name="MoveResizeTo"><x>0</x><y>-0</y><height>50%</height><width>50%</width></action>
</keybind>

<keybind key="S-W-3">        # LowerQuarterRight
  <action name="UnmaximizeFull"/>
  <action name="MoveResizeTo"><x>-0</x><y>-0</y><height>50%</height><width>50%</width></action>
</keybind>

<keybind key="S-W-8">        # Upper 
  <action name="UnmaximizeFull"/>
  <action name="MoveResizeTo"><x>0</x><y>0</y><height>50%</height><width>100%</width></action>
</keybind>

<keybind key="S-W-2">        # Lower 
  <action name="UnmaximizeFull"/>
  <action name="MoveResizeTo"><x>0</x><y>-0</y><height>50%</height><width>100%</width></action>
</keybind>

<keybind key="S-W-4">        # Left
  <action name="UnmaximizeFull"/>
  <action name="MoveResizeTo"><x>0</x><y>0</y><height>100%</height><width>50%</width></action>
</keybind>

<keybind key="S-W-6">        # Right
  <action name="UnmaximizeFull"/>
  <action name="MoveResizeTo"><x>-0</x><y>0</y><height>100%</height><width>50%</width></action>
</keybind>

<keybind key="S-W-5">        # Center
  <action name="UnmaximizeFull"/>
  <action name="MoveResizeTo"><x>0</x><y>0</y><height>100%</height><width>100%</width></action>
</keybind>



Como mudar menu para icone e nome:

ver em: 
https://www.youtube.com/watch?v=2dAWJ05Ez4k&list=PLB4ymvNB9_0agz2KesibCGcSQ3io55Qee&index=3&t=6s
https://github.com/trizen/obmenu-generator/blob/master/schema.pl
https://www.ubuntuopenbox.com/apps/obmenu-generator/



Como configurar monitores:
Programa: Arandr



