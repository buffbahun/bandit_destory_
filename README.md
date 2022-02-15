# Destroy Bandit

This is my new project for exploring linux, terminal, shell and shell scripting. Overthewire is a great website for learning linux and unix-like operating system basics and bandit is the most user friendly one. In this project I will first manually solve the challanges in bandit. And, then I will create a bash script for automating this hack.Below is the process by which I have solved the particular level denoted by level(1..33).

## Level 0

The password is provided in the site as a entry point, which is bandit0. Here we use ssh for loging to the remote server. The command is:
 ssh bandit0@bandit.labs.overthewire.org -p 2220
look man page for ssh, here -p is the port number. This will prompt you to enter password where you can enter bandit0.
 And here we are logged in to the remote server as bandit0.

## Level 1

After logging in as bandit1, we can ls. There is a readme amed file. Output the content of the file using cat command. cat <file>
Wallah!! This is the password to the next level.

## Level 2

After logging in as bandit2, we can ls to see a file '-'. As the shell interprater and the cat command interprates '-' as a flag indecator, it doesn't process the file. So a simple hack for this problem is providing the full path of the file or using './' with expands to current working directory.

## Level 3

After logging in as bandit3, we can ls to see a file 'spaces in this file name' named file. So the challange is to open the file which has spaces. Because commands will treat every words of the file name as different arguments. We can use single or double quotes to encapsuate the spaced filename or use '\' before spaces to avoid/neglate spaces. Eg:
command file\ with\ spaces
or
command 'file with spaces'
using cat on this file with the above hack will output the password.

## Level 4

After logging in as bandit4, we can ls to see a directory 'inhere'. cd to 'inhere' directory and hit the command 'ls -a'. The ls command list the current directory if no file/directory path is given as argument. And the -a flag outputs all the files and directories in the present directory including files and directory starting with '.'. The file is found named '.hidden'. 

## Level 5

After logging in as bandit5, we can ls to see a directory 'inhere'. cd to 'inhere' to directory and hit ls. The ls command list all the directories. There are 19 directories each containg many file. So manually searching the required file is tedious. The challange specifies that the pass file is 1033 bytes is size, is not executable and is human readable(ASCII text). I have applied a for loop in all the directoris and long listed all the files on that particular directory to long list all the file. Then a grep is piped do that we can get the line containg '1033' which is the size of the file. Luclily there was only one file with this size. And it was both not executable and ascii text file. Cat to the file ouptup the require pass for bandit 6. 

## Level 6

After logging in as bandit6, we see no files in the current directory. According to the level challange, the pass file is somewhere in the server with has such properties:
owned by user bandit7 and group bandit6
33 bytes in size
So, I ls the root with -R flag which list recursively. I piped the ls command on root with grep so that files with owner bandit7, group owner bandit6 and 33. The oupput gave the file name. Now to find the path of the file name, I used find command to search starting at root. The ouptup of the command gave the absolute path for that file. Now applying cat to the full path of the file gives the pass form lext level, Level 7.

## Level 7

After logging in as bandit7, we can see a file named data.txt, which is a regular ascii file. The file consist of very long lines of words. Each line consists of two words separated by space/tab. According to the level, The pass for level8 is located next to the word "millionth" on the file. 
For this level we can use grep command for searching the specific word in the file. Using grep on the file with the 'millionth' as a string to search gives the appropriate line that contatins the word 'millionth'. Now the word next to millionth is the pass.

## Level 8

After logging in as bandit8, we can see a file named data.txt, which is a regular ascii file with long list of words. According to this level, the pass for level9 is located in this file which is the only unique word across the entire lines in the file.
For this level we can use uniq command which gives the unique lines in a specific file. But for finding any unique words the file should be sorted so that same words are next to each other. So we pipe the file to sort command which sorts the file making same words sitting next to each other. Now piping sort to uniq with -q flag set, unique lines are printed on the output. We got a line which is the pass for level 9.

## Level 9

After logging in as bandit9, we can see a file named data.txt, which is a data file with jargon of unrecognizable texts and some ascii texts spreaded across the file. According to this level, the pass for level10 is located in this file somewhere as human-readable strings, preceded by several '=' characters.
For this level we can use the strings command for outputing only human readable text of the file. Then a long list of strings are outputed. Now we can use grep for locating our string by making a pattern of may '=====. After piping grep along with strings command, the output gives pass for level 10.

## Level 10

After logging in as bandit10, we can see a file named data.txt, which is a regular file. This file contains base64 encoded data of our pass.
For this level we can use base64 command which when used with -d flag decrypts the data to its original for. Thus we can get the pass for level 11.

## Level 11

After logging in as bandit11, we can see a file named data.txt, which is a regular ascii text file. This file contains some text. According to the level the text in the file is the transformed file by rotating every alphabet in the the original text by 13 positions.

For this level we can use tr command which transforms text in a file. As the text is transformed by 13, a letter "a/A" is transformed to "n". Using this logic we can:
tr \[N-ZA-Mn-za-m\] \[A-Za-z\]
Now applying this will decrypt the file into its original form. Now we can get the pass for level 12.

## Level 12 

After logging in as bandit12, we can see a file named data.txt, which is zgip compressed file. According to this level the original file which contains the pass is severly modified by repetedly compressing.
For this level first we use xxd command with -r flag to convert the hexdump to binary file. We can use gzip, bzip2 and tar commands with appropriate flags for uncompressing the file. But for the unziping commands to work the extensions of the file should be ended with the appropriate name(gz/bz2/tar). Using file command for finding the type of compression used and renaming the file with the appropriate extensions with mv command several times will give us a ascii file which contains the pass for level 13.

## Level 13

After logging in as bandit13, we can ls and see a private key file named sshkey.private. This file contains the private ssh key for this remote machine. according to this level we can use this private key file to directly login to level14 as bandit14 and get the pass for level14 at /etc/bandit\_pass/bandit14.
 For this level we can use the ssh commannd with -i flag which gives us the option for loging to the remote mchine with a private key file. Using this command we log into bandit14 and with the path provided above we can get the pass for level 14.

## Level 15

After logging in as bandit14, we can use nc commnd for listining to differet ports. According to this level we can nc to port 30000 in localhost. And providing the pass of this level will output the pass for level 15.
nc localhost 30000
