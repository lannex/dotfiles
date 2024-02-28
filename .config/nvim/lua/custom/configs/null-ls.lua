local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
	-- formatting
	-- b.formatting.deno_fmt,
	-- b.formatting.taplo.with({ filetypes = { "toml" } }),
	-- b.formatting.ruff,

	b.formatting.prettier.with({
		filetypes = { "html", "markdown", "css", "yaml" },
		extra_args = { "--tab-width", "2" },
	}),
	b.formatting.clang_format,
	b.formatting.ktlint.with({ filetypes = { "kotlin" } }),

	-- diagnostics
	b.diagnostics.ktlint.with({ filetypes = { "kotlin" } }),
	b.diagnostics.hadolint.with({ filetypes = { "dockerfile" } }),
}

null_ls.setup({
	debug = true,
	sources = sources,
})
