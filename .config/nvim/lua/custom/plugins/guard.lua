return {
	"nvimdev/guard.nvim",
	init = function()
		local ft = require("guard.filetype")
		ft("lua"):fmt("stylua")
		ft("rust"):fmt("rustfmt")
		ft("python"):fmt("ruff")
		ft("typescript,javascript,typescriptreact"):fmt("prettier")

		require("guard").setup({
			fmt_on_save = true,
			lsp_as_default_formatter = false,
		})
	end,
	dependencies = {
		"nvimdev/guard-collection",
	},
}
