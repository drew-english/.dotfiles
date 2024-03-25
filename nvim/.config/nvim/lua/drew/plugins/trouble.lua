return {
	"folke/trouble.nvim",
	opts = {
		icons = false,
		fold_open = "v",
		fold_closed = ">",
		indent_lines = false,
		signs = {
			error = "E",
			warning = "W",
			hint = "H",
			information = "I",
		},
		use_diagnostic_signs = false,
	},
	config = function(_, opts)
		local trouble = require("trouble")
		trouble.setup(opts)

		vim.keymap.set("n", "<leader>xw", function()
			trouble.toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>xd", function()
			trouble.toggle("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>xq", function()
			trouble.toggle("quickfix")
		end)
		vim.keymap.set("n", "<leader>xl", function()
			trouble.toggle("loclist")
		end)
	end,
}
