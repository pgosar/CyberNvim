#!/usr/bin/env bash

# random
alias \
ls="ls -F --color=auto --group-directories-first" \
sl="ls -F --color=auto --group-directories-first" \
lsa="ls -A" \
grep="grep --color=auto" \
py="bpython" \
v="nvim" 

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
hh="hstr" \
yt="youtube-dl --add-metadata -ic" \
fd="~/.cargo/bin/fd" \
mux="tmuxinator" \
ling="github-linguist --breakdown" \
mlp="mlp --no-browser" \
icat="kitty +kitten icat" \
hg="kitty +kitten hyperlinked_grep" \
kd="kitty +kitten diff" \
save="kitty @ ls > ~/.local/kitty.app/kitty-dump.json; cat ~/.local/kitty.app/kitty-dump.json |
python3 ~/.local/kitty.app/kitty-convert-dump.py > ~/.local/kitty.app/kitty-session.kitty" \
tn="tmux new-session -s" \
ta="tmux attach-session -t" \
tl="tmux ls"

# other
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
