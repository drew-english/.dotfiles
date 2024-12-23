return {
	"tpope/vim-projectionist",
	init = function()
		vim.g.projectionist_heuristics = {
            ["/"] = {
                ["Gemfile.lock"] = { alternate = "Gemfile" },
                ["Gemfile"] = { alternate = "Gemfile.lock" },
                ["app/*.rb"] = { alternate = "spec/{}_spec.rb" },
                ["lib/*.rb"] = { alternate = { "spec/lib/{}_spec.rb", "spec/{}_spec.rb" } },
            },
			["spec/"] = {
				["spec/*_spec.rb"] = { alternate = { "app/{}.rb", "lib/{}.rb" }, type = "spec" },
                ["spec/lib/*_spec.rb"] = { alternate = "lib/{}.rb", type = "spec" },
			},
		}

        vim.keymap.set("n", "<leader>aa", "<cmd>A<CR>", { desc = "Open alternate file" })
        vim.keymap.set("n", "<leader>as", "<cmd>AS<CR>", { desc = "Split and open alternate file" })
        vim.keymap.set("n", "<leader>av", "<cmd>AV<CR>", { desc = "Vsplit and open alternate file" })
        vim.keymap.set("n", "<leader>at", "<cmd>AT<CR>", { desc = "New tab and open alternate file" })
	end,
}