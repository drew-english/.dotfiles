local diff = require("mini.diff")

vim.keymap.set("n", "<leader>hd", diff.toggle_overlay, { desc = "Toggle [h]unk [d]iff overlay" })
vim.keymap.set(
	"n",
	"-",
	"<CMD>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>",
	{ desc = "Open MiniFiles" }
)

-- Add custom keymaps to mini.files
local files_open_new_win = function(win_cmd)
	return function()
		local new_target_window
		vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
			vim.cmd(win_cmd)
			new_target_window = vim.api.nvim_get_current_win()
		end)

		MiniFiles.set_target_window(new_target_window)
		MiniFiles.go_in({ close_on_file = true })
	end
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		vim.keymap.set("n", "<c-v>", files_open_new_win("vs"), { buffer = buf_id, desc = "Open in vertical split" })
		vim.keymap.set("n", "<c-t>", files_open_new_win("tabnew"), { buffer = buf_id, desc = "Open in new tab" })
		vim.keymap.set("n", "<esc>", MiniFiles.close, { buffer = buf_id, desc = "Close" })
	end,
})

vim.keymap.set("n", "[i", function()
	require("mini.bracketed").indent("backward")
end, { desc = "Previous [I]ndent" })
