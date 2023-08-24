local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

local group = require("user.user_config").autocommands
local enabled = require("core.utils.utils").enabled
if enabled(group, "inlay_hints") then
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

if enabled(group, "alpha_folding") then
	cmd({ "FileType" }, {
		desc = "Disable folding for alpha buffer",
		group = augroup("alpha", { clear = true }),
		pattern = "alpha",
		command = "setlocal nofoldenable",
	})
end

if enabled(group, "treesitter_folds") then
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

if enabled(group, "trailing_whitespace") then
	cmd({ "BufWritePre" }, {
		desc = "remove trailing whitespace on save",
		group = augroup("remove trailing whitespace", { clear = true }),
		pattern = { "*" },
		command = [[%s/\s\+$//e]],
	})
end

if enabled(group, "remember_file_state") then
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

if enabled(group, "session_saved_notification") then
	cmd({ "User" }, {
		desc = "notify session saved",
		group = augroup("session save", { clear = true }),
		pattern = "SessionSavePost",
		command = "lua vim.notify('Session Saved', 'info')",
	})
end

if enabled(group, "format_on_autosave") then
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

if enabled(group, "css_colorizer") then
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

if enabled(group, "activate_neotree") then
	cmd({ "BufEnter" }, {
		desc = "activate neo-tree",
		pattern = "*",
		group = augroup("neo-tree", { clear = true }),
		callback = function()
			require("core.utils.utils").open_neotree()
		end,
	})
end

if enabled(group, "cmp") then
	cmd({ "FileType" }, {
		desc = "disable cmp in certain filetypes",
		pattern = "gitcommit,gitrebase,text,markdown",
		group = augroup("cmp_disable", { clear = true }),
		command = "lua require('cmp').setup.buffer { enabled = false}",
	})
end
