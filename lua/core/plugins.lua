local loaded = require("core.utils.utils").plugin_loaded
require("lazy").setup({
  {
    "stevearc/aerial.nvim",
    cond = loaded("aerial"),
    cmd = "AerialToggle",
    config = function()
      require("plugin-configs.aerial")
    end,
  },
  {
    "goolord/alpha-nvim",
    cond = loaded("alpha"),
    lazy = false,
    config = function()
      require("plugin-configs.alpha")
    end,
  },
  {
    "okuuva/auto-save.nvim",
    cond = loaded("autosave"),
    event = "VeryLazy",
    config = function()
      require("plugin-configs.auto-save")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    cond = loaded("bufferline"),
    lazy = false,
    config = function()
      require("plugin-configs.bufferline")
    end,
  },
  {
    "numToStr/Comment.nvim",
    cond = loaded("comment"),
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "stevearc/dressing.nvim",
    cond = loaded("dressing"),
    event = "VeryLazy",
    config = function()
      require("plugin-configs.dressing")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    cond = loaded("gitsigns"),
    event = "VimEnter",
    config = function()
      require("plugin-configs.gitsigns")
    end,
  },
  {
    "phaazon/hop.nvim",
    cond = loaded("hop"),
    event = "VimEnter",
    branch = "v2",
    config = function()
      require("plugin-configs.hop")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    cond = loaded("indent_blankline"),
    event = "VimEnter",
    config = function()
      require("plugin-configs.indent-blankline")
    end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    cond = loaded("inlay_hints"),
    event = "VeryLazy",
    config = function()
      require("lsp-inlayhints").setup()
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    cond = loaded("lsp_zero"),
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
    cond = loaded("lualine"),
    event = "VeryLazy",
    config = function()
      require("plugin-configs.lualine")
    end,
  },
  {
    "folke/neodev.nvim",
    cond = loaded("neodev"),
    event = "VeryLazy",
    config = function()
      require("plugin-configs.neodev")
    end,
  },
  {
    "karb94/neoscroll.nvim",
    cond = loaded("neoscroll"),
    event = "VeryLazy",
    config = function()
      require("plugin-configs.neoscroll")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cond = loaded("neotree"),
    cmd = "Neotree",
    branch = "main",
    init = require("core.utils.utils").open_neotree,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "Shatur/neovim-session-manager",
    cond = loaded("session_manager"),
    event = "VimEnter",
    config = function()
      require("plugin-configs.session")
    end,
  },
  {
    "folke/noice.nvim",
    cond = loaded("noice"),
    event = "VimEnter",
    config = function()
      require("plugin-configs.noice")
    end,
  },
  { "MunifTanjim/nui.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    cond = loaded("null_ls"),
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugin-configs.null-ls")
    end,
    dependencies = {
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
    cond = loaded("autopairs"),
    event = "InsertEnter",
    config = function()
      require("plugin-configs.autopairs")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    cond = loaded("cmp"),
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
      {
        "zbirenbaum/copilot.lua",
        cond = loaded("copilot"),
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
    },
  },
  { "NvChad/nvim-colorizer.lua", cond = loaded("colorizer"), event = "VimEnter" },
  {
    "mfussenegger/nvim-dap",
    cond = loaded("dap"),
    event = "VeryLazy",
    config = function()
      require("plugin-configs.dap")
    end,
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
          require("mason-nvim-dap").setup()
        end,
      },
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup()
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup()
        end,
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    cond = loaded("notify"),
    lazy = false,
    config = function()
      require("plugin-configs.notify")
    end,
  },
  {
    "kylechui/nvim-surround",
    cond = loaded("surround"),
    cmd = "VimEnter",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cond = loaded("treesitter"),
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
      { "HiPhish/rainbow-delimiters.nvim" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    cond = loaded("ufo"),
    event = "VimEnter",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("ufo").setup()
    end,
  },
  {
    "joshdick/onedark.vim",
    cond = loaded("onedark"),
  },
  { "nvim-lua/plenary.nvim" },
  {
    "ahmedkhalf/project.nvim",
    cond = loaded("project"),
    event = "VimEnter",
    config = function()
      require("project_nvim").setup()
    end,
  },
  {
    "tiagovla/scope.nvim",
    cond = loaded("scope"),
    event = "VimEnter",
    config = function()
      require("plugin-configs.scope")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cond = loaded("telescope"),
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
    cond = loaded("toggleterm"),
    event = "VeryLazy",
    config = function()
      -- this is going to be used for keybindings
      _G.term = require("plugin-configs.toggleterm")
    end,
  },
  {
    "folke/trouble.nvim",
    cond = loaded("trouble"),
    cmd = { "TroubleToggle", "Trouble" },
  },
  {
    "folke/twilight.nvim",
    cond = loaded("twilight"),
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = function()
      require("plugin-configs.twilight")
    end,
  },
  {
    "folke/which-key.nvim",
    cond = loaded("whichkey"),
    event = "VeryLazy",
    config = function()
      require("plugin-configs.which-key")
    end,
  },
  {
    "folke/zen-mode.nvim",
    cond = loaded("zen"),
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
