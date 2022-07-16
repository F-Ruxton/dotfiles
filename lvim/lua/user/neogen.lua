local ok, M = pcall(require, "neogen")

if not ok then
    if vim.g.debug_plugin_loaders then
        print("Failed to load module: neogen")
    end
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
