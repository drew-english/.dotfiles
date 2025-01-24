return {
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		init = function()
			require("nightfox").setup({
				groups = {
					nightfox = {
						LineNr = { fg = "#737272" },
						Special = { fg = "#95afb7" },
					},
				},
				palettes = {
					nightfox = {
						bg0 = "#12161a",
						bg1 = "#191d22",
						bg3 = "#282e38",
						sel0 = "#2a3139",
						sel1 = "#495565",
					},
				},
			})
			vim.cmd.colorscheme("nightfox")
		end,
	},
}
