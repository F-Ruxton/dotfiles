function config()
    local ok, M = pcall(require, "aerial")

    print("Setting up aerial")

    if vim.g.debug_plugin_loaders then
        if ok then
            print("Loaded module: aerial")
        else
            print("Failed to load module: aerial")
        end
    end

    if not ok then
        return
    end

    M.setup({})
end

return { "stevearc/aerial.nvim", config = config }
