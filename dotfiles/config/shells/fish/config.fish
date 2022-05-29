if status is-interactive
    set CONFIG $HOME/code/useful-things/dotfiles/config/shells/fish
    source $CONFIG/fish_aliases.fish
    source $CONFIG/fish_commands.fish
    sudo hwclock -s
  if status is-interactive and not set -q TMUX
    tmux new-session -A -s main
  end
end