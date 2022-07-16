local ok, M = pcall(require, "bfq")

if not ok then
    if vim.g.debug_plugin_loaders then
        print("Failed to load module: bfq")
    end
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
