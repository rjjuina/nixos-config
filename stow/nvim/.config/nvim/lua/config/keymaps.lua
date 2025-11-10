-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i", "x", "t", "v" }, "<C-f>", "<right>")
vim.keymap.set({ "i", "x", "t", "v" }, "<C-b>", "<left>")
vim.keymap.set({ "i", "x", "t", "v" }, "<C-p>", "<up>")
vim.keymap.set({ "i", "x", "t", "v" }, "<C-n>", "<down>")
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Move Lines
vim.keymap.set("n", "<M-S-down>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<M-S-up>", "<cmd>m .-2<cr>==", { desc = "Move Up" })

local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end
vim.keymap.set("n", "<C-`>", lazyterm, { desc = "Terminal (Root Dir)" })
vim.keymap.set("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<D-e>", builtin.oldfiles, { desc = "Recent" })
vim.keymap.set("n", "<D-p>", builtin.git_files, { desc = "Find File (git-files)" })
vim.keymap.set("n", "<leader><space>", builtin.git_files, { desc = "Find File (git-files)" })

-- Tab to toggle fold in normal mode
vim.keymap.set("n", "<Tab>", "za", { desc = "Toggle fold" })

-- Cmd+/ for commenting
vim.keymap.set("n", "<D-/>", "gcc", { desc = "Comment line", remap = true })
vim.keymap.set("v", "<D-/>", "gc", { desc = "Comment selection", remap = true })
