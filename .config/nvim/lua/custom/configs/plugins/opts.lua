local M = {}

M.treesitter = {
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
		"kotlin",
		"clojure",
	},
	indent = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		"lua-language-server",
		"stylua",
		"taplo",

		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",

		"clangd",
		"clang-format",
		"pyright",
		"black",
		"isort",
		"ruff-lsp",
		"rust-analyzer",
		-- "rustfmt", rustfmt should no longer be installed via Mason but instead through rustup, due to external factors.
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = false,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
	filters = {
		custom = {
			".DS_Store",
		},
	},
}

M.cmp = {
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "cmp_tabnine" },
	},
	mapping = {
		--   -- disable  tab
		--   ["<Tab>"] = function(callback)
		--     callback()
		--   end,
		--
		--   ["<S-Tab>"] = function(callback)
		--     callback()
		--   end,
		--
		--   -- use Up and down for cycling completion
		--   ["<Down>"] = require("cmp").mapping(function(fallback)
		--     local cmp = require "cmp"
		--     if cmp.visible() then
		--       cmp.select_next_item()
		--     elseif require("luasnip").expand_or_jumpable() then
		--       vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
		--     else
		--       fallback()
		--     end
		--   end, {
		--     "i",
		--     "s",
		--   }),
		--   ["<Up>"] = require("cmp").mapping(function(fallback)
		--     local cmp = require "cmp"
		--     if cmp.visible() then
		--       cmp.select_prev_item()
		--     elseif require("luasnip").jumpable(-1) then
		--       vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
		--     else
		--       fallback()
		--     end
		--   end, {
		--     "i",
		--     "s",
		--   }),
	},
}

M.copilot = {
	suggestion = {
		auto_trigger = false,
	},
}

return M
