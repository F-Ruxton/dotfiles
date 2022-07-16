function config()
    vim.o.timeoutlen = 750
end

return {
    "tpope/vim-surround",
    keys = { "c", "d", "y" },
    config = config,
}
