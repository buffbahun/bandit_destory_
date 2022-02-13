# bin/bash

# Level 3, finding hidden files with ls -a

PASS3=$(cat level_pass/level3)

PASS4=$(sshpass -p "$PASS3" ssh bandit3@bandit.labs.overthewire.org -p 2220 cat inhere/.hidden)

tput setab 7;tput setaf 1;echo "Level 4 password: $PASS4";tput sgr0
echo $PASS4 > level_pass/level4
chmod u+x level4.sh
./level4.sh
