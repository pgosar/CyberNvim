# intallation file for my dotfiles. Git clone this repo and run this file to install all the dotfiles.
# this will only rewrite these specific files instead of removing every file in the folder

# remove files so they can be replaced
rm -f ~/.config/ranger/rc.conf
rm -f ~/.config/kitty/kitty.conf
rm -f ~/.config/kitty/nord.conf
rm -f ~/.wezterm.lua
rm -f ~/.bashrc
rm -f ~/.zshrc
rm -f ~/.profile
rm -f ~/.config/fish/config.fish
rm -f ~/.config/fish/fish_aliases.fish
rm -f ~/.config/fish/fish_commands.fish
rm -f ~/.config/fish/fish_plugins.fish
rm -f ~/.config/fish/fish_variables
rm -f ~/.vimrc
rm -f ~/.config/nvim/init.vim
rm -f ~/.config/nvim/coc-settings.json
rm -f ~/.gitconfig


# ranger
ln ~/.config/ranger/rc.conf ~/code/useful-things/dotfiles/config/rc.conf

# kitty and wezterm terminals
ln ~/.config/kitty/kitty.conf ~/code/useful-things/dotfiles/config/kitty/kitty.conf
ln ~/.config/kitty/nord.conf ~/code/useful-things/dotfiles/config/kitty/nord.conf
ln ~/.wezterm.lua ~/code/useful-things/dotfiles/config/wezterm.lua

# shells
ln ~/.bashrc ~/code/useful-things/dotfiles/config/shells/bashrc
ln ~/.zshrc ~/code/useful-things/dotfiles/config/shells/zshrc
ln ~/.profile ~/code/useful-things/dotfiles/config/shells/profile
ln ~/.config/fish/config.fish ~/code/useful-things/dotfiles/config/shells/fish/config.fish
ln ~/.config/fish/fish_aliases.fish ~/code/useful-things/dotfiles/config/shells/fish/fish_aliases.fish
ln ~/.config/fish/fish_commands.fish ~/code/useful-things/dotfiles/config/shells/fish/fish_commands.fish
ln ~/.config/fish/fish_plugins ~/code/useful-things/dotfiles/config/shells/fish/fish_plugins
ln ~/.config/fish/fish_variables ~/code/useful-things/dotfiles/config/shells/fish/fish_variables

# neovim and vim
ln ~/.vimrc ~/code/useful-things/dotfiles/config/vim-nvim/vimrc
ln ~/.config/nvim/init.vim ~/code/useful-things/dotfiles/config/vim-nvim/init.vim
ln ~/.config/nvim/coc-settings.json ~/code/useful-things/dotfiles/config/vim-nvim/coc-settings.json

# other
ln ~/.gitconfig ~/code/useful-things/dotfiles/config/gitconfig
