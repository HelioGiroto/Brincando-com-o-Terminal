#!/usr/bin/env bash

# sleep 5

# Encerrar instâncias existentes
killall -q polybar

# Aguardar até que os processos sejam encerrados
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lançar a barra em cada monitor detectado
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload barra_superior &
  done
else
  polybar --reload barra_superior &
fi

# não esquecer de fazer esse script executável:
# chmod +x ~/.config/polybar/launch.sh
