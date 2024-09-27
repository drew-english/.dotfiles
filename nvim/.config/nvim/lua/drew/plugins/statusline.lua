return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
			lualine_c = { { "filename", path = 1, newfile_status = true } },
			lualine_x = { "filetype" },
			lualine_y = {},
			lualine_z = { "location" },
		},
		extensions = {
			"quickfix",
			{
				sections = {
					lualine_a = {
						function()
							return "" .. " " .. vim.fn.FugitiveHead()
						end,
					},
					lualine_z = { "location" },
				},
				filetypes = { "fugitive" },
			},
		},
	},
}
