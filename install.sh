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
rm -f ~/.config/i3/config
rm -f ~/.config/i3/i3blocks.conf
rm -f ~/.config/i3/keybindings
rm -rf ~/.config/i3/scripts/
rm -f ~/.config/i3blocks/config
rm -f ~/.config/i3status/config
rm -f ~/.config/rofi/arc_dark_colors.rasi
rm -f ~/.config/rofi/arc_dark_transparent_colors.rasi
rm -f ~/.config/rofi/config.rasi
rm -f ~/.config/rofi/power-profiles.rasi
rm -f ~/.config/rofi/powermenu.rasi
rm -f ~/.config/rofi/rofidmenu.rasi
rm -f ~/.config/rofi/rofikeyhint.rasi

mkdir ~/.config/fish
mkdir ~/.config/ranger
mkdir ~/.config/kitty
mkdir ~/.config/nvim
mkdir ~/.config/i3
mkdir ~/.config/i3blocks
mkdir ~/.config/i3status
mkdir ~/.config/rofi


# ranger
ln -s ~/code/useful-things/dotfiles/config/rc.conf ~/.config/ranger/rc.conf

# kitty and wezterm terminals
ln -s ~/code/useful-things/dotfiles/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/code/useful-things/dotfiles/config/kitty/nord.conf ~/.config/kitty/nord.conf
ln -s ~/code/useful-things/dotfiles/config/wezterm.lua ~/.wezterm.lua

# shells
ln -s ~/code/useful-things/dotfiles/config/shells/bashrc ~/.bashrc
ln -s ~/code/useful-things/dotfiles/config/shells/zshrc ~/.zshrc
ln -s ~/code/useful-things/dotfiles/config/shells/profile ~/.profile
ln -s ~/code/useful-things/dotfiles/config/shells/fish/config.fish ~/.config/fish/config.fish
ln -s ~/code/useful-things/dotfiles/config/shells/fish/fish_aliases.fish ~/.config/fish/fish_aliases.fish
ln -s ~/code/useful-things/dotfiles/config/shells/fish/fish_commands.fish ~/.config/fish/fish_commands.fish
ln -s ~/code/useful-things/dotfiles/config/shells/fish/fish_plugins ~/.config/fish/fish_plugins
ln -s ~/code/useful-things/dotfiles/config/shells/fish/fish_variables ~/.config/fish/fish_variables

# neovim and vim
ln -s ~/code/useful-things/dotfiles/config/vim-nvim/vimrc ~/.vimrc
ln -s ~/code/useful-things/dotfiles/config/vim-nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/code/useful-things/dotfiles/config/vim-nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# i3
ln -s ~/code/useful-things/dotfiles/config/i3/i3/config ~/.config/i3/config
ln -s ~/code/useful-things/dotfiles/config/i3/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
ln -s ~/code/useful-things/dotfiles/config/i3/i3/keybindings ~/.config/i3/keybindings
ln -s ~/code/useful-things/dotfiles/config/i3/i3/scripts ~/.config/i3/scripts
ln -s ~/code/useful-things/dotfiles/config/i3/i3blocks/config ~/.config/i3blocks/config
ln -s ~/code/useful-things/dotfiles/config/i3/i3status/config ~/.config/i3status/config

# rofi
ln -s ~/code/useful-things/dotfiles/config/rofi/arc_dark_colors.rasi ~/.config/rofi/arc_dark_colors.rasi
ln -s ~/code/useful-things/dotfiles/config/rofi/arc_dark_transparent_colors.rasi ~/.config/rofi/arc_dark_transparent_colors.rasi
ln -s ~/code/useful-things/dotfiles/config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -s ~/code/useful-things/dotfiles/config/rofi/power-profiles.rasi ~/.config/rofi/power-profiles.rasi
ln -s ~/code/useful-things/dotfiles/config/rofi/powermenu.rasi ~/.config/rofi/powermenu.rasi
ln -s ~/code/useful-things/dotfiles/config/rofi/rofidmenu.rasi ~/.config/rofi/rofidmenu.rasi
ln -s ~/code/useful-things/dotfiles/config/rofi/rofikeyhint.rasi ~/.config/rofi/rofikeyhint.rasi

# other
ln -s ~/code/useful-things/dotfiles/config/gitconfig ~/.gitconfig
