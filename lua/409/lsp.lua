vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	float = {
		border = "single",
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local bufnr = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if not client then
			return
		end

		if vim.bo[bufnr].filetype == "markdown" then
			return
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = { "*.hl", "hypr*.conf" },
			callback = function(e)
				vim.lsp.start({
					name = "hyprlang",
					cmd = { "hyprls" },
					root_dir = vim.fn.getcwd(),
				})
			end,
		})

		local lsp_opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition({
				on_list = function(list)
					vim.lsp.util.show_document(list.items[1].user_data, "utf-8", { focus = true })
				end,
			})
		end, { buffer = bufnr, remap = false, nowait = true })
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation({
				on_list = function(list)
					vim.lsp.util.show_document(list.items[1].user_data, "utf-8", { focus = true })
				end,
			})
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
			vim.diagnostic.jump({ count = 1 })
		end, lsp_opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = -1 })
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
	end
})

vim.lsp.config.tailwindcss = {
	filetypes_exclude = { "markdown", "rust", "proto", "sh", "gitignore", "toml", "json", "fugitive" },
	hovers = true,
	suggestions = true,
	root_dir = function(fname)
		local root_pattern = require("lspconfig").util.root_pattern(
			"tailwind.config.cjs",
			"talwind.config.js",
			"tailwind.config.ts",
			"postcss.config.js",
			"postcss.config.ts"
		)

		return root_pattern(fname)
	end,
}

vim.lsp.config.vtsls = {
	filetypes = {
		"svelte",
		"vue",
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
					}, {
					name = "@vue/typescript-plugin",
					location = vim.fn.expand "$MASON/packages" ..
						"/vue-language-server" .. "/node_modules/@vue/language-server",
					languages = { "vue" },
					configNamespace = 'typescript',
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
}

vim.lsp.config.vue_ls = {
	on_init = function(client)
		client.handlers['tsserver/request'] = function(_, result, context)
			local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
			if #clients == 0 then
				vim.notify('Could not found `vtsls` lsp client, vue_lsp would not work without it.',
					vim.log.levels.ERROR)
				return
			end
			local ts_client = clients[1]

			local param = unpack(result)
			local id, command, payload = unpack(param)
			ts_client:exec_cmd({
				title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
				command = 'typescript.tsserverRequest',
				arguments = {
					command,
					payload,
				},
			}, { bufnr = context.bufnr }, function(_, r)
				local response_data = { { id, r.body } }
				---@diagnostic disable-next-line: param-type-mismatch
				client:notify('tsserver/response', response_data)
			end)
		end
	end,
}

vim.lsp.config.svelte = {
	capabilities = {
		workspace = {
			didChangeWatchedFiles = { dynamicRegistration = true },
		},
	},
}
