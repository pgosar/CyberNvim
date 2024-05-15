local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
local lspkind = require("lspkind")
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

local has_words_before = require("core.utils").has_words_before
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
	performance = {
		max_view_entries = 5,
	},
	completion = {
		keyword_length = 1,
		completeopt = "menu,menuone,noinsert,noselect",
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
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
		format = lspkind.cmp_format({
			mode = "text_symbol",
			maxwidth = 50,
			show_labelDetails = true,
		}),
	},
	experimental = {
		ghost_text = true,
	},
	mapping = cmp.mapping.preset.insert {
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
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
		["<C-c>"] = cmp.mapping.abort(),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-n>"] = { i = cmp.mapping.complete() },
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "rg" },
	},
})
