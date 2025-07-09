local M = {}

function M.setup()
	require("409.set")
	require("409.remap")
	require("409.lazy")
	require("409.autocmd")
	require("409.lsp")
end

return M
