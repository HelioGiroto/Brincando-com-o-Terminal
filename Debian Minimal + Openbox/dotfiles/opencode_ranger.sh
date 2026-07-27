#!/bin/bash

# Comando para abrir o opencode e o ranger dentro do tmux na pasta corrente do Terminal:

# Autor: Helio Giroto

# Data: 19/05/2026

tmux new-session -d -c "$PWD" 'ranger --cmd="set viewmode multipane"' \; split-window -h -l 98% -c "$PWD" 'opencode .' \; attach-session
