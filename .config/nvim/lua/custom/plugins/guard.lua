return {
	"nvimdev/guard.nvim",
	init = function()
		local ft = require("guard.filetype")
		ft("lua"):fmt("stylua")
		ft("rust"):fmt("rustfmt")
		ft("python"):fmt("ruff")
		ft("typescript,javascript,typescriptreact"):fmt("prettier")
	end,
	dependencies = {
		"nvimdev/guard-collection",
	},
}
