-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

local opt = vim.opt

opt.title = true
opt.timeoutlen = 100
opt.ttimeoutlen = 0
-- opt.list = true
-- opt.listchars:append("eol:¶")

vim.filetype.add({ extension = { purs = "purescript" } })

-- LSP Diagnostics Options Setup
-- local sign = function(opts)
-- 	vim.fn.sign_define(opts.name, {
-- 		texthl = opts.name,
-- 		text = opts.text,
-- 		numhl = "",
-- 	})
-- end
--
-- sign({ name = "DiagnosticSignError", text = "" })
-- sign({ name = "DiagnosticSignWarn", text = "" })
-- sign({ name = "DiagnosticSignHint", text = "" })
-- sign({ name = "DiagnosticSignInfo", text = "" })
--
-- vim.diagnostic.config({
-- 	virtual_text = false,
-- 	signs = true,
-- 	update_in_insert = true,
-- 	underline = true,
-- 	severity_sort = false,
-- 	float = {
-- 		border = "rounded",
-- 		source = "always",
-- 		header = "",
-- 		prefix = "",
-- 	},
-- })
--
-- vim.cmd([[
-- set signcolumn=yes
-- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]])
