<h1 align="center">CyberNvim</h1>

<h3 align="center"><b>CyberNvim is the world's simplest and most extensible
fully-fledged Neovim distribution.</b></h3>

![image](https://github.com/pgosar/CyberNvim/assets/55164602/15020588-441d-4ddc-aef3-2bf37e0d7ae1)
<h5 align="center"><b>CyberNvim Start Screen</b></h5>

![image](https://github.com/pgosar/CyberNvim/assets/55164602/003c1a80-ea0a-4af4-b1bd-5d0b6729b1c5)
<h5 align="center"><b>Text editor view</b></h5>

![image](https://github.com/pgosar/CyberNvim/assets/55164602/ef8bb684-9b85-4afe-81c0-d254100d0db1)
<h5 align="center"><b>Debugging UI and the Lazygit integration superimposed on top</b></h5>


</br>
<h3 align="center"><b>Where simplicity meets power</b></h3>

CyberNvim is...

* Simple and Extensible
* Uncompromising in its [featureset](#fantastic-featureset-good--)

CyberNvim is a fully-featured and incredibly easy-to-understand Neovim config.
It is a fully-featured IDE-like setup with the same ease of modification as
[Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) but offering the
more complete and uncompromising base experience of
[Astronvim](https://github.com/AstroNvim/AstroNvim/tree/main) and
[LazyNvim](https://github.com/LazyVim/LazyVim).
Its goal is to be both a ready-to-use editor for everyone, a great starting
point for powerusers who want the freedom to possibly overwrite the entire config,
and a great example for beginners who want to learn how to configure Neovim.

CyberNvim is the most simple and extensible Neovim configuration. At only 1200 lines of
code, it is the smallest major Neovim distribution. As the user, you are
given the power to go so far as to remove almost every change CyberNvim makes and be left with base Neovim. CyberNvim lets you go farther than **any** other distribution so you
can truly make your Neovim yours.

<h3 align="center"><b>Intractable codebase BAD 👎 ☹️</b></h3>

Why use many lines when few do the trick?

* Only <b>1200</b> lines of code
* Built to be broken
* <b>Zero</b> compromises in available features
* <b>Minimal</b> learning curve
* Plug and go personal configuration

Despite offering a complete IDE-like feature set, CyberNvim's codebase is simple,
modular, and built to be broken (in a good way). It was made for people
who want the convenience of a fully-fledged Neovim configuration and the
simplicity and flexibility to make widespread changes even as a beginner programmer.
Strict and intuitive code organization makes the codebase especially easy to
understand.

At only 1200 lines of Lua (as of December 2023), CyberNvim is around 5-7 times
smaller than similar distributions (AstroNvim at 6.3k lines of Lua, LunarVim
at 8k, LazyVim at 5k etc.). The codebase is built to be understood in less
than 10 minutes with simple, self-documenting code and an intuitive file
structure. I would call it SpeedyToUnderstandNvim but that doesn't have
the same ring to it.

The codebase mainly saves on line count by minimizing unnecessary
abstractions wherever possible. One of CyberNvim's goals is to maintain a
minimalistic codebase with a style similar to what many create as their own
personal configuration rather than what one would expect in a large
software project. This approach is similar to
[NvChad](https://github.com/NvChad/NvChad/tree/v2.0).

Furthermore, to lower the learning curve of using the distribution, it avoids
completely overhauling Neovim and the included plugins wherever it does not detract
from the experience of using CyberNvim. As such, the distribution is easy to learn
and should feel familiar to most people. With this in mind, the distribution takes
care to ensure that every part of the configuration is easily understandable, extendable,
and rewriteable for those that love tailoring every inch of their setup to their specific tastes.

<b>User configuration can be as simple as copy-pasting your current configuration in the
[user conf section](https://github.com/pgosar/CyberNvim/wiki/Configuration#predefined-sections).</b>

<h3 align="center"><b>Fantastic featureset GOOD 👍 🥰</b></h3>

Including but not limited to...

* Incredibly fast speeds!
* Fully featured intellisense (linters, code formatters, auto-complete, code actions)!
* floating and inline function documentation, hover support, etc.
* Auto-save and formatting
* Persistent and configurable sessions and project management!
* Fancy start screen
* Amazing tabline and statusline
* File explorer and file overview for functions, classes, etc.
* Git integration with [lazygit](https://github.com/jesseduffield/lazygit)
and more
* Complete inbuilt debugging support
* Aesthetic UI enhancements!
* Complete freedom to rewrite the config as you see fit
* Incredibly easy [user configuration](https://github.com/pgosar/CyberNvim-Configuration) setup!

### Installation and Configuration
First, backup (rename, move etc.) your existing nvim configuration.
Clone the repository and symlink it with your `~/.config/nvim` directory with

``` bash
git clone https://github.com/pgosar/CyberNvim
ln -s ~/path/to/CyberNvim ~/.config/nvim
```

Alternatively, directly clone it to the nvim folder:
```bash
git clone https://github.com/pgosar/CyberNvim ~/.config/nvim
```

Your personal configuration is housed in `user/user_config.lua`. Use `example_user_config.lua`
as a guide to writing your own configuration. As an initial quickstart, I recommend
running the following commands:
```bash
mkdir -pv ~/.config/nvim/lua/user
cp ~/.config/nvim/lua/example_user_config.lua ~/.config/nvim/lua/user/user_config.lua
```
Alternatively, you can also take a look at my own
[configuration](https://github.com/pgosar/CyberNvim-Configuration.git). Simply
clone this as your user folder.
```bash
git clone https://github.com/pgosar/CyberNvim-Configuration.git ~/.config/nvim/lua/user
```

If you want to backup your personal configuration to git I suggest doing the following.
The user folder is gitignored, meaning you can create a new git repository under that folder
. CyberNvim will never push changes to your configuration files - at most it will update example_user_config.
```bash
cd ~/.config/nvim/lua/user
git init
# setup repository
```

Once done, Install any language servers, linters, etc. using `:MasonInstall`
and/or `:LspInstall`. Use `:CyberUpdate` to update the distribution, including all
plugins and parsers. Run `:checkhealth` to find any common issues with the installation.

Beyond this, if you want to plug your current configuration in, it can be as simple as requiring all your files
in the allotted user configuration function (see the
[example](https://github.com/pgosar/CyberNvim/blob/main/lua/example_user_config.lua)).

For more information, be sure to check the repository's wiki.

### Dependencies

* [Neovim 0.10.0+, built with LuaJIT](https://github.com/neovim/neovim/releases/tag/stable)
* Optional Dependencies
  * [A Nerd Font](https://www.nerdfonts.com/font-downloads)
  * [Ripgrep](https://github.com/BurntSushi/ripgrep) for live grep in Telescope
  * [Lazygit](https://github.com/jesseduffield/lazygit) for the git ui
  * [Bashtop](https://github.com/aristocratos/bashtop) to manage processes


### Acknowledgements

[Astronvim](https://github.com/AstroNvim/AstroNvim/tree/main) and
[LazyNvim](https://github.com/LazyVim/LazyVim) are two fantastic Neovim distributions that provided
the inspiration for this project. They significantly raised the bar for what a modern, fully-fledged
Neovim distribution should offer.
