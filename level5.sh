# bin/bash

# Level 5, find a file with 1033 bytes of size, human readable(ASCII text file) and not executable.

PASS5=$(cat level_pass/level5)

DIRS=$(sshpass -p "$PASS5" ssh bandit5@bandit.labs.overthewire.org -p 2220 ls -1 ./inhere/)

for i in $DIRS
do
	sshpass -p "$PASS5" ssh bandit5@bandit.labs.overthewire.org -p 2220 ls -lA ./inhere/${i} | grep '1033'
	EXT_CODE=$?
	if [ $EXT_CODE -eq 0 ]
	then
		FILE_NAME=$(sshpass -p "$PASS5" ssh bandit5@bandit.labs.overthewire.org -p 2220 ls -lA ./inhere/${i} | grep '1033'| tr -s ' ' | cut -d ' ' -f 9)
		ABS_PATH="./inhere/${i}/${FILE_NAME}"
		echo "The file is located in: $ABS_PATH"
		PASS6=$(sshpass -p "$PASS5" ssh bandit5@bandit.labs.overthewire.org -p 2220 cat ${ABS_PATH})
		tput setab 7;tput setaf 1;echo "Level 6 password: ${PASS6}$(tput sgr0)";
		echo $PASS6 > ./level_pass/level6
		break
	fi
done

#chmod u+x ./level6.sh
#./level6.sh
