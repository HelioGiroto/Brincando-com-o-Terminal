#!/bin/bash

clear
for l in $(seq 1 30)
do
	tput cup $l 1
	echo "v"
done


for c in $(seq 1 80)
do
	tput cup 30 $c
	echo ">"
done


for l1 in $(seq 30 -1 2)
do
	tput cup $l1 81
	echo "^"
done


for c1 in $(seq 81 -1 1)
do
	tput cup 1 $c1
	echo "<"
done

tput cup 15 35; echo "Olá, FATIMA!"; tput cup 49 1; sleep 2

tput cup 41 1
