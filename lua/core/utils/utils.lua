local M = {}

-- sets main options from options (table)
M.vim_opts = function(options)
  if options ~= nil then
    for scope, table in pairs(options) do
      for setting, value in pairs(table) do
        vim[scope][setting] = value
      end
    end
  end
end

-- sets keybinds
M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- creating new file for alpha nvim buffer
M.create_new_file = function()
  local filename = vim.fn.input("Enter the filename: ")
  if filename ~= "" then
    vim.cmd("edit " .. filename)
  end
end

-- helper for cmp completion
M.has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- creates floating terminal for toggleterm
M.create_floating_terminal = function(term, cmd)
  local instance = nil
  if vim.fn.executable(cmd) == 1 then
    local terminal = term.Terminal
    instance = terminal:new({
      cmd = cmd,
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function()
        vim.cmd("startinsert!")
      end,
      on_close = function()
        vim.cmd("startinsert!")
      end,
    })
  end
  -- check if TermExec function exists
  return function()
    if vim.fn.executable(cmd) == 1 then
      instance:toggle()
    else
      vim.notify("Command not found: " .. cmd .. ". Ensure it is installed.", "error")
    end
  end
end

-- updates all Mason packages
M.updateMason = function()
  local registry = require("mason-registry")
  registry.refresh()
  registry.update()
  local packages = registry.get_all_packages()
  for _, pkg in ipairs(packages) do
    if pkg:is_installed() then
      pkg:install()
    end
  end
end

-- updates everything in CyberNvim
M.updateAll = function()
  require("lazy").sync({ wait = true })
  M.updateMason()
  vim.cmd("TSUpdate")
  vim.notify("CyberNvim updated!", "info")
end


-- open neotree whenever a directory is opened
M.open_neotree = function()
  local path = vim.fn.expand("%:p")
  if vim.fn.isdirectory(path) ~= 0 then
    require("plugin-configs.neo-tree")
  end
end

-- check if attached lsp supports formatting
M.supports_formatting = function()
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    if client.supports_method("textDocument/formatting") then
      return true
    end
  end
  return false
end

-- check if plugin is loaded or not
M.plugin_loaded = function(plugin)
  local enable = require("user.user_config").enable_plugins
  return enable == nil or enable[plugin] == nil or enable[plugin] == true
end

return M
