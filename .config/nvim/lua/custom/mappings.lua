---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
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
}

return M
