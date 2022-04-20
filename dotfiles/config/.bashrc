#!/bin/bash

export PATH="$PATH:$HOME/code/useful-things/scripts/shell"
export PLUGIN="$HOME/.extra"
export DOTFILES="$HOME/code/useful-things/dotfiles"
export SHELL="$HOME/code/useful-things/scripts/shell"
# green prompt
PS1='\[\e[1;32m\][\u@\h \w]\$\[\e[0m\]'
# cuts directories shown in path to 3 
PROMPT_DIRTRIM=3
# disable ctrl-s ctrl-q
stty -ixon
# cd into directory by just typing name
shopt -s autocd
# infinite history
HISTSIZE= HISTFILESIZE=

# Runs batch file put as parameter
batch () {
  cmd.exe /c $1
}

# git commands
gadd () {
  git add $1 && git status
}

gcom () {
  git commit
}

# load aliases and packages
if [ -e "$SHELL/loadToBash.sh" ]; then
    source loadToBash.sh
fi