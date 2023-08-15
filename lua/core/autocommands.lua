local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

local enabled = require("user.user_config").autocommands
if enabled == nil or enabled.inlay_hints == nil or enabled.inlay_hints == true then
  cmd("LspAttach", {
    group = augroup("LspAttach_inlayhints", { clear = true }),
    callback = function(args)
      if not (args.data and args.data.client_id) then
        return
      end
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      require("lsp-inlayhints").on_attach(client, bufnr)
    end,
  })
end

if enabled == nil or enabled.alpha_folding == nil or enabled.alpha_folding == true then
  cmd({ "FileType" }, {
    desc = "Disable folding for alpha buffer",
    group = augroup("alpha", { clear = true }),
    pattern = "alpha",
    command = "setlocal nofoldenable",
  })
end

if enabled == nil or enabled.treesitter_folds == nil or enabled.treesitter_folds == true then
  cmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
    desc = "fix tree sitter folds issue",
    group = augroup("treesitter folds", { clear = true }),
    pattern = { "*" },
    callback = function()
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
  })
end

if enabled == nil or enabled.trailing_whitespace == nil or enabled.trailing_whitespace == true then
  cmd({ "BufWritePre" }, {
    desc = "remove trailing whitespace on save",
    group = augroup("remove trailing whitespace", { clear = true }),
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
  })
end

if enabled == nil or enabled.remember_file_state == nil or enabled.remember_file_state == true then
  augroup("remember file state", { clear = true })
  cmd({ "BufWinLeave" }, {
    desc = "remember file state",
    group = "remember file state",
    pattern = { "*.*" },
    command = "mkview",
  })
  cmd({ "BufWinEnter" }, {
    desc = "remember file state",
    group = "remember file state",
    pattern = { "*.*" },
    command = "silent! loadview",
  })
end

if enabled == nil or enabled.session_saved_notification == nil or enabled.session_saved_notification == true then
  cmd({ "User" }, {
    desc = "notify session saved",
    group = augroup("session save", { clear = true }),
    pattern = "SessionSavePost",
    command = "lua require('notify').notify('Session Saved', 'info')",
  })
end

if enabled == nil or enabled.format_on_autosave == nil or enabled.format_on_autosave == true then
  cmd("User", {
    desc = "stops format->write loop and joins format change with last user change when undoing",
    pattern = "AutoSaveWritePre",
    group = augroup("auto save", { clear = true }),
    callback = function()
      if require("core.utils.utils").supports_formatting then
        vim.api.nvim_buf_create_user_command(0, "Format", function()
          vim.lsp.buf.format()
        end, {})
        vim.cmd("silent! undojoin")
        vim.cmd("Format")
      end
    end,
  })
end

if enabled == nil or enabled.css_colorizer == nil or enabled.css_colorizer == true then
  cmd({ "Filetype" }, {
    desc = "activate colorizer",
    pattern = "css,scss,html,xml,svg,js,jsx,ts,tsx,php,vue",
    group = augroup("colorizer", { clear = true }),
    callback = function()
      require("colorizer").attach_to_buffer(0, {
        mode = "background",
        css = true,
      })
    end,
  })
end

if enabled == nil or enabled.activate_neotree == nil or enabled.activate_neotree == true then
  cmd({ "BufEnter" }, {
    desc = "activate neo-tree",
    pattern = "*",
    group = augroup("neo-tree", { clear = true }),
    callback = function()
      require("core.utils.utils").open_neotree()
    end,
  })
end
