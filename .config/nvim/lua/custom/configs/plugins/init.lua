local M = {}

M.leap = function()
	require("leap").add_default_mappings({})
end

M.guard = function()
	local ft = require("guard.filetype")
	ft("lua"):fmt("stylua")
	ft("python"):fmt("black"):append("isort")
	ft("rust"):fmt("rustfmt")

	require("guard").setup({
		fmt_on_save = true,
		lsp_as_default_formatter = false,
	})
end

return M
