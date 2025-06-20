return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = true,
			show_end_of_buffer = false,
			integrations = {
				blink_cmp = true,
				treesitter = true,
				gitsigns = true,
			},
			no_italic = true,
			no_underline = false,
			highlight_overrides = {
				mocha = function(mocha)
					return {
						Comment = { fg = mocha.overlay0 },
					}
				end
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)

			vim.cmd.colorscheme("catppuccin")

			local colors = require("catppuccin.palettes").get_palette(opts.flavour)

			vim.api.nvim_set_hl(0, "LineNr", { fg = colors.surface2 })

			vim.api.nvim_set_hl(0, "QuickFixLine", { link = "Visual" })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "FloatBorder" })
			vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "FloatBorder" })
			vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "FloatBorder" })
			vim.api.nvim_set_hl(0, "TelescopePromptCounter", { link = "FloatBorder" })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.surface2 })
			vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.crust, bg = colors.blue, bold = true })

			vim.api.nvim_set_hl(0, "TabLine", { fg = colors.text, bg = colors.mantle })
			vim.api.nvim_set_hl(0, "TabLineSel", { fg = colors.crust, bg = colors.blue, bold = true })
			vim.api.nvim_set_hl(0, "DashboardHeader", { fg = colors.blue })
			vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = colors.crust })

			vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = colors.text, bg = "none" })

			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
			vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { link = "FloatBorder" })

			vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = colors.blue, bg = "none" })
			vim.api.nvim_set_hl(0, "BlinkCmpLabel", { bg = "none" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "none" })
			vim.api.nvim_set_hl(0, "BlinkCmpKind", { link = "BlinkCmpLabel" })

			vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = colors.overlay0 })

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

			vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { link = "Comment" })

			vim.api.nvim_set_hl(0, "SnippetTabstop", { bg = "none" })
		end,
	},
}
