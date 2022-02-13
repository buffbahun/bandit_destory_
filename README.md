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
