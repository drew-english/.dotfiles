return {
	"tpope/vim-dispatch",
	config = function()
		vim.g.dispatch_no_tmux_make = 1 -- Disable tmux split in favor of neovim jobs for make

		if vim.fn.filereadable("/bin/zsh") == 1 then
			vim.opt.shell = "/bin/zsh"
		end

        vim.keymap.set("n", "<leader>dx", "<cmd>AbortDispatch<CR>", { desc = "[D]ispatch Abort" })

		local augroup = vim.api.nvim_create_augroup("DrewVimDispatch", {})
		vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave" }, {
			group = augroup,
			callback = function(args)
				if args.file ~= "_spec.rb" then
					vim.keymap.set(
						"n",
						"<leader>df",
						"<cmd>Focus rspec %<CR><cmd>Dispatch<CR>",
						{ desc = "[D]ispatch [F]ile" }
					)
					vim.keymap.set(
						"n",
						"<leader>dl",
						'<cmd>execute "Focus rspec ".expand("%").":".getcurpos()[1]<CR><cmd>Dispatch<CR>',
						{ desc = "[D]ispatch current [L]ine" }
					)
					vim.keymap.set("n", "<leader>dr", "<cmd>Dispatch<CR>", { desc = "[D]ispatch [R]e-rerun" })
				end
			end,
		})
	end,
}
