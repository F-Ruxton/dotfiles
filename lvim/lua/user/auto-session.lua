function config()
    local ok, M = pcall(require, "auto-session")

    if not ok then
        if vim.g.debug_plugin_loaders then
            print("Failed to load module: auto-session")
        end
        return
    end

    M.setup {
        log_level = 'info',
        auto_session_suppress_dirs = { '~/', '~/Projects' }
    }
end

return { "rmagatti/auto-session", config = config }
