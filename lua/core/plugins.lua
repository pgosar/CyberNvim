require("lazy").setup({
  {
    "stevearc/aerial.nvim",
    cmd = "AerialToggle",
    config = function()
      require("plugin-configs.aerial")
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("plugin-configs.alpha")
    end,
  },
  {
    "okuuva/auto-save.nvim",
    event = "VeryLazy",
    config = function()
      require("plugin-configs.auto-save")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    config = function()
      require("plugin-configs.bufferline")
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
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
    event = "VeryLazy",
    config = function()
      require("plugin-configs.dressing")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    config = function()
      require("plugin-configs.gitsigns")
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "VimEnter",
    branch = "v2",
    config = function()
      require("plugin-configs.hop")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VimEnter",
    config = function()
      require("plugin-configs.indent-blankline")
    end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp-inlayhints").setup()
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
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
    event = "VeryLazy",
    config = function()
      require("plugin-configs.lualine")
    end,
  },
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = function()
      require("neodev").setup()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("plugin-configs.neoscroll")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
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
    event = "VimEnter",
    config = function()
      require("plugin-configs.session")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VimEnter",
    config = function()
      require("plugin-configs.noice")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
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
    event = "InsertEnter",
    config = function()
      require("plugin-configs.autopairs")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
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
  { "NvChad/nvim-colorizer.lua", event = "VimEnter" },
  {
    "mfussenegger/nvim-dap",
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
    lazy = false,
    config = function()
      require("plugin-configs.notify")
    end,
  },
  {
    "kylechui/nvim-surround",
    cmd = "VimEnter",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
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
    event = "VimEnter",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("ufo").setup()
    end,
  },

  { "joshdick/onedark.vim" },
  {
    "ahmedkhalf/project.nvim",
    event = "VimEnter",
    config = function()
      require("project_nvim").setup()
    end
  },
  {
    "tiagovla/scope.nvim",
    event = "VimEnter",
    config = function()
      require("plugin-configs.scope")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
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
    event = "VeryLazy",
    config = function()
      -- this is going to be used for keybindings
      _G.term = require("plugin-configs.toggleterm")
    end,
  },
  { "folke/trouble.nvim", cmd = { "TroubleToggle", "Trouble" } },
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = function()
      require("plugin-configs.twilight")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("plugin-configs.which-key")
    end,
  },
  {
    "folke/zen-mode.nvim",
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
