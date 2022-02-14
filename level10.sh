#! /bin/bash

# Use of base64 command for decription.

PASS10=$(cat ./level_pass/level10)

PASS11=$(sshpass -p "$PASS10" ssh bandit10@bandit.labs.overthewire.org -p 2220 base64 -d data.txt | cut -d ' ' -f 4) 

tput setab 7;tput setaf 1;echo "level 11 password: $PASS11";tput sgr0

echo $PASS11 > ./level_pass/level11

chmod u+x ./level11.sh
./level11.sh

