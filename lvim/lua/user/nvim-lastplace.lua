function config()
    local ok, M = pcall(require, "nvim-lastplace")

    if not ok then
        if vim.g.debug_plugin_loaders then
            print("Failed to load module: nvim-lastplace")
        end
        return
    end

    M.setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
            "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
    })
end

return {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = config,
}
