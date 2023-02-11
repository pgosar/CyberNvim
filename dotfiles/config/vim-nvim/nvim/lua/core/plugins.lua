local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'joshdick/onedark.vim'
    use 'lewis6991/impatient.nvim'
    use "nvim-lua/plenary.nvim"
    use {
        'SmiteshP/nvim-navic',
        config = function() require("plugin-configs.navic") end
    }
    use 'windwp/nvim-ts-autotag'
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        }
    }
    use "folke/neodev.nvim"
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function() require("copilot").setup({}) end
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {
        'karb94/neoscroll.nvim',
        config = function() require('neoscroll').setup {} end
    }
    use {
        'ahmedkhalf/project.nvim',
        config = function() require"project_nvim".setup {} end
    }
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function() require("toggleterm").setup() end
    }
    use {
        'goolord/alpha-nvim',
        config = function() require('plugin-configs.alpha') end
    }
    use {'numToStr/Comment.nvim'}
    use {
        'stevearc/dressing.nvim',
        config = function() require'dressing'.setup {} end
    }
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
        end
    }
    use {
        "rcarriga/nvim-notify",
        config = function() require'notify'.setup {} end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, -- Required
            {'williamboman/mason.nvim'}, -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            -- Autocompletion
            {'hrsh7th/nvim-cmp'}, -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'hrsh7th/cmp-buffer'}, -- Optional
            {'hrsh7th/cmp-path'}, -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'}, -- Optional
            -- Snippets
            {'L3MON4D3/LuaSnip'}, -- Required
            {'rafamadriz/friendly-snippets'} -- Optional
        }
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                -- for example, context is off by default, use this to turn it on
                show_current_context = true,
                show_current_context_start = true
            }
        end
    }

    use 'mfussenegger/nvim-dap'
    use 'jay-babu/mason-nvim-dap.nvim'
    use 'folke/trouble.nvim'
    use({
        'nvim-lualine/lualine.nvim',
        config = function() require "plugin-configs.lualine" end
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function() require "plugin-configs.null-ls" end
    })
    use 'nvim-tree/nvim-web-devicons'
    use 'onsails/lspkind.nvim'
    use "tiagovla/scope.nvim"
    use {'fedepujol/move.nvim'}
    use "akinsho/bufferline.nvim"

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        'stevearc/aerial.nvim',
        config = function() require('plugin-configs.aerial') end
    }
    use {
        "folke/zen-mode.nvim",
        config = function() require("zen-mode").setup {} end
    }
    use {
        "folke/twilight.nvim",
        config = function() require("twilight").setup {} end
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x',
        requires = {
            {'nvim-lua/plenary.nvim'}, {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            }
        },
        config = function() require("plugin-configs.telescope") end
    }
    use 'p00f/nvim-ts-rainbow'
    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require("neogit").setup {} end
    }
    use {
        'Shatur/neovim-session-manager',
        config = function()
            require("session_manager").setup {
                autoload_mode = require('session_manager.config').AutoloadMode
                    .Disabled
            }
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({with_sync = true})
        end,
        config = function() require "plugin-configs.treesitter" end
    }

    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use {
        'nvim-treesitter/nvim-treesitter-context',
        config = function() require("treesitter-context").setup {} end
    }
    if packer_bootstrap then require('packer').sync() end
end)
