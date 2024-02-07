local treesitter = {
	opts = {
		ensure_installed = {
			"vim",
			"lua",
			"bash",
			"markdown",
			"markdown_inline",
			"csv",
			"dockerfile",
			"dot",
			"json",
			"xml",
			"make",
			"sql",
			"terraform",
			"toml",

			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"svelte",
			"graphql",
			"prisma",

			"c",
			"rust",
			"python",
			"go",
			"elixir",
			"java",
			"kotlin",
			"groovy",
			"clojure",
			"haskell",
		},
		indent = {
			enable = true,
		},
	},
}

return treesitter
