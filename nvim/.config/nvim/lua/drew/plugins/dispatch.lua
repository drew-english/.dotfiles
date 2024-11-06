return {
    "tpope/vim-dispatch",
    config = function()
        vim.g.dispatch_no_tmux_make = 1 -- Disable tmux split in favor of neovim jobs for make

        if vim.fn.filereadable("/bin/zsh") == 1 then
            vim.opt.shell = "/bin/zsh"
        end
    end
}
