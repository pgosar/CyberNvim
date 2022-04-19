#!/bin/bash

export PATH="$PATH:~/code/useful-things/scripts/shell"
# green prompt
PS1='\[\e[1;32m\][\u@\h \w]\$\[\e[0m\]'
# cuts directories shown in path to 3 
PROMPT_DIRTRIM=3

. ~/.extra/z.sh

# Syncs WSL system time
sudo hwclock -s
# Runs batch file put as parameter
batch () {
  cmd.exe /c $1
}

# runs git add with file(s) put as paramater
gadd () {
  git add $1 && git status
}

gcom () {
  git commit -m "$1" && git push
}

# Other

alias update="sudo apt update -y && sudo apt upgrade -y"
alias ls="ls --color=auto"
alias sl="ls --color=auto"
alias rm="rm -i"
alias dora="explorer.exe ."
alias sbash=". ~/.bashrc"