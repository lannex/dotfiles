local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
	b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	b.formatting.prettier.with({ filetypes = { "html", "markdown", "css", "yaml" } }),

	b.formatting.black,
	b.formatting.isort,
	b.formatting.clang_format,

	b.formatting.taplo,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
