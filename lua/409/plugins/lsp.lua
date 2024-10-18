return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lsp = require("lsp-zero")

			-- Hyprlang LSP
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
				pattern = { "*.hl", "hypr*.conf" },
				callback = function(event)
					vim.lsp.start({
						name = "hyprlang",
						cmd = { "hyprls" },
						root_dir = vim.fn.getcwd(),
					})
				end,
			})

			lsp.on_attach(function(client, bufnr)
				if vim.bo[bufnr].filetype == "markdown" then
					return
				end

				local lsp_opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, lsp_opts)
				vim.keymap.set("n", "gi", function()
					vim.lsp.buf.implementation()
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
			end)
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
				enabled = false,
			},
			servers = {
				vtsls = {
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
					settings = {
						vtsls = {
							ts_ls = {
								globalPlugins = {
									{
										name = "typescript-svelte-plugin",
										location = vim.fn.getcwd() .. "/node_modules/typescript-svelte-plugin",
										enableForWorkspaceTypeScriptVersions = true,
									},
								},
							},
							tsserver = {
								globalPlugins = {
									{
										name = "typescript-svelte-plugin",
										location = vim.fn.getcwd() .. "/node_modules/typescript-svelte-plugin",
										enableForWorkspaceTypeScriptVersions = true,
									},
								},
							},
						},
						typescript = {
							preferences = {
								quoteStyle = "single",
							},
							updateImportsOnFileMove = {
								enabled = "always",
							},
							suggest = {
								completeFunctionCalls = true,
							},
						},
						javascript = {
							preferences = {
								quoteStyle = "single",
							},
						},
					},
				},
				svelte = {
					capabilities = {
						workspace = {
							didChangeWatchedFiles = { dynamicRegistration = true },
						},
					},
				},
			},
		},
		config = function(_, opts)
			local lsp = require("lsp-zero")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local buffer = args.buf
					local lsp_opts = { buffer = buffer, remap = false, nowait = true }
					local client = vim.lsp.get_client_by_id(args.data.client_id)

					if
						opts.inlay_hints.enabled
						and client ~= nil
						and client.supports_method("textDocument/inlayHint")
					then
						vim.lsp.inlay_hint.enable(true)
					end

					if client ~= nil and client.name == "svelte" then
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.svelte", "*.js", "*.ts" },
							group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
							callback = function(ctx)
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end
				end,
			})

			vim.diagnostic.config(opts.diagnostics)

			require("lspconfig.ui.windows").default_options = {
				border = "single",
			}

			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup({
				ensure_installed = {
					"vtsls",
					"eslint",
					"lua_ls",
					"jsonls",
					"html",
					"tailwindcss",
					"pylsp",
					"dockerls",
					"bashls",
					"marksman",
					"rust_analyzer",
				},
				handlers = {
					function(server_name)
						if lspconfig[server_name] ~= nil then
							lspconfig[server_name].setup(opts.servers[server_name] or {})
						end
					end,
					lua_ls = function()
						require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
					end,
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {},
		opts = {
			PATH = "append",
			ui = {
				border = "single",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
}
