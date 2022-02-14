#! /bin/bash

# Use of strings command

PASS9=$(cat ./level_pass/level9)

PASS10=$(sshpass -p "$PASS9" ssh bandit9@bandit.labs.overthewire.org -p 2220 cat data.txt | strings | grep '&===*' | cut -d ' ' -f 2) 

tput setab 7;tput setaf 1;echo "level 10 password: $PASS10";tput sgr0

echo $PASS10 > ./level_pass/level10

chmod u+x ./level10.sh
./level10.sh

