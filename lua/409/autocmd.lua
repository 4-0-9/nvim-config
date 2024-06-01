vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "*.yaml" },
	command = "setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "netrw" },
	command = "nnoremap <buffer> <C-l> <Cmd> TmuxNavigateRight<CR>",
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	command = "lua vim.highlight.on_yank {higroup='Visual',timeout=100}",
})

-- I'm using the 'TextChanged' autocmd (buffer changed in Normal mode)
-- to update the LSP diagnostics after selecting a code action
vim.api.nvim_create_autocmd({ "TextChanged" }, {
	callback = function()
		-- This updates the LSP diagnostics
		vim.cmd("startinsert")
		vim.cmd("stopinsert")
	end,
})
