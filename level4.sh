# bin/bash

# Level 4, finding hidden files containg ascii using file command

PASS4=$(cat level_pass/level4)

echo $(sshpass -p "$PASS4" ssh bandit4@bandit.labs.overthewire.org -p 2220 "file inhere/*| grep 'ASCII'")

PASS5=$(sshpass -p "$PASS4" ssh bandit4@bandit.labs.overthewire.org -p 2220 cat inhere/-file07) 

tput setab 7;tput setaf 1;echo "Level 5 password: $PASS5";tput sgr0
echo $PASS5 > level_pass/level5

chmod u+x level5.sh
./level5.sh

