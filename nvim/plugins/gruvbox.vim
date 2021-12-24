Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
augroup GruvboxOverrides
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme gruvbox
augroup end
