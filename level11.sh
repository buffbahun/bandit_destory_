#! /bin/bash

# Use of tr command for ROT13 chyper

PASS11=$(cat ./level_pass/level11)

PASS12=$(sshpass -p "$PASS11" ssh bandit11@bandit.labs.overthewire.org -p 2220 cat data.txt | tr [N-ZA-Mn-za-m] [A-Za-z] | cut -d ' ' -f 4)

tput setab 7;tput setaf 1;echo "level 12 password: $PASS12";tput sgr0

echo $PASS12 > ./level_pass/level12

chmod u+x ./level12.sh
./level12.sh

