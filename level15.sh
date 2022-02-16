#! /bin/bash

# Use of ncat command for ssl ports.

PASS15=$(cat ./level_pass/level15)

PASS16=$(sshpass -p "$PASS15" ssh bandit15@bandit.labs.overthewire.org -p 2220 "yes "$PASS15" | ncat --ssl localhost 30001 | sed -n '2p'")

tput setab 7;tput setaf 1;echo "Level 16 password: $PASS16";tput sgr0

echo "$PASS16" > ./level_pass/level16

chmod u+x level16.sh
./level16.sh

