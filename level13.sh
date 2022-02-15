#! /bin/bash

# Using private key for looging into remote machine in ssh

PASS13=$(cat ./level_pass/level13)

PASS14=$(sshpass -p "$PASS13" ssh bandit13@bandit.labs.overthewire.org -p 2220 ssh -o BatchMode=yes -o StrictHostKeyChecking=no -i ./sshkey.private bandit14@localhost  cat /etc/bandit_pass/bandit14)

tput setab 7;tput setaf 1;echo "Level 14 password: $PASS14";tput sgr0

echo "$PASS14" > ./level_pass/level14

chmod u+x level14.sh
./level14.sh
