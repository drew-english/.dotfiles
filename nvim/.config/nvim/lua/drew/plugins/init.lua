-- Core plugins are added here, and plugins requiring extra configuration are referenced in their own files

require("drew.plugins.colorshceme")
require("drew.plugins.dispatch") -- TODO: lazy load?
require("drew.plugins.mini")
require("drew.plugins.fugitive")
require("drew.plugins.telescope")
require("drew.plugins.treesitter")
require("drew.plugins.lsp")
require("drew.plugins.projectionist")

vim.pack.add({
    "https://github.com/github/copilot.vim",
    "https://github.com/christoomey/vim-tmux-navigator",
    "https://github.com/kevinhwang91/nvim-bqf", -- TODO: check setup
	"https://github.com/folke/which-key.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", "<CMD>Undotree<CR>", {})
