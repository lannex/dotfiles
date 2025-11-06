-- ~/.config/nvim/lua/config/keymaps.lua

local wk = require("which-key")
wk.add({
  { "<leader>a", group = "AI Tools" },
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<S-Up>", ":resize +2<CR>", opts)
map("n", "<S-Down>", ":resize -2<CR>", opts)
map("n", "<S-Left>", ":vertical resize -2<CR>", opts)
map("n", "<S-Right>", ":vertical resize +2<CR>", opts)
