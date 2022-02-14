#! /bin/bash

# Level 6, use of find command.

PASS6=$(cat ./level_pass/level6)

FILE=$(sshpass -p "$PASS6" ssh bandit6@bandit.labs.overthewire.org -p 2220 ls -RlA / 2> /dev/null | tr -s ' ' | grep 'bandit7 bandit6 33' | cut -d ' ' -f 9)

ABS_PATH=$(sshpass -p "$PASS6" ssh bandit6@bandit.labs.overthewire.org -p 2220 find / -name $FILE 2> /dev/null ) 

PASS7=$(sshpass -p "$PASS6" ssh bandit6@bandit.labs.overthewire.org -p 2220 cat $ABS_PATH) 

tput setab 7;tput setaf 1;echo "Level 7 password: $PASS7";tput sgr0
echo $PASS7 > ./level_pass/level7

chmod u+x ./level7.sh
./level7.sh

