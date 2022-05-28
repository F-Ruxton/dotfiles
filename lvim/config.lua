--[[
lvim is the global options object

Linters should be filled in as strings with either
a global executable or a path to an executable
]]

-------------------------------------------------------------------------------
-- vim settings
vim.opt.history = 1000
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.signcolumn = "yes:2"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.spell = true
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmode = "longest:full,full"
-- vim.opt.nowrap = true
vim.opt.list = true
-- vim.opt.listchars = "tab:▸\ ,trail:·"
vim.opt.mouse = "a"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- vim.opt.nojoinspaces = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.exrc = true
vim.opt.backup = false
vim.opt.updatetime = 300 -- Reduce time for highlighting other references
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files

-------------------------------------------------------------------------------
-- general lvim
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "kanagawa"
lvim.lsp.diagnostics.virtual_text = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")

-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-------------------------------------------------------------------------------
-- Telescope
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
    },
    -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
    },
}

-------------------------------------------------------------------------------
-- WhichKey
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

-------------------------------------------------------------------------------
-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-------------------------------------------------------------------------------
-- Treesitter
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-------------------------------------------------------------------------------
-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
    { command = "isort", filetypes = { "python" } },
    --   {
    --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    --     command = "prettier",
    --     ---@usage arguments to pass to the formatter
    --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    --     extra_args = { "--print-with", "100" },
    --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    --     filetypes = { "typescript", "typescriptreact" },
    --   },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8", filetypes = { "python" } },
    {
        -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "shellcheck",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--severity", "warning" },
    },
    -- {
    --   command = "codespell",
    --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    --   filetypes = { "javascript", "python" },
    -- },
}

-------------------------------------------------------------------------------
-- Additional Plugins
lvim.plugins = {
    { "rebelot/kanagawa.nvim" },
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
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    { "tpope/vim-repeat" },
    { "tpope/vim-unimpaired" },
    {
        "tpope/vim-surround",
        keys = { "c", "d", "y" },
        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        setup = function()
            vim.o.timeoutlen = 500
        end
    },
    { "pearofducks/ansible-vim" },
    { "tpope/vim-commentary" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "tpope/vim-abolish" },
    { "tpope/vim-dispatch" },
    { "tpope/vim-eunuch" },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    { "editorconfig/editorconfig-vim" },
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
    { "sindrets/diffview.nvim", event = "BufRead" },
    {
        "pwntester/octo.nvim",
        event = "BufRead",
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
        "metakirby5/codi.vim",
        cmd = "Codi",
    },
    { 'unblevable/quick-scope', qs_highlight_on_keys = { 'f', 'F', 't', 'T' } },
    { 'puremourning/vimspector' },
    {
        "akinsho/toggleterm.nvim",
        tag = 'v1.*',
        config = function()
            require("toggleterm").setup()
        end
    },
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
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
    { 'sickill/vim-pasta' },
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
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
    { 'wellle/targets.vim' },
    { 'vim-test/vim-test' },
    { 'mg979/vim-visual-multi' },
    { 'python-rope/ropevim' },
    -- { 'junegunn/vim-peekaboo' },
    -- { 'junegunn/splitjoin' },
    -- { 'projectionist' },
    -- { 'heritage' },
    -- { 'visual-star-search' }
}


lvim.builtin.which_key.mappings["S"] = {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-------------------------------------------------------------------------------
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.py" },
    -- Show ruler one character past black's 88
    command = "set colorcolumn=89",
})


vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.json", "*.jsonc" },
    -- enable wrap mode for json files only
    command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})
