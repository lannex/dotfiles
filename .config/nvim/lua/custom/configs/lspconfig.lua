local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
	"html",
	"cssls",
	"ts_ls",
	"clangd",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "strict",
			},
		},
	},
})

lspconfig.purescriptls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"purescript",
		"purs",
	},
	settings = {
		purescript = {
			addSpagoSources = true,
			addNpmPath = true,
			formatter = "purs-tidy",
		},
	},
	flags = {
		debounce_text_changes = 150,
	},
})

-- Automatically set up rust-analyzer
-- lspconfig.rust_analyzer.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = {
-- 		"rust",
-- 	},
-- 	root_dir = util.root_pattern("Cargo.toml"),
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			cargo = {
-- 				allFeatures = true,
-- 			},
-- 		},
-- 	},
-- })
