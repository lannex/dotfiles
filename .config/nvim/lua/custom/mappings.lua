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
		["<M-s>"] = { "<Plug>(leap-forward-to)", "Leap forward to" },
		["<M-S>"] = { "<Plug>(leap-backward-to)", "Leap backward to" },
	},
	i = {
		["<M-s>"] = {
			function()
				require("leap").leap({})
			end,
			"Leap forward to",
		},
		["<M-S>"] = {
			function()
				require("leap").leap({ backward = true })
			end,
			"Leap backward to",
		},
	},
}

M.guard = {
	n = {
		["<SM-f>"] = { "<Cmd>GuardFmt<CR>", "Guard fmt" },
	},
	i = {
		["<SM-f>"] = { "<Cmd>GuardFmt<CR>", "Guard fmt" },
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
