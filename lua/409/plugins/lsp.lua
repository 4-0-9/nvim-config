return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function()
			local lspconfig = require("lspconfig")

			local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lsp_default_capabilities = vim.lsp.protocol.make_client_capabilities()

			local capabilities = vim.tbl_deep_extend("force", {}, lsp_default_capabilities, default_capabilities)

			return {
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
			}
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			diagnostics = {
				virtual_text = true,
				update_in_insert = true,
				float = {
					border = "single",
				},
			},
			inlay_hints = {
				enabled = true,
			},
			servers = {
				tsserver = {
					settings = {
						typescript = {
							preferences = {
								quoteStyle = "single",
							},
						},
						javascript = {
							preferences = {
								quoteStyle = "single",
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local buffer = args.buf
					local lsp_opts = { buffer = buffer, remap = false, nowait = true }
					local client = vim.lsp.get_client_by_id(args.data.client_id)

                    -- TODO: Make this work once inlay hints are supported in the non-nightly nvim build
					if opts.inlay_hints.enabled then
						if client.supports_method("textDocument/inlayHint") then
							local ih = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
							if type(ih) == "function" then
								ih(buffer, true)
							elseif type(ih) == "table" and ih.enable then
								ih.enable(buffer, true)
							end
						end
					end

					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, lsp_opts)
					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end, lsp_opts)
					vim.keymap.set("n", "<leader>vws", function()
						vim.lsp.buf.workspace_symbol()
					end, lsp_opts)
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float()
					end, lsp_opts)
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.goto_next()
					end, lsp_opts)
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.goto_prev()
					end, lsp_opts)
					vim.keymap.set("n", "<leader>vca", function()
						vim.lsp.buf.code_action()
					end, lsp_opts)
					vim.keymap.set("n", "<leader>vrr", function()
						vim.lsp.buf.references()
					end, lsp_opts)
					vim.keymap.set("n", "<leader>vrn", function()
						vim.lsp.buf.rename()
					end, lsp_opts)
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, lsp_opts)
				end,
			})

			vim.diagnostic.config(opts.diagnostics)

			require("lspconfig.ui.windows").default_options = {
				border = "single",
			}
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {},
		opts = {
			ui = {
				border = "single",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
}
