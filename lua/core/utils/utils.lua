local M = {}
M.vim_opts = function(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

M.create_new_file = function()
  local filename = vim.fn.input("Enter the filename: ")
  if filename ~= "" then
    vim.cmd("edit " .. filename)
  end
end

M.has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

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
  return function()
    if vim.fn.executable(cmd) == 1 then
      instance:toggle()
    else
      vim.notify("Command not found: " .. cmd .. ". Ensure it is installed.", "error")
    end
  end
end

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

M.updateAll = function()
  require("lazy").sync({ wait = true })
  M.updateMason()
  vim.cmd("TSUpdate")
  vim.notify("CyberNvim updated!", "info")
end

M.open_neotree = function()
  local path = vim.fn.expand("%:p")
  if vim.fn.isdirectory(path) ~= 0 then
    require("plugin-configs.neo-tree")
  end
end

M.supports_formatting = function()
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    if client.supports_method("textDocument/formatting") then
      return true
    end
  end
  return false
end

return M
