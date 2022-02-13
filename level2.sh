# /bin/bash

# Using commands in files containing spaces

PASS2=$(cat level_pass/level2)

PASS3=$(sshpass -p "$PASS2" ssh bandit2@bandit.labs.overthewire.org -p 2220 cat "'spaces in this filename'")

tput setab 7;tput setaf 1;echo "Level 3 password: $PASS3";tput sgr0
echo $PASS3 > level_pass/level3

chmod u+x ./level3.sh
./level3.sh
