#! /bin/bash

# Use of nc command.

PASS20=$(cat ./level_pass/level20)

sshpass -p "$PASS20" ssh bandit20@bandit.labs.overthewire.org -p 2220 "echo ${PASS20} > /tmp/c"

sshpass -p "$PASS20" ssh bandit20@bandit.labs.overthewire.org -p 2220 "echo '#!' >/tmp/sha; echo '/bin/bash' >/tmp/bsh; paste -d ' ' /tmp/sha /tmp/bsh > /tmp/shabang; echo '(nc -l -p 1500 < /tmp/c) > /tmp/herepass &' > /tmp/myscript; cat /tmp/shabang /tmp/myscript > /tmp/fullscript; chmod u+x /tmp/fullscript; /tmp/fullscript; ./suconnect 1500; cat /tmp/herepass"

PASSCHK=$(sshpass -p "$PASS20" ssh bandit20@bandit.labs.overthewire.org -p 2220 "cat /tmp/herepass")

while true
do
	PASSCHK=$(sshpass -p "$PASS20" ssh bandit20@bandit.labs.overthewire.org -p 2220 "cat /tmp/herepass")
	if [ -z "$PASSCHK" ]
	then
		sshpass -p "$PASS20" ssh bandit20@bandit.labs.overthewire.org -p 2220 "/tmp/fullscript; ./suconnect 1500"
	else
		break
	fi
done

sshpass -p "$PASS20" ssh bandit20@bandit.labs.overthewire.org -p 2220 "rm /tmp/herepass"


tput setab 7;tput setaf 1;echo "Level 21 password: $PASSCHK";tput sgr0

echo "$PASSCHK" > ./level_pass/level21

chmod u+x ./level21.sh
./level21.sh

