<center>CyberNvim </center>

CyberNvim is a fully-featured and incredibly easy-to-understand Neovim config.
It is a fully-featured IDE-like setup in a similar vein to
[Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and
[NvChad](https://github.com/NvChad/NvChad/tree/v2.0) but offering a
more complete and uncompromising base experience with the same ease of modification.
Its goal is to be both a ready-to-use editor and a starting point for more
advanced Neovim configuration for those who know the basics.

### Complete and uncompromisingly fantastic featureset GOOD 👍 🥰

Including but not limited to...

* Fully featured intellisense (linters, code formatters, auto-complete)!
* floating and inline function documentation (and other goodies!)
* Auto-save and formatting
* Persistent sessions and project management!
* Fancy start screen (see below)
* Amazing tabline and statusline
* File explorer and file overview (see below)
* Git integration with [lazygit](https://github.com/jesseduffield/lazygit)
(see below) and more
* Debuggers
* Aesthetic yet subtle UI enhancements (thanks [Noice](https://github.com/folke/noice.nvim)!)

### Intractable codebase BAD 👎 ☹️

Why use many lines when few do trick?

Despite offering a complete IDE-like feature set, CyberNvim's codebase is simple
, modular, and built to be broken (in a good way). It was made for people
that want the convenience of a fully-fledged Neovim configuration and the
simplicity and flexibility to make widespread changes to a codebase that
feels like they could write it themselves even as a Lua and Neovim beginner.
Furthermore, it strictly organizes code so that everything is exactly where you
would expect to find it. No dealing with keymap definitions in random plugin config
files or autocommands interspersed throughout the config!

At only 1600 lines of Lua (as of August 2023), CyberNvim is around 3-5 times
smaller than similar distributions (AstroNvim at 6.3k lines of Lua, LunarVim
at 8k, LazyVim at 5k etc.). The codebase is built to be understood in less
than 10 minutes with simple, self-documenting code and an intuitive file
structure (there are only five folders!). I would call it
SpeedyToUnderstandNvim but that doesn't have the same ring to it.

The main way it saves on line count is by using a "one size fits most"
rather than "one size fits all" approach. It is built more as a starting
point for users who require highly advanced setups, similar to
[NvChad](https://github.com/NvChad/NvChad/tree/v2.0).

It pays a surprisingly low price for the small codebase.
It remains simple to expand upon the config by sourcing extra
user-defined files or to override parts of the config such as plugins
and their configurations, main options, and keybindings.

---

CyberNvim with Onedark theme
![image](https://github.com/pgosar/CyberNvim/assets/55164602/7d22e70e-6e52-4737-8068-9335c7705098)

---

Neovim Welcome Screen

![image](https://github.com/pgosar/CyberNvim/assets/55164602/d650046e-7dc6-43df-a9c6-2eb24d1725cc)

---

Lazygit Integration
![image](https://github.com/pgosar/CyberNvim/assets/55164602/1e6dc5d5-9945-405b-9e63-0aa2afe604c3)

### Caveats

This configuration is not entirely meant to be used as is. Consider
making the following changes:

You probably don't want or need so many different language servers, taking a look
through `CyberNvim/nvim/lua/core/lsp.lua` may be a good idea.

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

* [Neovim 0.8+](https://github.com/neovim/neovim/releases/tag/stable)
* [Packer](https://github.com/wbthomason/packer.nvim) to manage plugins
* Optional Dependencies
  * [A Nerd Font](https://www.nerdfonts.com/font-downloads)
  * [Ripgrep](https://github.com/BurntSushi/ripgrep) for live grep in Telescope
  * [Lazygit](https://github.com/jesseduffield/lazygit) for the git ui
  * [Bashtop](https://github.com/aristocratos/bashtop) to manage processes

---
