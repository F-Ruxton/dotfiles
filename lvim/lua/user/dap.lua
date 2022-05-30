-- local status_ok, dap = pcall(require, "dap")
-- if not status_ok then
--     return
-- end

-- dap.configurations.python = dap.configurations.python or {}
-- table.insert(dap.configurations.python, {
--     type = "python",
--     request = "launch",
--     name = "launch with options",
--     program = "${file}",
--     python = function() end,
--     pythonPath = function()
--         local path
--         for _, server in pairs(vim.lsp.buf_get_clients()) do
--             if server.name == "pyright" or server.name == "pylance" then
--                 path = vim.tbl_get(server, "config", "settings", "python", "pythonPath")
--                 break
--             end
--         end
--         path = vim.fn.input("Python path: ", path or "", "file")
--         return path ~= "" and vim.fn.expand(path) or nil
--     end,
--     args = function()
--         local args = {}
--         local i = 1
--         while true do
--             local arg = vim.fn.input("Argument [" .. i .. "]: ")
--             if arg == "" then
--                 break
--             end
--             args[i] = arg
--             i = i + 1
--         end
--         return args
--     end,
--     justMyCode = function()
--         local yn = vim.fn.input "justMyCode? [y/n]: "
--         if yn == "y" then
--             return true
--         end
--         return false
--     end,
--     stopOnEntry = function()
--         local yn = vim.fn.input "stopOnEntry? [y/n]: "
--         if yn == "y" then
--             return true
--         end
--         return false
--     end,
--     console = "integratedTerminal",
-- })
-- lvim.builtin.dap.on_config_done = function(_)
--     lvim.builtin.which_key.mappings["d"].name = " Debug"
-- end

require("nvim-dap-virtual-text").setup {
    enabled = true, -- enable this plugin (the default)
    enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true, -- show stop reason when stopped for exceptions
    commented = false, -- prefix virtual text with comment string
    only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
    all_references = false, -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
                id = "scopes",
                size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 00.25 },
        },
        size = 40,
        position = "left", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = { "repl" },
        size = 10,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    }
})

require("dap-python").setup("/usr/local/anaconda3/envs/debugpy/bin/python")
