#! /bin/bash

# Use of grep command in a file

PASS7=$(cat ./level_pass/level7)

PASS8=$(sshpass -p "$PASS7" ssh bandit7@bandit.labs.overthewire.org -p 2220 cat data.txt | grep 'millionth' | cut -f 2) 

tput setab 7;tput setaf 1;echo "level 8 password: $PASS8";tput sgr0

echo $PASS8 > ./level_pass/level8

chmod u+x ./level8.sh
./level8.sh
