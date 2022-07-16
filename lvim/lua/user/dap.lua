local ok, dap = pcall(require, "dap")

if vim.g.debug_plugin_loaders then
    if ok then
        print("Loaded module: dap")
    else
        print("Failed to load module: dap")
    end
end

if not ok then
    return
end

local ok, dapui = pcall(require, "dapui")
if not ok then
    if vim.g.debug_plugin_loaders then
        print("Failed to load module: dapui")
    end
    return
end

local ok, dappython = pcall(require, "dap-python")
if not ok then
    if vim.g.debug_plugin_loaders then
        print("Failed to load module: dap-python")
    end
    return
end

local ok, dapvt = pcall(require, "nvim-dap-virtual-text")
if not ok then
    if vim.g.debug_plugin_loaders then
        print("Failed to load module: nvim-dap-virtual-text")
    end
    return
end

-- ================================================================================
-- dap-virtual-text

dapvt.setup {
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

-- ================================================================================
-- dap-ui
dapui.setup({
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
    layouts = {
        {
            elements = {
                'scopes',
                'breakpoints',
                'stacks',
                'watches',
            },
            size = 40,
            position = 'left',
        },
        {
            elements = {
                'repl',
                'console',
            },
            size = 10,
            position = 'bottom',
        },
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

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

lvim.keys.normal_mode["<C-v>"] = ":lua require('dapui').eval(function () vim.fn.expand('<cexpr>') end)<CR>"
lvim.keys.visual_mode["<C-v>"] = ":lua require('dapui').eval(function () vim.fn.expand('<cexpr>') end)<CR>"

-- ================================================================================
-- dap-python

dappython.setup("/usr/local/anaconda3/envs/debugpy/bin/python")
dappython.test_runner = "pytest"

-- To pick up conda env:
-- local get_python_path = function()
--   local venv_path = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX')
--   ...

dap.configurations.python = dap.configurations.python or {}

table.insert(
    dap.configurations.python,
    {
        name = "Attach Remote (Custom)",
        type = "python",
        request = "attach",
        port = 20103,
        host = "localhost",
        justMyCode = false,
        pathMappings = {
            {
                localRoot = "${workspaceFolder}",
                remoteRoot = "."
            }
        }
    }
)
