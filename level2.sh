# /bin/bash

# Using commands in files containing spaces

PASS2=$(cat level_pass/level2)

PASS3=$(sshpass -p "$PASS2" ssh bandit2@bandit.labs.overthewire.org -p 2220 cat "'spaces in this filename'")

echo "Level 3 password: $PASS3"
echo $PASS3 > level_pass/level3

chmod u+x ./level3.sh
./level3.sh
