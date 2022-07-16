function config()
    local ok, M = pcall(require, "bfq")

    if vim.g.debug_plugin_loaders then
        if ok then
            print("Loaded module: bfq")
        else
            print("Failed to load module: bfq")
        end
    end

    if not ok then
        return
    end

    M.setup({
        auto_enable = true,
        preview = {
            win_height = 12,
            win_vheight = 12,
            delay_syntax = 80,
            border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
            vsplit = "",
            ptogglemode = "z,",
            stoggleup = "",
        },
        filter = {
            fzf = {
                action_for = { ["ctrl-s"] = "split" },
                extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
            },
        },
    })
end

return {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = config,
}
