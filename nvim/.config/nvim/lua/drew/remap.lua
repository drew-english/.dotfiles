local set = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzz")
set("n", "N", "Nzz")

set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
set("n", "<Esc>", "<cmd>nohlsearch<CR>")

set("n", "<leader>q", vim.cmd.copen, { desc = "Open [Q]uickfix list" })
set("n", "<leader>Q", vim.cmd.cclose, { desc = "Close [Q]uickfix list" })

set("x", "<leader>p", [["_dP]])
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader>X", "<cmd>source %<CR>", { desc = "Execute the current file" })

set("n", "<leader>%", "<cmd>call setreg('+', expand('%'))<CR>", { desc = "Copy buffer file path" })
set("x", "*", "\"zy/<C-r>z<CR>", { desc = "Search forwards for currently selected text" })
set("x", "#", "\"zy?<C-r>z<CR>", { desc = "Search backwards for currently selected text" })
