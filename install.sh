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

mkdir ~/.config/fish
mkdir ~/.config/ranger
mkdir ~/.config/kitty
mkdir ~/.config/nvim


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

# other
ln -s ~/code/useful-things/dotfiles/config/gitconfig ~/.gitconfig 
