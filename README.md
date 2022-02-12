# Destroy Bandit

This is my new project for exploring linux, terminal, shell and shell scripting. Overthewire is a great website for learning linux and unix-like operating system basics and bandit is the most user friendly one. In this project I will first manually solve the challanges in bandit. And, then I will create a bash script for automating this hack.Below is the process by which I have solved the particular level denoted by level(1..33).

## Level 0

The password is provided in the site as a entry point, which is bandit0. Here we use ssh for loging to the remote server. The command is:
 ssh bandit0@bandit.labs.overthewire.org -p 2220
look man page for ssh, here -p is the port number. This will prompt you to enter password where you can enter bandit0.
 And here we are logged in to the remote server as bandit0.

## Level 1

After logging in as bandit0, we can ls. There is a readme amed file. Output the content of the file using cat command. cat <file>
Wallah!! This is the password to the next level.

## Level 2

After logging in as bandit1, we can ls to see a file '-'. As the shell interprater and the cat command interprates '-' as a flag indecator, it doesn't process the file. So a simple hack for this problem is providing the full path of the file or using './' with expands to current working directory.
