#! /bin/bash

# Use of grep command in a file

PASS8=$(cat ./level_pass/level8)

PASS9=$(sshpass -p "$PASS8" ssh bandit8@bandit.labs.overthewire.org -p 2220 sort data.txt | uniq -u) 

tput setab 7;tput setaf 1;echo "level 9 password: $PASS9";tput sgr0

echo $PASS9 > ./level_pass/level9

chmod u+x ./level9.sh
./level9.sh

