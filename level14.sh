#! /bin/bash

# Use of nc command

PASS14=$(cat ./level_pass/level14)

PASS15=$(sshpass -p "$PASS14" ssh bandit14@bandit.labs.overthewire.org -p 2220 "yes "$PASS14" | nc localhost 30000" | sed -n '2p')

tput setab 7;tput setaf 1;echo "Level 15 password: $PASS15";tput sgr0

echo "$PASS15" > ./level_pass/level15

#chmod u+x level15.sh
#./level15.sh

