lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "json",
    "lua",
    "python",
    "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true


local user_opts = {
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ib"] = "@block.inner",
                ["ab"] = "@block.outer",
                ["iC"] = "@call.inner",
                ["aC"] = "@call.outer",
                ["ii"] = "@conditional.inner",
                ["ai"] = "@conditional.outer",
                ["il"] = "@loop.inner",
                ["al"] = "@loop.outer",
                ["ip"] = "@parameter.inner",
                ["ap"] = "@parameter.outer",
                ["is"] = "@scopename.inner",
                ["as"] = "@statement.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                -- ["]m"] = "@function.outer",
                ["]fa"] = "@function.outer",
                ["]]"] = "@class.outer",
                ["]b"] = "@block.outer",
                ["]C"] = "@call.outer",
                ["]i"] = "@conditional.outer",
                ["]l"] = "@loop.outer",
                ["]p"] = "@parameter.inner",
                ["]p"] = "@parameter.outer",
                ["]s"] = "@statement.outer",
                ["]b"] = "@block.inner",
                ["]C"] = "@call.inner",
                ["]i"] = "@conditional.inner",
                ["]l"] = "@loop.inner",
                ["]s"] = "@scopename.inner",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
                ["]b"] = "@block.outer",
                ["]C"] = "@call.outer",
                ["]i"] = "@conditional.outer",
                ["]l"] = "@loop.outer",
                ["]p"] = "@parameter.inner",
                ["]p"] = "@parameter.outer",
                ["]s"] = "@statement.outer",
                ["]b"] = "@block.inner",
                ["]C"] = "@call.inner",
                ["]i"] = "@conditional.inner",
                ["]l"] = "@loop.inner",
                ["]s"] = "@scopename.inner",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
                ["[b"] = "@block.outer",
                ["[C"] = "@call.outer",
                ["[i"] = "@conditional.outer",
                ["[l"] = "@loop.outer",
                ["[p"] = "@parameter.inner",
                ["[p"] = "@parameter.outer",
                ["[s"] = "@statement.outer",
                ["[b"] = "@block.inner",
                ["[C"] = "@call.inner",
                ["[i"] = "@conditional.inner",
                ["[l"] = "@loop.inner",
                ["[s"] = "@scopename.inner",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
                ["[b"] = "@block.outer",
                ["[C"] = "@call.outer",
                ["[i"] = "@conditional.outer",
                ["[l"] = "@loop.outer",
                ["[p"] = "@parameter.inner",
                ["[p"] = "@parameter.outer",
                ["[s"] = "@statement.outer",
                ["[b"] = "@block.inner",
                ["[C"] = "@call.inner",
                ["[i"] = "@conditional.inner",
                ["[l"] = "@loop.inner",
                ["[s"] = "@scopename.inner",
            },
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ["<leader>Tf"] = "@function.outer",
                ["<leader>TF"] = "@class.outer",
            },
        },
    },
}

local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    Log:error "Failed to load nvim-treesitter.configs"
    return
end

local base_opts = vim.deepcopy(lvim.builtin.treesitter)

lvim.builtin.treesitter = vim.tbl_deep_extend(
    "force",
    base_opts,
    user_opts
)
