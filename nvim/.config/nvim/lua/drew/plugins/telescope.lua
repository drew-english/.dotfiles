vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
})

vim.pack.add({
        "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    },
    {
        load = function()
            if vim.fn.executable("make") == 1 then
                vim.cmd("packadd telescope-fzf-native.nvim")
                -- run make in the plugin dir if not already built

                local plugin_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"

                if vim.fn.filereadable(plugin_path .. "/build/libfzf.so") == 1 then
                    return
                end

                vim.cmd("echo 'Building telescope-fzf-native.nvim...'")
                vim.system({ "make" }, { cwd = plugin_path })
            end
        end
    })

local ts_actions = require("telescope.actions")
local ts = require("telescope")

ts.setup({
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
ts.load_extension("fzf")
ts.load_extension("ui-select")

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", function()
    builtin.git_files({ show_untracked = true })
end, { desc = "Search Project Files" })

vim.keymap.set("n", "<C-f>", function()
    builtin.live_grep({ additional_args = { "--hidden", "--glob=!.git/" } })
end, { desc = "Search All Files" })

vim.keymap.set("n", "<leader>s?", builtin.help_tags, { desc = "[S]earch Help" })
vim.keymap.set("n", "<leader>sh", builtin.pickers, { desc = "[S]earch [H]istory" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sg", builtin.git_status, { desc = "[S]earch [G]it status files" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s*", builtin.grep_string, { desc = "[S]earch [*] in All Files" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
