#! /bin/bash

# Use of setuid bit concept

PASS19=$(cat ./level_pass/level19)

PASS20=$(sshpass -p "$PASS19" ssh bandit19@bandit.labs.overthewire.org -p 2220 "./* cat /etc/bandit_pass/bandit20")


tput setab 7;tput setaf 1;echo "Level 20 password: $PASS20";tput sgr0

echo "$PASS20" > ./level_pass/level20

chmod u+x ./level20.sh
./level20.sh
