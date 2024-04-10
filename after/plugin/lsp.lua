local lspconfig = require("lspconfig")

local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_default_capabilities = vim.lsp.protocol.make_client_capabilities()

local capabilities = vim.tbl_deep_extend("force", {}, lsp_default_capabilities, default_capabilities)

require("mason").setup({
	ui = {
		border = "single",
	},
})

require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "rust_analyzer" },
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
			})
		end,
		["lua_ls"] = function()
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
})

lspconfig.yamlls.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = true
	end,
	settings = {
		yaml = {
			customTags = { "!enemy", "!delay", "!composite" },
			validate = false,
			format = {
				enable = true,
			},
		},
	},
})

lspconfig.tsserver.setup({
	settings = {
		typescript = {
			preferences = {
				quoteStype = "single",
			},
		},
		javascript = {
			preferences = {
				quoteStyle = "single",
			},
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf

		local opts = { buffer = bufnr, remap = false, nowait = true }

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	float = {
		border = "single",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})

require("lspconfig.ui.windows").default_options = {
	border = "single",
}
