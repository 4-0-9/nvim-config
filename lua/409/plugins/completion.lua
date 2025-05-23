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
				use_nvim_cmp_as_default = true,
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
				default = { "lsp", "lazydev", "path", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
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
		end,
	},
}
