-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    t = { "<cmd>TroubleToggle<cr>" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

lvim.builtin.which_key.mappings["S"] = {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
-- Remaps for the refactoring operations currently offered by the plugin

lvim.builtin.which_key.mappings["r"] = {
    name = "refactoring",

    -- Visual mode mappings
    f = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Funtion", mode = "v" },
    F = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract Function to File", mode = "v" },
    v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable", mode = "v" },
    i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable", mode = "v" },

    -- Extract block doesn't need visual mode
    b = { "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block", mode = "v" },
    B = { "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract Block to File", mode = "v" },

    r = { "<Cmd>lua require('refactoring').select_refactor()<CR>", "Select Refactoring", mode = "v" },
}
