local nvimtree = require("custom.configs.plugins.nvimtree")
local mason = require("custom.configs.plugins.mason")
local treesitter = require("custom.configs.plugins.treesitter")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"nvimtools/none-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
		opts = {
			inlay_hints = { enabled = true },
		},
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = mason.opts,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = treesitter.opts,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = nvimtree.opts,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }

	-- Plugins
	require("custom.plugins.nvim-cmp"),
	require("custom.plugins.copilot"),
	require("custom.plugins.leap"),
	require("custom.plugins.wilder"),
	require("custom.plugins.guard"),
	require("custom.plugins.nvim-bqf"),
	require("custom.plugins.trouble"),
	require("custom.plugins.vim-fugitive"),
	require("custom.plugins.rustaceanvim"),
	require("custom.plugins.nvim-dap"),
	require("custom.plugins.indent-blankline"),
	require("custom.plugins.noice"),
}

return plugins
