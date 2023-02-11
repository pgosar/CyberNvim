# My Dotfiles

Note: If you use WSL2, checkout the WSL2 branch. It has my old setup including plenty of workarounds for everything such as fluid copy pasting between vim and windows.

A complete rewrite and overall of my vimrc in lua specifically for neovim is underway.
<hr />

## Table of Contents
1. [Intro](#intro)
2. [Installation](#installation)
3. [Dependencies](#dependencies)
4. [Contributing](#contributing)

### Intro
_Turbocharge your vim into an IDE with 550 lines of config. Make your terminal the envy of the entire town with only a few minutes of setup._

Including my configs for 

* Ranger (terminal file manager)
* Vim and Neovim (editors)
* Zsh, Bash, Fish (shells and their prompts)
* Kitty and Wezterm (terminals)
* Tmux (multiplexer)
* Microsoft's WSL2 (checkout the WSL branch)

Wondering about what features my Vim config has? Any feature you find useful in whatever IDE or other program you use, **my config has it and more**. Are you a neovim user? Fear not! my config has even more features for you to take advantage of!

A short list:

* Persistent undo
* Better autocomplete than VSCode
* floating and inline function documentation and parameter completion (and other goodies!)
* Auto-save
* Persistent sessions
* support for any of many dozens of colorschemes
* An all-in-one editor for (literally) **any** programming language, markdown, latex, and more.
* A start screen with bookmarks to your recent files/favorites
* An aesthetic colorscheme (actually one of [several dozen](https://github.com/flazz/vim-colorschemes) that you can pick and choose from), tabline, and statusline
* Super easy tab, split, and buffer navigation
* File explorer and file overview (see picture)
* Git integration
* Fuzzy file searching
* A myriad of quality of life features you will not be able to live without
* Highly Customizable. I have customized nearly everything, which means you get a template for your own customizations :) 

If my config does not have a feature you want, (it will), make an issue, and I will add it if I think it would be useful.

<hr />

Vim/Nvim Welcome Screen

![image](https://user-images.githubusercontent.com/55164602/182413717-ccb80aa5-c879-4671-9562-ebc628a7dd2d.png)

<hr />

vim/nvim with Nord theme

![image](https://user-images.githubusercontent.com/55164602/182413341-18bdc1d2-f9a0-403c-ba0e-9a15ff37d8d5.png)


<hr />

My environment that is currently using an [unmodified starship prompt](https://github.com/starship/starship), [kitty terminal](https://sw.kovidgoyal.net/kitty/), and [tmux](https://github.com/tmux/tmux)

![image](https://user-images.githubusercontent.com/55164602/182411940-805e9c36-c5c1-4688-afe7-06e04ee76495.png)

<hr />

### Installation

If you want to install my files you must first clone the respository with 

``` bash

git clone https://github.com/pgosar/dotfiles.git

```

You can then run the install script. Make it executable and run with 

```bash

chmod +x ./install.sh ; ./install.sh

```

If you don't want all my files, you can easily remove the lines that remove and then link the files that you do not want to replace. Each file is installed on a per-file basis, making it easy for you to pick and choose what you want. Keep in mind that to get my aliases and Powerlevel 10k config, you have to also download the files located [here](https://github.com/pgosar/dotfiles/tree/main/dotfiles/other)

<hr />

### Dependencies
My vimrc requires [vim-plug](https://github.com/junegunn/vim-plug). Look at its README for details on usage. Refer to [CoC's README](https://github.com/neoclide/coc.nvim) for details on using the LSP provider.

zsh requires [powerline](powerline/powerline) with the [Meslo nerd font](https://github.com/ryanoasis/nerd-fonts) and [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)

fish requires [tide](https://github.com/ilanCosman/tide)

tmux requires [tpm](https://github.com/tmux-plugins/tpm)

You can refer to the repositories linked above for download instructions, and be sure to give them your support!

<hr />


### Contributing
I welcome contributions if you know of any useful features that I may be missing out on. Feel free to make issues if you find any bugs, have troubles installing or using my files, or have any other concerns.
