# /bin/bash

# This program completes all the levels of bandit in overthewire
# To play this game visit https://overthewire.org/wargames/bandit/


if [ -z $1 ]
then
	echo "Usage: $0 <password>"
	exit 1
fi

EXITCODE=$(sshpass -p "$1" ssh bandit0@bandit.labs.overthewire.org -p 2220 echo "";echo $?)
if [ $EXITCODE -ne 0 ]
then
	echo "Seems the password is incorrect."
	exit 2
fi

echo "creating level_pass directory..."
mkdir ./level_pass
echo "storing password of level 0 in ~/level_pass/level0"
echo $1 > ./level_pass/level0

PASS1=$(sshpass -p "bandit0" ssh bandit0@bandit.labs.overthewire.org -p 2220 cat readme)

echo "Finding the password in the server..."
echo "Found password!!"
echo "$PASS1"
echo $PASS1 > ./level_pass/level1
./level1.sh
