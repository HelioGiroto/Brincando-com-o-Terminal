lsusb 
  383  sudo apt install git dkms
  384  sudo apt install module-assistant
  385  ls
  386  pwd
  387  mkdir 
  388  mkdir DriverBuild
  389  cd DriverBuild/
  390  sudo m-a update
  391  sudo m-a prepare
  392  git clone https://github.com/kelebek333/rtl8188fu
  393  sudo dkms add ./rtl8188fu
  394  sudo dkms build rtl8188fu/1.0
  395  sudo dkms install rtl8188fu/1.0
  396  sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi
  397  exit
  398  nmtui

  399  sudo nmcli device show
  400  nmcli connection show --active
  401  nmcli connection show
  402  sudo nmcli device show
  403  sudo apt install tlp tlp-rdw
  404  sudo tlp-stat
  405  sudo gedit /etc/tlp.conf
  406  wifi
  407  nmtui
  408  wifi
  409  nmtui
  410  history
  411  ls
  412  ls -a
  413  history 

