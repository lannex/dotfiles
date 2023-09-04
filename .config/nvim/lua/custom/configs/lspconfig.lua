local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "strict",
			},
		},
	},
})

lspconfig.ruff_lsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
})
