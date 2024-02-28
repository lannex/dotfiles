local mason = {
	opts = {
		ensure_installed = {
			"lua-language-server",
			"stylua",
			"taplo",
			"hadolint",

			"css-lsp",
			"html-lsp",
			"typescript-language-server",
			"deno",
			"prettier",

			"clangd",
			"clang-format",
			"pyright",
			"ruff",
			"ruff-lsp",
			"rust-analyzer",
			-- "rustfmt", rustfmt should no longer be installed via Mason but instead through rustup, due to external factors.
			"ktlint",
			"codelldb",
		},
	},
}

return mason
