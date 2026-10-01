#!/bin/bash
echo "Impedindo o computador de entrar em repouso"
while true; do
  date
  xdotool key Shift_L
  sleep 240
done
