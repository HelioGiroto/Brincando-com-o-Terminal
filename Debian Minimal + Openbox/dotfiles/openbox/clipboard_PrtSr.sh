#!/bin/bash
# captura tela através de seleção e salva em clipboard:
scrot -s -o /tmp/captura.png && xclip -selection clipboard -t image/png -i /tmp/captura.png
