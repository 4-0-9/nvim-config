require("telescope").setup({
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
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pt", ":TodoTelescope<CR>")
vim.keymap.set("n", "<leader>ps", function()
	local status, result = pcall(function()
		return vim.fn.input("Grep > ")
	end)
	--
	-- prevent keyboard interrupt error
	if not status then
		return
	end

	builtin.grep_string({ search = result })
end)
vim.keymap.set("n", "<leader>pl", builtin.live_grep)

vim.keymap.set("n", "<C-b>", ":Telescope buffers<CR>")

vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "Visual" })
