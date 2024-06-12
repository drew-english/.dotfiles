return {
	"tpope/vim-fugitive",
	dependencies = {
		"tpope/vim-rhubarb",
	},
	priority = 49, -- Ensure fugtive is loaded after mini.git
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })
		vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "[G]it [B]lame" })
		vim.keymap.set("n", "<leader>go", "<cmd>GBrowse <cword><CR>", { desc = "[G]itHub [O]pen" })

		-- Set :Browse for opening GitHub URLs via :GBrowse
		vim.api.nvim_create_user_command("Browse", function(data)
			vim.ui.open(data.fargs[1])
		end, { nargs = 1 })

		vim.cmd("let g:github_enterprise_urls = ['https://github.azc.ext.hp.com']")
	end,
}
