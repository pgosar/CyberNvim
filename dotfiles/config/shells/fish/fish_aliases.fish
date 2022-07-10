# random
alias update="sudo apt update -y && sudo apt upgrade -y"
alias ls="ls -F --color=auto --group-directories-first"
alias sl="ls -F --color=auto --group-directories-first"
alias lsa="ls -a"
alias grep="grep --color=auto"
alias ccat="pygmentize -g"
alias batch="cmd.exe /c"
alias py="python3"
alias v="nvim"
alias dora="explorer.exe ."
alias code="/mnt/c/Users/pgosa/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"

# git stuff
alias gcom="git commit -a"
alias log="git log --graph --date=relative --pretty=tformat:'%Cred%h%Creset -%C(auto) %d%Creset %s %Cgreen(%an %ad)%Creset'"
alias gst="git status"
alias amend="git commit --amend --no-edit"
alias reword="git commit --amend"
alias untrack="rm --cache"
alias uncommit="reset --soft HEAD~1"

# verbosity and prompting
alias mkdir="mkdir -pv"
alias rm="rm -iv"
alias cp="cp -iv"
alias mv="mv -iv"

# packages
alias hh="hstr"
alias yt="youtube-dl --add-metadata -ic"
alias fd="fdfind"
alias bat="batcat"
alias stmux="tmux source-file ~/.tmux.conf > /dev/null 2>&1"
