return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		keys = {
			{
				"<leader><leader>",
				function()
					if vim.bo.filetype ~= "alpha" then
						vim.cmd("Alpha")
					end
				end,
				desc = "Home screen",
			}
		},
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"     @@@    @@@@@@@@    @@@@@@  ",
				"    @@@@   @@@@@@@@@@  @@@@@@@@ ",
				"   @@!@!   @@!   @@@@  @@!  @@@ ",
				"  !@!!@!   !@!  @!@!@  !@!  @!@ ",
				" @!! @!!   @!@ @! !@!  !!@!!@!! ",
				"!!!  !@!   !@!!!  !!!    !!@!!! ",
				":!!:!:!!:  !!:!   !!!       !!! ",
				"!:::!!:::  :!:    !:!       !:! ",
				"     :::   ::::::: ::  ::::: :: ",
				"     :::    : : :  :    : :  :  ",
			}

			dashboard.section.header.opts.hl = "DashboardHeader"
			dashboard.section.footer.hl = "DashboardFooter"

			dashboard.leader = "LDR"

			--- @param shortcut string Shortcut string of a button mapping
			--- @param desc string Real text description of the mapping
			--- @param rhs string? Righthand side of mapping if defining a new mapping (_optional_)
			--- @param map_opts table? `keymap.set` options used during keymap creating (_optional_)
			dashboard.button = function(shortcut, desc, rhs, map_opts)
				local lhs = shortcut:gsub("%s", ""):gsub(dashboard.leader, "<Leader>")
				local default_map_opts = { noremap = true, silent = true, nowait = true, desc = desc }

				local leader = vim.g.mapleader
				if leader == " " then
					leader = "󱁐"
				end

				return {
					type = "button",
					val = desc,
					on_press = function()
						vim.api.nvim_feedkeys(
							vim.api.nvim_replace_termcodes(rhs or lhs .. "<Ignore>", true, false, true),
							"t",
							false
						)
					end,
					opts = {
						position = "center",
						shortcut = shortcut:gsub(dashboard.leader, leader),
						cursor = -2,
						width = 36,
						align_shortcut = "right",
						hl = "DashboardCenter",
						hl_shortcut = "DashboardShortcut",
						keymap = rhs and { "n", lhs, rhs, require("astrocore").extend_tbl(default_map_opts, map_opts) },
					},
				}
			end

			dashboard.section.buttons.val = {
				dashboard.button("LDR LDR  ", "  Return to this screen"),
				dashboard.button("LDR p v", "  Explore"),
				dashboard.button("LDR p f", "  Find File"),
				dashboard.button("LDR p f", "  Find Git File"),
				dashboard.button("LDR p l", "  Find Word"),
			}

			require("alpha").setup(dashboard.config)
		end,
	},
}
