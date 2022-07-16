lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

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

lvim.builtin.which_key.mappings["x"] = {
    name = "+Test",
    r = {
        name = "Run",
        f = { '<Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', "File" },
        n = { '<Cmd>lua require("neotest").run.run()<CR>', "Nearest" },
        d = { '<Cmd>lua require("neotest").run.run()<CR>', "Debug nearest" },
        D = { '<Cmd>lua require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"})<CR>', "Debug file" },
        l = { '<Cmd>lua require("neotest").run.run_last()<CR>', "Last" },
        L = { '<Cmd>lua require("neotest").run.run_last({strategy = "dap"})<CR>', "Debug last" },
        m = { '<Cmd>lun require("neotest").run_marked()', "Marked" },
        M = { '<Cmd>lun require("neotest").run_marked({strategy = "dap"})', "Debug marked" },
    },
    d = { '<Cmd>lua require("neotest").diagnostics.toggle()<CR>', "Diagnostics" },
    o = { '<Cmd>lua require("neotest").output.open({ enter = true })<CR>', "Output" },
    s = {
        name = "Summary",
        o = { '<Cmd>lua require("neotest").summary.open()<CR>', "Open" },
        c = { '<Cmd>lua require("neotest").summary.close()<CR>', "Close" },
        t = { '<Cmd>lua require("neotest").summary.toggle()<CR>', "Toggle" },
        m = { '<Cmd>lua require("neotest").summary.target()<CR>', "Mark" },
        C = { '<Cmd>lua require("neotest").summary.clear_marked()<CR>', "Clear marked" },
    },
    j = {
        name = "Jump",
        k = { '<Cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>', "Prev", silent = true },
        j = { '<Cmd>lua require("neotest").jump.next({ status = "failed" })<CR>', "Prev", silent = true },
    },
}

lvim.builtin.which_key.mappings["r"] = {
    name = "refactoring",
    -- Visual mode mappings
    f = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Funtion", mode = "v" },
    F = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract Function to File", mode = "v" },
    v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable", mode = "v" },
    i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable", mode = "v" },
    b = { "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block", mode = "v" },
    B = { "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract Block to File", mode = "v" },
    r = { "<Cmd>lua require('refactoring').select_refactor()<CR>", "Select Refactoring", mode = "v" },
}

lvim.builtin.which_key.mappings["G"] = {
    name = "Github",
    h = {
        name = "GH",
        c = {
            name = "+Commits",
            c = { "<cmd>GHCloseCommit<cr>", "Close" },
            e = { "<cmd>GHExpandCommit<cr>", "Expand" },
            o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
            p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
            z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
        },
        i = {
            name = "+Issues",
            p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
        },
        l = {
            name = "+Litee",
            t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
        },
        r = {
            name = "+Review",
            b = { "<cmd>GHStartReview<cr>", "Begin" },
            c = { "<cmd>GHCloseReview<cr>", "Close" },
            d = { "<cmd>GHDeleteReview<cr>", "Delete" },
            e = { "<cmd>GHExpandReview<cr>", "Expand" },
            s = { "<cmd>GHSubmitReview<cr>", "Submit" },
            z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
        },
        p = {
            name = "+Pull Request",
            c = { "<cmd>GHClosePR<cr>", "Close" },
            d = { "<cmd>GHPRDetails<cr>", "Details" },
            e = { "<cmd>GHExpandPR<cr>", "Expand" },
            o = { "<cmd>GHOpenPR<cr>", "Open" },
            p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
            r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
            t = { "<cmd>GHOpenToPR<cr>", "Open To" },
            z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
        },
        t = {
            name = "+Threads",
            c = { "<cmd>GHCreateThread<cr>", "Create" },
            n = { "<cmd>GHNextThread<cr>", "Next" },
            t = { "<cmd>GHToggleThread<cr>", "Toggle" },
        },
    },
    l = {
        o = {
            '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
            "Open"
        },
        l = {
            '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
            "Link",
            mode = 'v'
        },
        L = {
            '<cmd>lua require"gitlinker".get_repo_url()<cr>',
            "Link",
            silent = true
        },
        h = {
            '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
            "Home",
            silent = true
        }
    },
}
