function config()
    local ok, M = pcall(require, "neotest")

    if vim.g.debug_plugin_loaders then
        if ok then
            print("Loaded module: neotest")
        else
            print("Failed to load module: neotest")
        end
    end

    if not ok then
        return
    end

    M.setup({
        adapters = {
            require("neotest-python")({
                dap = { justMyCode = false },
            }),
            require("neotest-plenary"),
            require("neotest-vim-test")({
                ignore_file_types = { "python", "vim", "lua" },
            }),
        },
    })
end

return {
    "nvim-neotest/neotest",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-vim-test",
    },
    config = config,
}
