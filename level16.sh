#! /bin/bash

# Use of nc ncat commands.

PASS16=$(cat ./level_pass/level16)

PORTS=$(sshpass -p "$PASS16" ssh bandit16@bandit.labs.overthewire.org -p 2220 "nc -z -v localhost 31000-32000 2>&1 | cut -d ' ' -f 3")

for i in $PORTS
do
	echo $i
	TST=$(sshpass -p "$PASS16" ssh bandit16@bandit.labs.overthewire.org -p 2220 "yes '\n' | openssl s_client -connect localhost:${i} 2>&1 | grep 'Extended master secret: yes' > /dev/null && echo 'yes'")

	if [ "$TST" = "yes" ]
	then
		KEY=$(sshpass -p "$PASS16" ssh bandit16@bandit.labs.overthewire.org -p 2220 "yes 'cluFn7wTiGryunymYOu4RcffSxQluehd' | ncat --ssl localhost ${i} | grep -v 'Correct!'")
		sshpass -p "$PASS16" ssh bandit16@bandit.labs.overthewire.org -p 2220 "$KEY" > /tmp/key;chmod go-r /tmp/key
		break
	fi
done

PASS17=$(sshpass -p "$PASS16" ssh bandit16@bandit.labs.overthewire.org -p 2220 ssh -o BatchMode=yes -o StrictHostKeyChecking=no -i /tmp/key bandit17@localhost  cat /etc/bandit_pass/bandit17)

tput setab 7;tput setaf 1;echo "Level 17 password: $PASS17";tput sgr0

echo "$PASS17" > ./level_pass/level17

#chmod u+x level17.sh
#./level17.sh

