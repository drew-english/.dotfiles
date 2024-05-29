return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"williamboman/mason.nvim",
			"suketa/nvim-dap-ruby",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("nvim-dap-virtual-text").setup()
			require("dap-ruby").setup()

			-- open UI automatically
			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
		keys = {
			{ "<leader>b", "<CMD>lua require('dap').toggle_breakpoint()<CR>", { desc = "DAP: Toggle breakpoint" } },
			{ "<leader>gb", "<CMD>lua require('dap').run_to_cursor()<CR>", { desc = "DAP: Run to cursor" } },
			{ "<F1>", "<CMD>lua require('dap').continue()<CR>", { desc = "DAP: Continue" } },
			{ "<F2>", "<CMD>lua require('dap').step_into()<CR>", { desc = "DAP: Step into" } },
			{ "<F3>", "<CMD>lua require('dap').step_over()<CR>", { desc = "DAP: Step over" } },
			{ "<F4>", "<CMD>lua require('dap').step_out()<CR>", { desc = "DAP: Step out" } },
			{ "<F5>", "<CMD>lua require('dap').step_back()<CR>", { desc = "DAP: Step back" } },
			{ "<F13>", "<CMD>lua require('dap').restart()<CR>", { desc = "DAP: Restart" } },
			{
				"<leader>?",
				function()
					require("dapui").eval(nil, { enter = true })
				end,
				{ desc = "DAP: Eval var under cursor" },
			},
		},
	},
}
