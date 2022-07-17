-- vim config {{{
-- Vim
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
-- }}}

-- themes {{{
lvim.colorscheme = "kanagawa"

-- lvim.colorscheme = "melange"
-- vim.opt.background = "light"

-- vim.g.tokyonight_style = "day"
-- lvim.colorscheme = "tokyonight"
-- }}}

-- lvim config {{{
-- General lvim
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lsp.diagnostics.virtual_text = false

-- User config for lunarvim-bundled plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.dap.active = true


-- Make toggleterm remember terminal sizes
lvim.builtin.terminal.persist_size = true

-- Open vertial splits bigger
lvim.builtin.terminal.size = function(term)
    if term.direction == "horizontal" then
        return 15
    elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
    else
        return 20
    end
end
-- }}}

-- keymappings {{{
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- vim.keymap.del("n", "<leader>/")

lvim.keys.normal_mode["<C-p><C-p>"] = "<cmd>lua _python_toggle()<CR>"
-- }}}

-- autocommands {{{
-- Autocommands: https://neovim.io/doc/user/autocmd.html

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "config.lua" },
    command = "set foldmethod=marker",
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.py" },
    command = "set foldmethod=expr | set foldexpr=nvim_treesitter#foldexpr()",
})

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
-- }}}

-- plugins {{{
-- Enable/disable logging in plugin config files
-- If packer is struggling, pass packer.init({ max_jobs = 10 }) in lvim
vim.g.debug_plugin_loaders = true

lvim.plugins = {
    -- Themes
    require("user.melange"),
    require("user.kanagawa"),
    require("user.tokyonight"),

    -- DAP
    require("user.nvim-dap-python"),
    require("user.nvim-dap-ui"),
    require("user.nvim-dap-virtual-text"),

    -- Git
    require("user.diffview"),
    require("user.gitlinker"),
    require("user.neogit"),
    require("user.octo"),

    -- General
    -- require("user.aerial"),
    require("user.auto-session"),
    require("user.codi"),
    require("user.editorconfig"),
    require("user.harpoon"),
    require("user.hop"),
    require("user.indent-blankline"),
    require("user.lsp-rooter"),
    require("user.marks"),
    require("user.navigator"),
    require("user.neogen"),
    require("user.neoscroll"),
    require("user.neotest"),
    require("user.nvim-bqf"),
    require("user.nvim-lastplace"),
    require("user.nvim-treesitter-textobjects"),
    require("user.refactoring"),
    require("user.ropevim"),
    require("user.sniprun"),
    require("user.splitjoin"),
    require("user.targets"),
    require("user.telescope-ui-select"),
    require("user.todo-comments"),
    require("user.toggleterm"),
    require("user.trouble"),
    require("user.vim-abolish"),
    require("user.vim-commentary"),
    require("user.vim-dispatch"),
    require("user.vim-eunuch"),
    require("user.vim-pasta"),
    require("user.vim-repeat"),
    require("user.vim-surround"),
    require("user.vim-test"),
    require("user.vim-unimpaired"),
    require("user.vim-visual-multi"),
}
-- }}}

-- for some reason this does not run
require('aerial').setup({})

require("user.dap")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.which-key")
