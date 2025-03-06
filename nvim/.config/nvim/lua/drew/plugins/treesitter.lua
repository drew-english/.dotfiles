return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"RRethy/nvim-treesitter-endwise",
	},
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc" },
		auto_install = true,
		highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
		endwise = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
