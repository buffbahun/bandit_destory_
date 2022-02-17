#! /bin/bash

# Use of diff command

PASS17=$(cat ./level_pass/level17)

PASS18=$(sshpass -p "$PASS17" ssh bandit17@bandit.labs.overthewire.org -p 2220 diff passwords.new passwords.old | grep '<' | cut -d ' ' -f 2)


tput setab 7;tput setaf 1;echo "Level 18 password: $PASS18";tput sgr0

echo "$PASS18" > ./level_pass/level18

chmod u+x ./level18.sh
./level18.sh
