function config()
    local ok, M = pcall(require, "hop")

    if not ok then
        if vim.g.debug_plugin_loaders then
            print("Failed to load module: hop")
        end
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
