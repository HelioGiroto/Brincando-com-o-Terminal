
# Crie / navega para a seguinte pasta:
 1758  cd /usr/local/share/fonts

 1759  ls
 1760  pwd
 1761  ls

# Copie todas as fontes (extensao ttf...) para essa pasta

# Dê permissões com estes comandos:
 1762  sudo chown root:staff /usr/local/share/fonts -R
 1763  sudo chmod 644 /usr/local/share/fonts/* -R
 1764  sudo chmod 755 /usr/local/share/fonts/

# compile:  
 sudo fc-cache -fv
 
# Tudo:
sudo cp *.ttf /usr/local/share/fonts
sudo chown root:staff /usr/local/share/fonts -R; sudo chmod 644 /usr/local/share/fonts/* -R; sudo chmod 755 /usr/local/share/fonts/; sudo fc-cache -fv

