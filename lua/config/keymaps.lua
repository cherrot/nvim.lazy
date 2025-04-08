-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Default ones (C-Up/Down/Left/Right) conflict with MacOS
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

vim.keymap.del("n", "s")
vim.keymap.del("n", "t")
map("n", "t", function()
  require("flash").jump()
end, { desc = "Flash search" })

-- Leave H/L as motion keys
-- vim.keymap.del("n", "<S-h>")
-- vim.keymap.del("n", "<S-l>")
-- map("n", "<A-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- map("n", "<A-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
--
-- map("i", "<C-i>", "<cmd>lua require('avante').get_suggestion():suggest()<cr>", { desc = "Trigger Suggestion" })
