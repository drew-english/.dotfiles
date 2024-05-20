vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.cmd.copen, { desc = "Open [Q]uickfix list" })

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set(
	"n",
	"<leader>by",
	vim.cmd.call("setreg('+', expand('%'))"),
	{ desc = "[B]uffer path [Y]ank to clipboard" }
)
