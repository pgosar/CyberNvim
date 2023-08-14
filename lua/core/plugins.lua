local enable = require("user.user_config").enable_plugins
require("lazy").setup({
  {
    "stevearc/aerial.nvim",
    cond = enable.aerial == nil or enable.aerial == true,
    cmd = "AerialToggle",
    config = function()
      require("plugin-configs.aerial")
    end,
  },
  {
    "goolord/alpha-nvim",
    cond = enable.alpha == nil or enable.alpha == true,
    lazy = false,
    config = function()
      require("plugin-configs.alpha")
    end,
  },
  {
    "okuuva/auto-save.nvim",
    cond = enable.autosave == nil or enable.autosave == true,
    event = "VeryLazy",
    config = function()
      require("plugin-configs.auto-save")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    cond = enable.bufferline == nil or enable.bufferline == true,
    lazy = false,
    config = function()
      require("plugin-configs.bufferline")
    end,
  },
  {
    "numToStr/Comment.nvim",
    cond = enable.comment == nil or enable.comment == true,
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cond = enable.copilot == nil or enable.copilot == true,
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end,
    },
    config = function()
      require("plugin-configs.copilot")
    end,
  },
  {
    "stevearc/dressing.nvim",
    cond = enable.dressing == nil or enable.dressing == true,
    event = "VeryLazy",
    config = function()
      require("plugin-configs.dressing")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    cond = enable.gitsigns == nil or enable.gitsigns == true,
    event = "VimEnter",
    config = function()
      require("plugin-configs.gitsigns")
    end,
  },
  {
    "phaazon/hop.nvim",
    cond = enable.hop == nil or enable.hop == true,
    event = "VimEnter",
    branch = "v2",
    config = function()
      require("plugin-configs.hop")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    cond = enable.indent_blankline == nil or enable.indent_blankline == true,
    event = "VimEnter",
    config = function()
      require("plugin-configs.indent-blankline")
    end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    cond = enable.inlay_hints == nil or enable.inlay_hints == true,
    event = "VeryLazy",
    config = function()
      require("lsp-inlayhints").setup()
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    cond = enable.lsp_zero == nil or enable.lsp_zero == true,
    event = { "BufReadPre", "BufNewFile" },
    branch = "v2.x",
    config = function()
      require("plugin-configs.lsp")
    end,
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    cond = enable.lualine == nil or enable.lualine == true,
    event = "VeryLazy",
    config = function()
      require("plugin-configs.lualine")
    end,
  },
  {
    "folke/neodev.nvim",
    cond = enable.neodev == nil or enable.neodev == true,
    event = "VeryLazy",
    config = function()
      require("neodev").setup()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    cond = enable.neoscroll == nil or enable.neoscroll == true,
    event = "VeryLazy",
    config = function()
      require("plugin-configs.neoscroll")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cond = enable.neotree == nil or enable.neotree == true,
    cmd = "Neotree",
    branch = "main",
    init = require("core.utils.utils").open_neotree,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "Shatur/neovim-session-manager",
    cond = enable.session_manager == nil or enable.session_manager == true,
    event = "VimEnter",
    config = function()
      require("plugin-configs.session")
    end,
  },
  {
    "folke/noice.nvim",
    cond = enable.noice == nil or enable.noice == true,
    event = "VimEnter",
    config = function()
      require("plugin-configs.noice")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    cond = enable.null_ls == nil or enable.null_ls == true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugin-configs.null-ls")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "jay-babu/mason-null-ls.nvim",
        cmd = { "NullLsInstall", "NullLsUninstall" },
        config = function()
          require("plugin-configs.mason-null-ls")
        end,
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    cond = enable.autopairs == nil or enable.autopairs == true,
    event = "InsertEnter",
    config = function()
      require("plugin-configs.autopairs")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    cond = enable.cmp == nil or enable.cmp == true,
    event = "InsertEnter",
    config = function()
      require("plugin-configs.cmp")
    end,
    dependencies = {
      { "onsails/lspkind.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" },
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  },
  { "NvChad/nvim-colorizer.lua", cond = enable.colorizer, event = "VimEnter" },
  {
    "mfussenegger/nvim-dap",
    cond = enable.dap == nil or enable.dap == true,
    event = "VeryLazy",
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
          require("mason-nvim-dap").setup()
        end,
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    cond = enable.notify == nil or enable.notify == true,
    lazy = false,
    config = function()
      require("plugin-configs.notify")
    end,
  },
  {
    "kylechui/nvim-surround",
    cond = enable.surround == nil or enable.surround == true,
    cmd = "VimEnter",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cond = enable.treesitter == nil or enable.treesitter == true,
    event = { "BufReadPost", "BufNewFile" },
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("plugin-configs.treesitter")
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
          require("treesitter-context").setup()
        end,
      },
      { "windwp/nvim-ts-autotag" },
      { "HiPhish/nvim-ts-rainbow2" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    cond = enable.ufo == nil or enable.ufo == true,
    event = "VimEnter",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("ufo").setup()
    end,
  },
  {
    "joshdick/onedark.vim",
    cond = enable.onedark == nil or enable.onedark == true
  },
  {
    "ahmedkhalf/project.nvim",
    cond = enable.project == nil or enable.project == true,
    event = "VimEnter",
    config = function()
      require("project_nvim").setup()
    end,
  },
  {
    "tiagovla/scope.nvim",
    cond = enable.scope == nil or enable.scope == true,
    event = "VimEnter",
    config = function()
      require("plugin-configs.scope")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cond = enable.telescope == nil or enable.telescope == true,
    cmd = "Telescope",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build \
         build --config Release && cmake --install build --prefix build",
      },
    },
    config = function()
      require("plugin-configs.telescope")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cond = enable.toggleterm == nil or enable.toggleterm == true,
    event = "VeryLazy",
    config = function()
      -- this is going to be used for keybindings
      _G.term = require("plugin-configs.toggleterm")
    end,
  },
  {
    "folke/trouble.nvim",
    cond = enable.trouble == nil or enable.trouble == true,
    cmd = { "TroubleToggle", "Trouble" },
  },
  {
    "folke/twilight.nvim",
    cond = enable.twilight == nil or enable.twilight == true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = function()
      require("plugin-configs.twilight")
    end,
  },
  {
    "folke/which-key.nvim",
    cond = enable.whichkey == nil or enable.whichkey == true,
    event = "VeryLazy",
    config = function()
      require("plugin-configs.which-key")
    end,
  },
  {
    "folke/zen-mode.nvim",
    cond = enable.zen == nil or enable.zen == true,
    cmd = "ZenMode",
    config = function()
      require("plugin-configs.zenmode")
    end,
  },
  require("user.user_config").plugins,
}, {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
    },
  },
})
