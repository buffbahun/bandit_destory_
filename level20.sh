#! /bin/bash

# Use of nc command.

PASS20=$(cat ./level_pass/level20)

PASS21=$(sshpass -p "$PASS20" ssh bandit20@bandit.labs.overthewire.org -p 2220 "echo ${PASS20} > /tmp/a; tmux new -d -s a; tmux send-keys -t a 'nc -l -p 1500 < /tmp/a > /tmp/b' ENTER; ./suconnect 1500; cat /tmp/b")

#sshpass -p "$PASS20" ssh bandit20@bandit.labs.overthewire.org -p 2220 tmux kill-session -t a


tput setab 7;tput setaf 1;echo "Level 21 password: $PASS21";tput sgr0

echo "$PASS21" > ./level_pass/level21

#chmod u+x ./level21.sh
#./level21.sh

