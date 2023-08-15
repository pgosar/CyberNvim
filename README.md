<h1 align="center">CyberNvim</h1>

![image](https://github.com/pgosar/CyberNvim/assets/55164602/379c6126-bdf4-4c20-898e-5fa35575592c)

![image](https://github.com/pgosar/CyberNvim/assets/55164602/7d22e70e-6e52-4737-8068-9335c7705098)

![image](https://github.com/pgosar/CyberNvim/assets/55164602/1e6dc5d5-9945-405b-9e63-0aa2afe604c3)

CyberNvim is a fully-featured and incredibly easy-to-understand Neovim config.
It is a fully-featured IDE-like setup with the same ease of modification as
[Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and
[NvChad](https://github.com/NvChad/NvChad/tree/v2.0) but offering the
more complete and uncompromising base experience of
[Astronvim](https://github.com/AstroNvim/AstroNvim/tree/main) and
[LazyNvim](https://github.com/LazyVim/LazyVim).
Its goal is to be both a ready-to-use editor for 99% of people a great starting
point for powerusers who want the freedom to possibly overwrite the entire config,
and a great example for beginners who want to learn how to configure Neovim.

### Complete and uncompromisingly fantastic featureset GOOD 👍 🥰

Including but not limited to...

* Fully featured intellisense (linters, code formatters, auto-complete)!
* floating and inline function documentation (and other goodies!)
* Auto-save and formatting
* Persistent sessions and project management!
* Fancy start screen
* Amazing tabline and statusline
* File explorer and file overview (functions, classes etc.)
* Git integration with [lazygit](https://github.com/jesseduffield/lazygit)
and more
* Debuggers
* Aesthetic yet subtle UI enhancements (thanks [Noice](https://github.com/folke/noice.nvim)!)

### Intractable codebase BAD 👎 ☹️

Why use many lines when few do trick?

Despite offering a complete IDE-like feature set, CyberNvim's codebase is simple
, modular, and built to be broken (in a good way). It was made for people
that want the convenience of a fully-fledged Neovim configuration and the
simplicity and flexibility to make widespread changes even as a beginner programmer.
Strict and intuitive code organization makes the codebase especially easy to
understand.

At only 1500 lines of Lua (as of August 2023), CyberNvim is around 3-5 times
smaller than similar distributions (AstroNvim at 6.3k lines of Lua, LunarVim
at 8k, LazyVim at 5k etc.). The codebase is built to be understood in less
than 10 minutes with simple, self-documenting code and an intuitive file
structure (there are only five folders!). I would call it
SpeedyToUnderstandNvim but that doesn't have the same ring to it.

The main way it saves on line count is by using a "one size fits most"
rather than "one size fits all" approach. It is built more as a starting
point for users who require highly advanced setups. This approach is similar to
[NvChad](https://github.com/NvChad/NvChad/tree/v2.0), but CyberNvim offers a far more
complete base experience for those wanting the IDE experience.

It pays a surprisingly low price for the small codebase.
It remains simple to expand upon the config by sourcing extra
user-defined files or to override parts of the config such as plugins
and their configurations, main options, and keybindings.

### Installation and Configuration
First, backup (rename, move etc.) your existing nvim configuration.
Clone the repository and symlink it with your `~/.config/nvim` directory with

``` bash
git clone https://github.com/pgosar/CyberNvim
ln -s ~/path/to/CyberNvim/nvim ~/.config/nvim
```

Alternatively, directly clone it to the nvim folder:
```bash
git clone https://github.com/pgosar/CyberNvim ~/.config/nvim
```

If you want to backup your personal configuration to git I suggest doing the following.
Even though this is inside another git repository, it still acts as its own individual
entity as long as you're inside the folder. CyberNvim will never push changes to your
configuration files - at most it will update example_user_config.
```bash
cd ~/.config/nvim/lua/user
git init
# setup repository
```

Once done, Install any language servers, linters, etc. using `:MasonInstall`
and/or `:LspInstall`. Use `:CyberUpdate` to update all language
servers, plugins, treesitter parsers, etc. at once. Run `:checkhealth` to find
any common issues with the installation.

Your personal configuration is housed in `user/user_config.lua`. Use `user/example_user_config.lua`
as a guide to writing your own configuration. The default user configuration is the one
I personally use. Feel free to overwrite it completely!

### Dependencies

* [Neovim 0.8+, built with LuaJIT](https://github.com/neovim/neovim/releases/tag/stable)
* Optional Dependencies
  * [A Nerd Font](https://www.nerdfonts.com/font-downloads)
  * [Ripgrep](https://github.com/BurntSushi/ripgrep) for live grep in Telescope
  * [Lazygit](https://github.com/jesseduffield/lazygit) for the git ui
  * [Bashtop](https://github.com/aristocratos/bashtop) to manage processes
