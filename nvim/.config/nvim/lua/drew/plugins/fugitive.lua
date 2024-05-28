return {
	"tpope/vim-fugitive",
	priority = 49, -- Ensure fugtive is loaded after mini.git
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
	end,
}
