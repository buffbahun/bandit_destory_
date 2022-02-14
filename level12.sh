#! /bin/bash

# Use of tr command for ROT13 chyper

PASS12=$(cat ./level_pass/level12)

FILE=$(sshpass -p "$PASS12" ssh bandit12@bandit.labs.overthewire.org -p 2220 cat data.txt) 

mkdir tmp
echo "$FILE" > ./tmp/data.txt

xxd -r ./tmp/data.txt > ./tmp/data
rm ./tmp/data.txt

mkdir ./tmp/proc

while true
do
	TYPE=$(file ./tmp/data | cut -d ' ' -f 2)
	if [ "$TYPE" = "gzip" ]
	then
		mv ./tmp/data ./tmp/proc/data.gz
		gzip -d ./tmp/proc/data.gz
		mv ./tmp/proc/* ./tmp/data
		#echo "gzip"
	fi

	if [ "$TYPE" = "bzip2" ]
	then
		mv ./tmp/data ./tmp/proc/data.bz2
		bzip2 -d ./tmp/proc/data.bz2
		mv ./tmp/proc/* ./tmp/data
		#echo "bzip2"
	fi

	if [ "$TYPE" = "POSIX" ]
        then
                mv ./tmp/data ./tmp/proc/data.tar
                tar xfv ./tmp/proc/data.tar --directory=./tmp/proc/
		rm ./tmp/proc/data.tar
                mv ./tmp/proc/* ./tmp/data
		#echo "tar"
        fi

	if [ "$TYPE" = "ASCII" ]
        then
		PASS13=$(cat ./tmp/data | cut -d ' ' -f 4)
		#echo "yes"
		rm -r ./tmp
		break
        fi

done


tput setab 7;tput setaf 1;echo "level 13 password: $PASS13";tput sgr0

echo $PASS13 > ./level_pass/level13

#chmod u+x ./level13.sh
#./level13.sh

