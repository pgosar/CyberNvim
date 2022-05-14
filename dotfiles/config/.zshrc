export PATH="$PATH:$HOME/code/useful-things/scripts/shell:$HOME/code/useful-things/scripts/python"

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/code/useful-things/dotfiles"

ZSH_THEME="powerlevel10k/powerlevel10k"
# update reminders
zstyle ':omz:update' mode reminder
# stops them from being annoying
DISABLE_MAGIC_FUNCTIONS="true"
# dots when function is auto completing
COMPLETION_WAITING_DOTS="true" 
# stops git status from checking untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"
# sets color style
ZSH_COLORIZE_STYLE="colorful"
# disables autocorrect completely
unsetopt correct
# history
HISTSIZE=10000
SAVEHIST=10000
# edit command in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^k' edit-command-line

# load in plugins
plugins=(
  git
  copyfile
  command-not-found
  colored-man-pages
  bgnotify
  history-substring-search
  last-working-dir
  safe-paste
  vi-mode
  zsh-interactive-cd
  zsh-syntax-highlighting
  zsh-has
  zsh-z
  )
  
# load oh my zsh
source $ZSH/oh-my-zsh.sh 
# remove preset aliases
unalias -a
# load in aliases
loadpath=$DOTFILES/other/
if [ -f $loadpath/.aliasrc ]; then
    source $loadpath/.aliasrc
fi
# load in extra commands
if [ -f $loadpath/.commandsrc ]; then
    source $loadpath/.commandsrc
fi
# load theme
[[ ! -f $loadpath/.p10k.zsh ]] || source $loadpath/.p10k.zsh