local init = require("custom.configs.plugins.init")
local opts = require("custom.configs.plugins.opts")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = opts.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = opts.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = opts.nvimtree,
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
	{
		"hrsh7th/nvim-cmp",
		opts = opts.cmp,
		dependencies = {
			{
				"tzachar/cmp-tabnine",
				build = "./install.sh",
				config = function()
					local tabnine = require("cmp_tabnine.config")
					tabnine:setup({})
				end,
			},
		},
	},

	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = opts.copilot,
	},

	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		dependencies = "hrsh7th/nvim-cmp",
	},

	{
		"ggandor/leap.nvim",
		init = init.leap,
	},

	{
		"gelguy/wilder.nvim",
		keys = { "/", "?", ":" },
		build = ":UpdateRemotePlugins",
	},

	{
		"nvimdev/guard.nvim",
		init = init.guard,
    dependencies = {
      "nvimdev/guard-collection",
    }
	},

	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
	},
}

return plugins
