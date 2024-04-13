return {
	"onsails/lspkind.nvim",
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "onsails/lspkind.nvim" },
		opts = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local border = require("409.ui").border

			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None"

			return {
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua" },
					{ name = "luasnip", keyword_length = 2 },
					-- { name = "buffer",                 keyword_length = 3 },
				},
				view = {
					entries = "custom",
				},
				completion = {
					completeopt = "menuone,noselect,preview",
					docs_initially_visible = true,
				},
				window = {
					documentation = {
						border = border,
						winhighlight = winhighlight,
					},
					completion = {
						border = border,
						winhighlight = winhighlight,
					},
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"

						return kind
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-k>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-g>"] = cmp.mapping.complete(),
					["<Tab>"] = nil,
					["<S-Tab>"] = nil,
				}),
			}
		end,
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"L3MON4D3/LuaSnip",
}
