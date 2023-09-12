---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
	},
	i = {
		["<C-s>"] = { "<Cmd>write<CR>", "Write" },
	},
}

M.tabufline = {
	n = {
		["<AS-right>"] = {
			function()
				require("nvchad.tabufline").move_buf(1)
			end,
			"Next buffer",
		},
		["<AS-left>"] = {
			function()
				require("nvchad.tabufline").move_buf(-1)
			end,
			"Previous buffer",
		},
	},
}

M.leap = {
	n = {
		["s"] = {
			"s",
			"Delete [count] characters [into register x] and start insert (s stands for Substitute).  Synonym for 'cl' (not |linewise|).",
		},
		["S"] = {
			"S",
			"Delete [count] lines [into register x] and start insert.  Synonym for 'cc' |linewise|.",
		},
		["<A-s>"] = { "<Plug>(leap-forward-to)", "Leap forward to" },
		["<A-S>"] = { "<Plug>(leap-backward-to)", "Leap backward to" },
	},
	i = {
		["<A-s>"] = {
			function()
				require("leap").leap({})
			end,
			"Leap forward to",
		},
		["<A-S>"] = {
			function()
				require("leap").leap({ backward = true })
			end,
			"Leap backward to",
		},
	},
}

M.guard = {
	n = {
		["<SA-f>"] = { "<Cmd>GuardFmt<CR>", "Guard fmt" },
	},
	i = {
		["<SA-f>"] = { "<Cmd>GuardFmt<CR>", "Guard fmt" },
	},
}

M.trouble = {
	n = {
		["<leader>tx"] = { "<Cmd>TroubleToggle<CR>", "Trouble Toggle" },
		["<leader>tw"] = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Trouble workspace diagnostics" },
		["<leader>ti"] = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Trouble document diagnostics" },
		["<leader>tq"] = { "<Cmd>TroubleToggle quickfix<CR>", "Trouble quickfix" },
		["<leader>tl"] = { "<Cmd>TroubleToggle loclist<CR>", "Trouble loclist" },
	},
}

return M
