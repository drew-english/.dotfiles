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
        priority = 1000,
		init = function()
			require("nightfox").setup({
				groups = {
					nightfox = {
						LineNr = { fg = "#737272" },
					},
				},
                palettes = {
					nightfox = {
                        bg0 = "#171b20",
                        bg1 = "#1f242a",
                        bg3 = "#323a46",
                        sel0 = "#353d47",
                        sel1 = "#495565",
					},
                },
			})
			vim.cmd.colorscheme("nightfox")
		end,
	},
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- { "shaunsingh/nord.nvim" },
}
