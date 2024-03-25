return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			width = 0.80,
		},
	},
	config = function(_, opts)
		require("zen-mode").setup(opts)

		vim.keymap.set("n", "<leader>zz", vim.cmd.ZenMode)
	end,
}
