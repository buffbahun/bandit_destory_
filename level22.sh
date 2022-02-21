#! /bin/bash

# Use of corn and corntab

PASS22=$(cat ./level_pass/level22)

FILENAME=$(sshpass -p "$PASS22" ssh bandit22@bandit.labs.overthewire.org -p 2220 "echo 'I am user bandit23' | md5sum | cut -d ' ' -f 1")

PASS23=$(sshpass -p "$PASS22" ssh bandit22@bandit.labs.overthewire.org -p 2220 "cat /tmp/${FILENAME}")

tput setab 7;tput setaf 1;echo "Level 23 password: $PASS23";tput sgr0

echo "$PASS23" > ./level_pass/level23

chmod u+x ./level23.sh
./level23.sh

