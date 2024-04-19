local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip_snippets.common.snip_utils").setup()
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_hl = vim.api.nvim_create_augroup("CmpHighlights", {})
local cmp_types = {
	"Class",
	"Constant",
	"Constructor",
	"Enum",
	"Field",
	"Function",
	"Keyword",
	"Method",
	"Operator",
	"Property",
	"Struct",
	"Text",
}

local has_words_before = require("core.utils.utils").has_words_before
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
cmp.setup({
	enabled = function()
		-- disables in comments
		local context = require("cmp.config.context")
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
	preselect = "none",
	completion = {
		keyword_length = 1,
		completeopt = "menu,menuone,noinsert,noselect",
	},
	files = { ".*\\.lua" }, -- default
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.sort_text,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = require("lspkind").cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			ellipsis_char = "...",
			symbol_map = { Codeium = "" },
			show_labelDetails = true,
		}),
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<C-c>"] = cmp.mapping.abort(),
		["<C-n>"] = { i = cmp.mapping.complete() },
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
	},
	sources = {
		{ name = "cmp_yanky" },
		{ name = "codeium" },
		{ name = "emoji" },
		{ name = "luasnip" },
		{ name = "nerdfont" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "plugins" },
		{ name = "rg" },
		{ name = "spell" },
		-- { name = "zsh" },
		{
			name = "buffer",
			keyword_length = 5,
			option = {
				get_bufnrs = function()
					local bufs = {}
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						bufs[vim.api.nvim_win_get_buf(win)] = true
					end
					return vim.tbl_keys(bufs)
				end,
			},
		},
	},
})
cmp.setup.filetype("gitcommit", {
	sources = {
		{ name = "commit" },
		{ name = "gitmoji" },
	},
})

-- `/` cmdline setup.
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	window = { completion = cmp.config.window.bordered({ col_offset = 0 }) },
	formatting = { fields = { "abbr" } },
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	window = { completion = cmp.config.window.bordered({ col_offset = 0 }) },
	formatting = { fields = { "abbr" } },
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

vim.api.nvim_clear_autocmds({ group = cmp_hl })
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
	group = cmp_hl,
	desc = "redefinition of nvim-cmp highlight groups",
	callback = function()
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {})
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { link = "@text.todo" })
		vim.api.nvim_set_hl(0, "CmpItemMenu", {})
		vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "LineNr" })
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", {})
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { link = "@number" })
		for _, type in ipairs(cmp_types) do
			vim.api.nvim_set_hl(0, "CmpItemKind" .. type, {})
			vim.api.nvim_set_hl(0, "CmpItemKind" .. type, { link = "@" .. type })
		end
	end,
})
