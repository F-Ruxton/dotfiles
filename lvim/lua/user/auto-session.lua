function config()
    local ok, M = pcall(require, "auto-session")

    if vim.g.debug_plugin_loaders then
        if ok then
            print("Loaded module: auto-session")
        else
            print("Failed to load module: auto-session")
        end
    end

    if not ok then

        return
    end

    M.setup {
        log_level = 'info',
        auto_session_suppress_dirs = { '~/', '~/Projects' }
    }
end

return { "rmagatti/auto-session", config = config }
