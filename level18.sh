#! /bin/bash

# Direct command execution in ssh for remote server

PASS18=$(cat ./level_pass/level18)

PASS19=$(sshpass -p "$PASS18" ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme) 


tput setab 7;tput setaf 1;echo "Level 19 password: $PASS19";tput sgr0

echo "$PASS19" > ./level_pass/level19

chmod u+x ./level19.sh
./level19.sh

