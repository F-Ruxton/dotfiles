function config()
    local ok, M = pcall(require, "hop")

    if vim.g.debug_plugin_loaders then
        if ok then
            print("Loaded module: hop")
        else
            print("Failed to load module: hop")
        end
    end

    if not ok then
        return
    end

    M.setup()
    vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
end

return {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = config,
}
