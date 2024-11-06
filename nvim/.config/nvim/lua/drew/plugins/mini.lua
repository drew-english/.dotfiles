return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.surround").setup()
		-- require("mini.git").setup()
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
			quickfix = { suffix = "" },
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
				h = diff.textobject,
				F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
			},
		})

        -- require("mini.statusline").setup()
		require("drew.custom.mini")
	end,
}
