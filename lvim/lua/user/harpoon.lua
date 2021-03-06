function config()
    vim.api.nvim_set_keymap('n', '<C-H><C-H>', [[<Cmd>lua require('harpoon.mark').add_file()<CR>]], { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<C-H><C-J>', [[<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]], { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<C-H>1', [[<Cmd>lua require('harpoon.ui').nav_file(1)<CR>]], { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<C-H>2', [[<Cmd>lua require('harpoon.ui').nav_file(2)<CR>]], { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<C-H>3', [[<Cmd>lua require('harpoon.ui').nav_file(3)<CR>]], { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<C-H>4', [[<Cmd>lua require('harpoon.ui').nav_file(4)<CR>]], { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<C-H>5', [[<Cmd>lua require('harpoon.ui').nav_file(5)<CR>]], { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<C-H>6', [[<Cmd>lua require('harpoon.ui').nav_file(6)<CR>]], { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<C-H>7', [[<Cmd>lua require('harpoon.ui').nav_file(7)<CR>]], { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<C-H>8', [[<Cmd>lua require('harpoon.ui').nav_file(8)<CR>]], { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<C-H>9', [[<Cmd>lua require('harpoon.ui').nav_file(9)<CR>]], { noremap = true, silent = false })
end

return { "ThePrimeagen/harpoon", config = config }
