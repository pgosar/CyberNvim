#!/usr/bin/env bash

# random
alias \
update="sudo apt update -y && sudo apt upgrade -y" \
ls="ls -F --color=auto --group-directories-first" \
sl="ls -F --color=auto --group-directories-first" \
lsa="ls -A" \
grep="grep --color=auto" \
py="python3" \
v="nvim" \
dora="explorer.exe ." \

# git stuff
alias \
gcom="git commit -a" \
log="git log --graph --date=relative --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset'" \
gst="git status" \
amend="git commit --amend --no-edit" \
reword="git commit --amend" \
untrack="git rm --cache" \
uncommit="git reset --soft HEAD^"

# verbosity and prompting
alias \
mkdir="mkdir -pv" \
rm="rm -iv" \
cp="cp -iv" \
mv="mv -iv"

# packages
alias \
${ZSHZ_CMD:-${_Z_CMD:-z}}='zshz 2>&1' \
hh="hstr" \
yt="youtube-dl --add-metadata -ic" \
fd="fdfind" \
mux="tmuxinator" \
ling="github-linguist --breakdown" \
mlp="mlp --no-browser"

eval $(thefuck --alias)
