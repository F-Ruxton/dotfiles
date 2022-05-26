Plug 'puremourning/vimspector'

let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-python' ]

nnoremap <Leader>dL :call vimspector#Launch()<CR>
nnoremap <Leader>dR :call vimspector#Reset()<CR>
nnoremap <Leader>dC :call vimspector#Continue()<CR>
nnoremap <Leader>dR <Plug>VimspectorRestart

nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dX :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>do <Plug>VimspectorStepOut
nmap <Leader>di <Plug>VimspectorStepInto
nmap <Leader>dv <Plug>VimspectorStepOver
nmap <Leader>dg <Plug>VimspectorGoToCurrentLine
nmap <Leader>dC <Plug>VimspectorRunToCursor
