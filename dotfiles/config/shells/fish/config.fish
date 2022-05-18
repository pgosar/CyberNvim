if status is-interactive
    set CONFIG $HOME/code/useful-things/dotfiles/config/shells/fish
    source $CONFIG/fish_aliases.fish
    source $CONFIG/fish_commands.fish
    sudo hwclock -s
end
