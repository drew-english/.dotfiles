return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	init = function()
	-- 		vim.cmd.colorscheme("tokyonight-moon")
	-- 		vim.cmd.hi("Comment gui=none")
	-- 	end,
	-- },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"EdenEast/nightfox.nvim",
		init = function()
			vim.cmd.colorscheme("nightfox")
		end,
	},
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- { "shaunsingh/nord.nvim" },
}
