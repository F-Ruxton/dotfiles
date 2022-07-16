vim.g.debug_plugin_loaders = true

-- Load plugins list and config for lvim and nvim
require("user.plugins")
require("user.lvim")
require("user.options")

-- Load plugin configs
require("user.auto-session")
require("user.commands")
require("user.dap")
require("user.gh")
require("user.gitlinker")
require("user.harpoon")
require("user.hop")
require("user.indent-blankline")
require("user.lsp")
require("user.marks")
require("user.neogen")
require("user.neoscroll")
require("user.neotest")
require("user.nvim-bqf")
require("user.nvim-lastplace")
require("user.telescope")
require("user.treesitter")
require("user.vim-surround")
require("user.which_key")
-- require("user.octo")
-- require("user.persistence")
