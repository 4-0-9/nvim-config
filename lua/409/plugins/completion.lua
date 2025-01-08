return {
	{
		"saghen/blink.cmp",
		lazy = false,
		version = "v0.*",
		opts = {
			keymap = {
				["<C-y>"] = { "select_and_accept" },
				["<C-g>"] = { "show", "hide" },

				["<C-n>"] = { "show", "select_next", "fallback" },
				["<C-p>"] = { "show", "select_prev", "fallback" },

				["<C-k>"] = { "scroll_documentation_up", "fallback" },
				["<C-j>"] = { "scroll_documentation_down", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
				kind_icons = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",

					Field = "󰜢",
					Variable = "󰀫",
					Property = "󰜢",

					Class = "󰠱",
					Interface = "",
					Struct = "󰙅",
					Module = "",

					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					EnumMember = "",

					Keyword = "󰌋",
					Constant = "󰏿",

					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "󰬛",
				},
			},
			sources = {
				default = { "lsp", "path", "buffer" },
			},
			completion = {
				menu = {
					enabled = true,
					border = "single",
					draw = {
						padding = 2,
						columns = { { "kind_icon" }, { "label" }, { "kind" } },

						components = {
							kind = {
								text = function(ctx)
									return "(" .. ctx.kind .. ")"
								end,
							},
							label = {
								text = function(ctx)
									return ctx.label
								end,
							},
						},
					},
				},
				documentation = {
					auto_show = true,
					window = {
						border = "single",
						max_width = 100,
					},
				},
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},
				ghost_text = {
					enabled = false,
				},
			},
			signature = {
				enabled = false,
				trigger = {
					show_on_insert_on_trigger_character = true,
				},
				window = {
					border = "single",
				},
			},
		},
		opts_extend = { "sources.default" },
		config = function(_, opts)
			require("blink.cmp").setup(opts)

			vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = "#abb2bf", bg = "none" })

			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
			vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { link = "FloatBorder" })

			vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = "#50fa7b", bg = "none" })
			vim.api.nvim_set_hl(0, "BlinkCmpLabel", { bg = "none" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "none" })
			vim.api.nvim_set_hl(0, "BlinkCmpKind", { link = "BlinkCmpLabel" })

			vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = "#abb2bf" })

			vim.api.nvim_set_hl(0, "BlinkCmpKindTypeParameter", { link = "@variable.parameter" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindConstructor", { link = "@type" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindEnumMember", { link = "@variable.member" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindReference", { link = "@variable.parameter.reference" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { link = "@type" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { link = "@variable" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", { link = "@property" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindOperator", { link = "@operator" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { link = "@function" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindConstant", { link = "@constant" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { link = "@markup" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { link = "@keyword" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindStruct", { link = "@structure" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { link = "@module" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", { link = "@function.method" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindFolder", { link = "TSURI" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindValue", { link = "@variable.member" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindField", { link = "@variable.member" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindEvent", { link = "@constant" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindColor", { link = "DevIconCss" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { link = "@type" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindUnit", { link = "@variable.member" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindText", { link = "@markup" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindFile", { link = "TSURI" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindEnum", { link = "@variable.member" })
		end,
	},
	--[[ {
		"hrsh7th/nvim-cmp",
		dependencies = {
			"onsails/lspkind.nvim",
			"VonHeikemen/lsp-zero.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
		},
		opts = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None"

			vim.api.nvim_set_hl(0, "CmpPmenuBorder", { link = "FloatBorder" })

			-- cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

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
						border = "single",
						winhighlight = winhighlight,
					},
					completion = {
						border = "single",
						winhighlight = winhighlight,
					},
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 70 })(entry, vim_item)
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
	}, ]]
}
