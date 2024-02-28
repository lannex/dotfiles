local rustaceanvim = {
	init = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr)
					require("plugins.configs.lspconfig/on_attach")
				end,
				root_dir = require("lspconfig/util").root_pattern("Cargo.toml"),
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			},
		}
	end,
}

return rustaceanvim
