-- Enable/disable logging in plugin config files
vim.g.debug_plugin_loaders = false

-- If packer is struggling, pass packer.init({ max_jobs = 10 }) in lvim
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
    require("user.aerial"),
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

-- Load Lunarvim core plugin configs
require("user.lvim")
require("user.dap")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.which-key")
