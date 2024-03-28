config = function()
            require('template').setup({
                temp_dir = '~/.config/nvim/user/templates',
                author = 'Oliver Tzeng',
                email = 'olivertzeng@proton.me',
                vim.keymap.set('n', '<Leader>t', function()
                    vim.fn.feedkeys(':Template ')
                end, { remap = true })
            })
        end
