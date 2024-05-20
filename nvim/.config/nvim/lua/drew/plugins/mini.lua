return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.statusline").setup()
		require("mini.files").setup({
			mappings = {
				go_in_plus = "<CR>",
			},
			options = {
				use_as_default_explorer = false,
			},
		})

		require("mini.bracketed").setup({
			undo = { suffix = "" },
			window = { suffix = "" },
			yank = { suffix = "" },
		})

		local diff = require("mini.diff")
		diff.setup({
			view = {
				style = "sign",
				signs = {
					add = "+",
					change = "~",
					delete = "_",
				},
			},
			mappings = {
				apply = "<leader>ha",
				reset = "<leader>hu",
				textobject = "h",
			},
		})

		require("mini.ai").setup({
			custom_textobjects = {
				h = diff.textobject,
			},
		})

		require("drew.custom.mini")
	end,
}
