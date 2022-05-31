lvim.plugins = {
    -- { "junegunn/vim-peekaboo" },
    -- { "junegunn/splitjoin" },
    -- { "projectionist" },
    -- { "heritage" },
    -- { "visual-star-search" }
    -- { "puremourning/vimspector" },
    { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
    { "theHamsta/nvim-dap-virtual-text" },
    { "mfussenegger/nvim-dap-python" },
    { "editorconfig/editorconfig-vim" },
    { "folke/trouble.nvim", cmd = "TroubleToggle" },
    { "metakirby5/codi.vim", cmd = "Codi" },
    { "pearofducks/ansible-vim" },
    { "pwntester/octo.nvim", event = "BufRead" },
    { "rebelot/kanagawa.nvim" },
    { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline" },
    { "sindrets/diffview.nvim", event = "BufRead" },
    { "tpope/vim-abolish" },
    { "tpope/vim-commentary" },
    { "tpope/vim-dispatch" },
    { "tpope/vim-eunuch" },
    { "tpope/vim-repeat" },
    { "tpope/vim-unimpaired" },
    { "mg979/vim-visual-multi" },
    { "python-rope/ropevim" },
    { "sickill/vim-pasta" },
    { "unblevable/quick-scope", qs_highlight_on_keys = { "f", "F", "t", "T" } },
    { "vim-test/vim-test" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "ThePrimeagen/harpoon" },
    {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    },
    { "wellle/targets.vim" },
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "tpope/vim-surround",
        keys = { "c", "d", "y" },
        -- make sure to change the value of `timeoutlen` if it"s not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        setup = function()
            vim.o.timeoutlen = 500
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            vim.g.indentLine_enabled = 1
            vim.g.indent_blankline_char = "▏"
            vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
            vim.g.indent_blankline_buftype_exclude = { "terminal" }
            vim.g.indent_blankline_show_trailing_blankline_indent = false
            vim.g.indent_blankline_show_first_indent_level = false
        end
    },
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = function()
            require("persistence").setup {
                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            }
        end,
    },
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gvdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
        },
        ft = { "fugitive" }
    },
    {
        "ahmedkhalf/lsp-rooter.nvim",
        event = "BufRead",
        config = function()
            require("lsp-rooter").setup()
        end,
    },
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require("neoscroll").setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil, -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil, -- Function to run after the scrolling animation ends
            })
        end
    },
}
