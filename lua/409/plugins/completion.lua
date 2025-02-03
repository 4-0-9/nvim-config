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
				accept = {
					auto_brackets = {
						enabled = false,
					},
				},
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

			vim.api.nvim_set_hl(0, "SnippetTabstop", { bg = "none" })
		end,
	},
}
