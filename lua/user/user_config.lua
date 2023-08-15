-- use a user-config.lua file to provide your own configuration

local M = {}

-- add any null-ls sources you want here
M.setup_sources = function(b)
  return {
    b.completion.luasnip,
    b.completion.tags,
    b.formatting.stylua,
    b.formatting.autopep8,
    b.formatting.beautysh,
    b.formatting.cbfmt,
    b.formatting.gofumpt,
    b.formatting.jq,
    b.formatting.cmake_format,
    b.formatting.prettierd.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "css",
      },
    }),
    b.diagnostics.checkmake,
    b.diagnostics.clang_check,
    b.diagnostics.cmake_lint,
    b.diagnostics.markdownlint,
    -- b.diagnostics.pylint,
    b.diagnostics.revive,
    b.diagnostics.xo,
    b.code_actions.cspell,
    b.code_actions.xo,
    b.code_actions.gitrebase,
    b.code_actions.gitsigns,
    b.code_actions.gomodifytags,
    b.code_actions.proselint,
    b.code_actions.refactoring,
    b.hover.dictionary,
  }
end

-- add null_ls sources to auto-install
M.null_ls_ensure_installed = {
}

-- add servers to be used for auto formatting here
M.formatting_servers = {
  ["rust_analyzer"] = { "rust" },
  ['lua_ls'] = { 'lua' },
  ["null_ls"] = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "html",
    "css",
    "json",
    "python",
    "sh",
    "bash",
    "zsh",
    "go",
    "cpp",
    "c",
    "cmake",
    "make",
    "markdown",
  },
}

-- options you put here will override or add on to the default options
M.options = {
  opt = {
  }
}

-- see example_user_config. Set any to false that you want disabled in here
M.autocommands = {
}

-- see example_user_config. Set any to false to disable that plugin
M.enable_plugins = {
}
-- add extra plugins here
M.plugins = {
}

-- add extra configuration options here, like extra autocmds etc.
M.general = function()
end

return M
