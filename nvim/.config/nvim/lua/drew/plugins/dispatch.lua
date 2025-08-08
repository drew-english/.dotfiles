return {
	"tpope/vim-dispatch",
	config = function()
		vim.g.dispatch_no_tmux_make = 1 -- Disable tmux split in favor of neovim jobs for make

		if vim.fn.filereadable("/bin/zsh") == 1 then
			vim.opt.shell = "/bin/zsh"
		end

        local strip_line = function()
            if string.find(vim.b.dispatch, ":") then
                vim.b.dispatch = string.gsub(vim.b.dispatch, ":%d+", "")
            end
        end

		local run_dispatch = function()
			vim.g.last_dispatch = vim.b.dispatch
			vim.cmd("Dispatch")
		end

		local run_dispatch_file = function()
            strip_line()
            run_dispatch()
		end

		local run_last_dispatch = function()
			if not vim.g.last_dispatch then
				vim.notify("No previous dispatch found", vim.log.levels.WARN)
				return
			end
			vim.cmd("Dispatch " .. vim.g.last_dispatch)
		end

        local run_dispatch_line = function()
            if not string.find(vim.b.dispatch, "rspec") then
                vim.notify("Dispatch line only works with rspec", vim.log.levels.WARN)
                return
            end

            strip_line()
            vim.b.dispatch = vim.b.dispatch .. ":" .. vim.fn.getcurpos()[2]
            run_dispatch()
        end

		vim.keymap.set("n", "<leader>dx", "<cmd>AbortDispatch<CR>", { desc = "[D]ispatch Abort" })
		vim.keymap.set("n", "<leader>df", run_dispatch_file, { desc = "[D]ispatch [F]ile" })
		vim.keymap.set("n", "<leader>dr", run_last_dispatch, { desc = "[D]ispatch [R]erun" })
		vim.keymap.set("n", "<leader>dl", run_dispatch_line, { desc = "[D]ispatch [L]ine" })
	end,
}
