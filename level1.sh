# /bin/bash

# Destroy level 1 to get the pass for level 2.

PASS1=$(cat level_pass/level1)

PASS2=$(sshpass -p "$PASS1" ssh bandit1@bandit.labs.overthewire.org -p 2220 cat ./-)

tput setab 7;tput setaf 1;echo "Level2 password: $PASS2";tput sgr0

echo $PASS2 > level_pass/level2

./level2.sh
