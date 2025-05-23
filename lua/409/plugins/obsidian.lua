return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>of",
			":ObsidianQuickSwitch<CR>",
			"Find files (Obsidian)",
		},
		{
			"<leader>ot",
			":ObsidianTags<CR>",
			"Find tags (Obsidian)",
		},
		{
			"<leader>ol",
			":ObsidianLinks<CR>",
			"Find links (Obsidian)",
		},
		{
			"<leader>ow",
			":ObsidianWorkspace<CR>",
			"Find workspaces (Obsidian)",
		},
		{
			"gd",
			":ObsidianFollowLink<CR>",
			"Follow link (Obsidian)",
		},
	},
	opts = {
		preferred_link_style = "markdown",
		follow_url_func = function(url)
			vim.fn.jobstart({ "xdg-open", url })
		end,
		ui = {
			enable = false,
		},
		workspaces = (function()
			local vaults = {}

			local vaults_file_path = vim.fn.stdpath("config") .. "/.obsidian_vaults"
			local vaults_file = io.open(vaults_file_path, "r")

			if vaults_file == nil then
				return vaults
			end

			for line in vaults_file:lines() do
				for vault_name, vault_path in string.gmatch(line, "%s*(%S+)%s*=%s*(.+)%s*") do
					vaults[#vaults + 1] = {
						name = vault_name,
						path = vault_path,
					}
					vim.print(vaults[#vaults])
				end
			end

			return vaults
		end)(),
	},
}
