local ok, M = pcall(require, "neotest")

if not ok then
    if vim.g.debug_plugin_loaders then
        print("Failed to load module: ")
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
