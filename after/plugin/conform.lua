local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang_format" },
		cs = { "csharpier" },
		javascript = { { "prettierd", "prettier" } },
		rust = { "rustfmt" },
	},
})

conform.formatters.clang_format = {
	args = { "--style", "{IndentWidth: 4, UseTab: Always, TabWidth: 4}" },
}

conform.formatters.rustfmt = {
	args = { "--edition", "2021" },
}

vim.keymap.set("n", "<leader>f", function()
	conform.format({ bufnr = vim.lsp.bufnr })
end)
