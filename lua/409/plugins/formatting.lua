return {
	{
		"stevearc/conform.nvim",
		opts = function()
			return {
				formatters_by_ft = {
					lua = { "stylua" },
					c = { "clang_format" },
					cs = { "csharpier" },
					javascript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					css = { "prettierd" },
					svelte = { "prettier" },
					vue = { "prettier" },
					svelteress = { "prettier" },
					json = { "prettierd" },
					dart = { "dart_format" },
					yaml = { "yamlfmt" },
				},
			}
		end,
		config = function(plugin, opts)
			local conform = require("conform")
			conform.setup(opts)

			conform.formatters.clang_format = {
				args = { "--style", "{IndentWidth: 4, UseTab: Always, TabWidth: 4}" },
			}

			vim.keymap.set("n", "<leader>f", function()
				-- pcall(vim.cmd("TailwindSort"))

				if not conform.format({ bufnr = vim.lsp.bufnr }) then
					vim.lsp.buf.format()
				end
			end)
		end,
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		lazy = false,
		keys = {
			{
				"<leader>ts",
				":TailwindSort<CR>",
				"Sort TailwindCSS classes",
			},
		},
		opts = {
			document_color = {
				enabled = false,
			},
		},
		config = true,
	},
}
