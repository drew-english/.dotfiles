return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local ts_actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = ts_actions.close,
						["<C-q>"] = ts_actions.smart_send_to_qflist,
						-- Match prev and next key binds
						["<Tab>"] = ts_actions.toggle_selection + ts_actions.move_selection_next,
						["<S-Tab>"] = ts_actions.toggle_selection + ts_actions.move_selection_previous,
					},
				},
				cache_picker = {
					num_pickers = 10,
				},
			},
			-- pickers = {}
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				fzf = {},
			},
		})

		-- Enable telescope extensions, if they are installed
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>s?", builtin.help_tags, { desc = "[S]earch Help" })
		vim.keymap.set("n", "<leader>sh", builtin.pickers, { desc = "[S]earch [H]istory" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "[S]earch by [G]it" })
		vim.keymap.set("n", "<leader>sg", builtin.git_status, { desc = "[S]earch [G]it status files" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s*", builtin.grep_string, { desc = "[S]earch [*] in All Files" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>s/", builtin.live_grep, { desc = "[S]earch [/] in All Files" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
	end,
}
