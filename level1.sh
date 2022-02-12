# /bin/bash

# Destroy level 1 to get the pass for level 2.

PASS1=$(cat level_pass/level1)

PASS2=$(sshpass -p "$PASS1" ssh bandit1@bandit.labs.overthewire.org -p 2220 cat ./-)

echo "Level2 password: $PASS2"

echo $PASS2 > level_pass/level2

exit 0
