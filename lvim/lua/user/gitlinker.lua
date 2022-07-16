local ok, M = pcall(require, "gitlinker")

if not ok then
    if vim.g.debug_plugin_loaders then
        print("Failed to load module: ")
    end
    return
end

M.setup({
    opts = {
        remote = nil, -- force the use of a specific remote
        -- adds current line nr in the url for normal mode
        add_current_line_on_normal_mode = true,
        -- callback for what to do with the url
        action_callback = require("gitlinker.actions").copy_to_clipboard,
        -- print the url after performing the action
        print_url = true,
    },
    callbacks = {
        ["github.com"] = require("gitlinker.hosts").get_github_type_url,
    },
})
