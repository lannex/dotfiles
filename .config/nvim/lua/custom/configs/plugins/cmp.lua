local cmp = {
	opts = {
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
	},

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
}

return cmp
