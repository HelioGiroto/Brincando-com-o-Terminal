# mudar o menu.xlm

https://github.com/woho/openbox-menu


# como mudar rc.xlm do openbox:

http://openbox.org/wiki/Help:Bindings
https://medium.com/daniels-tech-world/how-to-add-custom-keybindings-in-openbox-29a97088abae
https://askubuntu.com/questions/305767/how-i-can-create-a-shortcut-to-maximize-minimize-windows-in-lubuntu


# Se não funcionar "Aplicativos" do menu (1a.linha):
 1997  sudo apt --reinstall install obmenu*
 1998  sudo apt --reinstall install openbox*
 1999  reboot


# rofi 
rofi -combi-modi window,drun,ssh -theme solarized -font "hack 10" -show combi
rofi -show run -theme solarized -font "hack 12" 


<!-- Keybindings for window tiling -->

    <keybind key="C-W-Up">        # FullScreen
      <action name="Maximize"/>
    </keybind>
    <keybind key="C-W-Down">        # MiddleScreen
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo"><x>center</x><y>center</y><width>50%</width><height>50%</height></action>
    </keybind>

    <keybind key="C-W-Left">        # HalfLeftScreen
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo"><x>0</x><y>0</y><height>100%</height><width>50%</width></action>
    </keybind>
    <keybind key="C-W-Right">        # HalfRightScreen
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo"><x>-0</x><y>0</y><height>100%</height><width>50%</width></action>
    </keybind>

    <keybind key="C-W-1">        # UpperQuarterLeft
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo"><x>0</x><y>0</y><height>50%</height><width>50%</width></action>
    </keybind>

    <keybind key="C-W-2">        # LowerQuarterLeft
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo"><x>0</x><y>-0</y><height>50%</height><width>50%</width></action>
    </keybind>

    <keybind key="C-W-3">        # LowerQuarterRight
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo"><x>-0</x><y>-0</y><height>50%</height><width>50%</width></action>
    </keybind>

    <keybind key="C-W-4">        # UpperQuarterRight
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo"><x>-0</x><y>0</y><height>50%</height><width>50%</width></action>
    </keybind>
    
    
