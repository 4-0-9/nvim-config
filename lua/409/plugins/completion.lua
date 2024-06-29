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
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua" },
					{ name = "vim-dadbod-completion" },
                    { name = "luasnip", keyword_length = 2 },
					-- { name = "buffer", keyword_length = 3 },
				},
				view = {
					entries = "custom",
				},
				completion = {
					completeopt = "menu,menuone,noselect,preview",
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
						if entry.source.name == "vim-dadbod-completion" then
							kind.kind = "  "
							kind.menu = "[DB]"
						end

						vim_item.dup = ({
							vsnip = 0,
							nvim_lsp = 0,
							nvim_lua = 0,
							buffer = 0,
						})[entry.source.name] or 0

						return kind
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = function()
						if not cmp.visible() then
							cmp.complete()
						end
						cmp.select_prev_item(cmp_select)
					end,
					["<C-n>"] = function()
						if not cmp.visible() then
							cmp.complete()
						end
						cmp.select_next_item(cmp_select)
					end,
					["<C-k>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-g>"] = cmp.mapping.complete(),
					["<Tab>"] = nil,
					["<S-Tab>"] = nil,
				}),
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.kind,
					},
				},
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
