#!/bin/bash
while :; do echo -ne "$(date | awk '{print $4}' )\r"; done

# while :; do echo -ne "$(date)\r"; done

#H.G.