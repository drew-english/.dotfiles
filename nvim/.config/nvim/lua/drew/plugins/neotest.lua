return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-extensions/nvim-ginkgo",
		"olimorris/neotest-rspec",
	},
	config = function()
		local ntest = require("neotest")
		ntest.setup({
			adapters = {
				require("nvim-ginkgo"),
				require("neotest-rspec"),
			},
			icons = {
				passed = "✓",
				failed = "✗",
				running = "…",
				skipped = "-",
				uknown = "?",
			},
			summary = {
				enabled = false,
			},
			benchmark = {
				enabled = false,
			},
			output = {
				enabled = false,
			},
			output_panel = {
				enabled = false,
			},
			watch = {
				enabled = false,
			},
		})

		vim.keymap.set("n", "<leader>tn", function()
			ntest.run.run()
		end)
		vim.keymap.set("n", "<leader>td", function()
			ntest.run.run(vim.fn.expand("%"))
		end)
		vim.keymap.set("n", "<leader>tw", function()
			ntest.run.run(vim.fn.getcwd())
		end)
		vim.keymap.set("n", "<leader>tl", function()
			ntest.run.run_last()
		end)
	end,
}
