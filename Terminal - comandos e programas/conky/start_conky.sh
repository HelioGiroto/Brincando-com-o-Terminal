#!/bin/bash

# Este script deve ser colocado dentro de autostart de /.config/openbox
# Autor: Helio Giroto

conky -p 2 -c /etc/conky/conky_info &

conky -p 2 -c /etc/conky/conky_shortcuts &
