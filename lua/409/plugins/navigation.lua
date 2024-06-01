return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				borderchars = require("409.ui").telescope_border,
				prompt_prefix = "   ",
				color_devicons = true,
			},
		},
		keys = {
			{
				"<leader>pf",
				":Telescope find_files<CR>",
				desc = "Find files",
			},
			{
				"<leader>pw",
				":Telescope lsp_dynamic_workspace_symbols<CR>",
				desc = "Find symbols (LSP)",
			},
			{
				"<leader>pwf",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols({
						symbols = "function",
					})
				end,
				desc = "Find functions (LSP)",
			},
			{
				"<leader>pwv",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols({
						prompt_title = "Find variables (LSP)",
						symbols = "variable",
					})
				end,
				desc = "Find variables (LSP)",
			},
			{
				"<leader>pws",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols({
						prompt_title = "Find structs (LSP)",
						symbols = "struct",
					})
				end,
				desc = "Find structs (LSP)",
			},
			{
				"<leader>pwC",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols({
						prompt_title = "Find constants (LSP)",
						symbols = "constant",
					})
				end,
				desc = "Find constants (LSP)",
			},
			{
				"<leader>pwc",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols({
						prompt_title = "Find classes (LSP)",
						symbols = "class",
					})
				end,
				desc = "Find classes (LSP)",
			},
			{
				"<leader>pwe",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols({
						prompt_title = "Find enums (LSP)",
						symbols = "enum",
					})
				end,
				desc = "Find enums (LSP)",
			},
			{
				"<C-p>",
				":Telescope git_files<CR>",
				desc = "Find files (git)",
			},
			{
				"<leader>pt",
				":TodoTelescope<CR>",
				desc = "Find TODOs",
			},
			{
				"<leader>ps",
				function()
					local status, result = pcall(function()
						return vim.fn.input("Grep > ")
					end)
					--
					-- prevent keyboard interrupt error
					if not status then
						return
					end

					require("telescope.builtin").grep_string({ search = result })
				end,
				desc = "Grep (root dir)",
			},
			{
				"<leader>pl",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep (root dir)",
			},
			{
				"<C-b>",
				":Telescope buffers<CR>",
				desc = "Find buffers",
			},
		},
		config = function(plugin, opts)
			require("telescope").setup(opts)

			vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "Visual" })
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon.setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			for i = 1, 9, 1 do
				vim.keymap.set("n", string.format("<leader>%s", i), function()
					harpoon:list():select(i)
				end)
			end
		end,
	},
}
