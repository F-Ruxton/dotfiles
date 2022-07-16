function config()
    local ok, M = pcall(require, "neotest")

    if not ok then
        if vim.g.debug_plugin_loaders then
            print("Failed to load module: neotest")
        end
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
