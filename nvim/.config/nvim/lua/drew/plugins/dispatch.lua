return {
	"tpope/vim-dispatch",
	config = function()
		vim.g.dispatch_no_tmux_make = 1 -- Disable tmux split in favor of neovim jobs for make

		if vim.fn.filereadable("/bin/zsh") == 1 then
			vim.opt.shell = "/bin/zsh"
		end

		local augroup = vim.api.nvim_create_augroup("DrewVimDispatch", {})
		vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave" }, {
			group = augroup,
			callback = function(args)
				if args.file ~= "_spec.rb" then
					vim.keymap.set(
						"n",
						"<C-F10>",
						"<cmd>Focus rspec %<CR><cmd>Dispatch<CR>",
						{ desc = "Run entire spec file" }
					)
					vim.keymap.set(
						"n",
						"<C-S-F10>",
						'<cmd>execute "Focus rspec ".expand("%").":".getcurpos()[1]<CR><cmd>Dispatch<CR>',
						{ desc = "Run specs from cursor line" }
					)
					vim.keymap.set("n", "<C-F8>", "<cmd>Dispatch<CR>", { desc = "Re-run previous specs" })
				end
			end,
		})
	end,
}
