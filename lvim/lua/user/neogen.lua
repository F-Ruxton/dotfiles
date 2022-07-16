function config()
    local ok, M = pcall(require, "neogen")

    if vim.g.debug_plugin_loaders then
        if ok then
            print("Loaded module: neogen")
        else
            print("Failed to load module: neogen")
        end
    end

    if not ok then

        return
    end

    M.setup(
        {
            snippet_engine = "luasnip",
            languages = {
                python = {
                    template = {
                        annotation_convention = "google_docstrings"
                    }
                }
            }
        }
    )
end

return {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = config,
}
