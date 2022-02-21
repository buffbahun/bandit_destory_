#! /bin/bash

# Use of corn and corntab

PASS21=$(cat ./level_pass/level21)

FILEPATH=$(sshpass -p "$PASS21" ssh bandit21@bandit.labs.overthewire.org -p 2220 "cat /usr/bin/cronjob_bandit22.sh | grep 'chmod' | cut -d ' ' -f 3")

PASS22=$(sshpass -p "$PASS21" ssh bandit21@bandit.labs.overthewire.org -p 2220 "cat ${FILEPATH}" )

tput setab 7;tput setaf 1;echo "Level 22 password: $PASS22";tput sgr0

echo "$PASS22" > ./level_pass/level22

chmod u+x ./level22.sh
./level22.sh
