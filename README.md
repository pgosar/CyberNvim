### Intro

CyberNvim is a fully-featured and incredibly easy-to-understand Neovim config.
If you want a fully-featured IDE-like setup in a similar vein to
[Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) that is ready
to go, you're in the right place!

### Intractable codebase BAD 👎 ☹️

Why use many lines when few do trick?

Despite offering a complete IDE-like feature set, CyberNvim's codebase is simple
, modular, and built to be broken (in a good way). If you, like me, are tired of
crawling through thousands of lines of code searching for ways to adjust default
behavior when it could've been done in 10, this might just be the config for you!

### Complete and non-compromising featureset GOOD 👍 🥰

Including but not limited to...

* Fully featured intellisense (linters, code formatters, auto-complete)!
* floating and inline function documentation (and other goodies!)
* Auto-save
* Persistent sessions and project management!
* Fancy start screen (see below)
* Amazing tabline and statusline
* File explorer and file overview (see below)
* Git integration with [lazygit](https://github.com/jesseduffield/lazygit) (see below)
* Debuggers
* Aesthetic yet subtle UI enhancements (thanks [Noice](https://github.com/folke/noice.nvim)!)

<hr />

CyberNvim with Onedark theme
![image](https://github.com/pgosar/CyberNvim/assets/55164602/7d22e70e-6e52-4737-8068-9335c7705098)

<hr />

Neovim Welcome Screen

![image](https://github.com/pgosar/CyberNvim/assets/55164602/d650046e-7dc6-43df-a9c6-2eb24d1725cc)

<hr />

Lazygit Integration
![image](https://github.com/pgosar/CyberNvim/assets/55164602/1e6dc5d5-9945-405b-9e63-0aa2afe604c3)

### Caveats

This being my personal configuration, there are features that you may want to
remove if they are not relevant to you. Thanks to the simple codebase, this
is easy to do, but here are some starting points:

You might not need explicit wgsl file support, so you could delete the
`CyberNvim/nvim/ftdetect` directory.

You probably don't want or need so many different language servers to be
installed, taking a look through `CyberNvim/nvim/lua/core/lsp.lua` may
be a good idea.

### Installation

Clone the repository and (highly recommended) symlink the `CyberNvim/lua`
directory with your `~/.config/nvim` directory with

``` bash
git clone https://github.com/pgosar/CyberNvim
ln -s ~/path/to/CyberNvim/nvim ~/.config/nvim
```
Once done, you will need to install the plugins with `:PackerSync` install any
language servers, linters, etc. using `:MasonInstall` and/or `:LspInstall`.

There is also a `:CyberUpdate` command that I use for updating all language
servers, plugins, treesitter parsers, etc. at once.

### Dependencies

The neovim config requires [packer](https://github.com/wbthomason/packer.nvim).

<hr />

### Contributing

I welcome contributions if you know of any useful features that I may be missing
out on. Feel free to make issues if you find any bugs, have troubles installing
or using my files, or have any other concerns.
