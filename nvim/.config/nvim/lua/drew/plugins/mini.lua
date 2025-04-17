return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.files").setup({
			mappings = {
				go_in_plus = "<CR>",
			},
			options = {
				use_as_default_explorer = false,
			},
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
				reset = "<leader>hr",
				textobject = "H",
			},
		})

		local ai = require("mini.ai")
		ai.setup({
			custom_textobjects = {
				H = diff.textobject,
				F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
			},
		})

		require("drew.custom.mini")
	end,
}
