# Clipboard histories:

## Para Debian Wayland - Gnome

### Instala o gpaste:
sudo apt install gnome-shell-extension-gpaste

### Verifica se já não instalou o ativador de extensões para Gnome:
sudo apt install gnome-shell-extension-prefs

### Reinicia o sistema

### roda o ativador de extensões e ativa o Gpaste:
gnome-shell-extension-prefs



## Outras opções 
sudo apt install clipman
sudo apt install copyq

sudo apt install wl-clipboard  # Debian

Usage is as simple as:

    # copy a simple text message
    $ wl-copy Hello world!

    # copy the list of files in Downloads
    $ ls ~/Downloads | wl-copy

    # copy an image file
    $ wl-copy < ~/Pictures/photo.png

    # paste to a file
    $ wl-paste > clipboard.txt

    # grep each pasted word in file source.c
    $ for word in $(wl-paste); do grep $word source.c; done

    # copy the previous command
    $ wl-copy "!!"

    # replace the current selection with the list of types it's offered in
    $ wl-paste --list-types | wl-copy


