local init = require("custom.configs.plugins.init")
local nvimtree = require("custom.configs.plugins.nvimtree")
local mason = require("custom.configs.plugins.mason")
local treesitter = require("custom.configs.plugins.treesitter")
local cmp = require("custom.configs.plugins.cmp")
local copilot = require("custom.configs.plugins.copilot")

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
	{
		"hrsh7th/nvim-cmp",
		opts = cmp.opts,
		dependencies = cmp.dependencies,
	},

	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = copilot.opts,
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
		},
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

	{
		"tpope/vim-fugitive",
		opt = true,
		cmd = {
			"Git",
			"G",
		},
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
		init = function()
			vim.g.rustaceanvim = {
				server = {
					on_attach = function(client, bufnr)
						-- you can also put keymaps in here
					end,
					default_settings = {
						["rust-analyzer"] = {
							cargo = {
								extraEnv = {
									RUST_PROJECT_FILE = { "Cargo.toml", "rust-project.json" },
								},
							},
						},
					},
				},
			}
		end,
	},

	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
		},
	},
}

return plugins
