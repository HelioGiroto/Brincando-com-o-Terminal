# Descobrir senhas de wifi que foram salvas no pc

sudo find /etc/NetworkManager/system-connections -type f -exec cat {} \; |  grep -e '^id=*' -e '^psk=*' 

