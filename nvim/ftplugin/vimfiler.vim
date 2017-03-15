
nnoremap <buffer> & :call vimfiler#mappings#cd(getcwd())<cr>
nnoremap <buffer> % :call vimfiler#mappings#cd(expand('#:p:h'))<cr>
nnoremap <buffer> <C-h> <C-W>h
nnoremap <buffer> <C-l> <C-W>l
nnoremap <buffer> <C-j> <C-W>j
nnoremap <buffer> <C-k> <C-W>k
nmap <buffer> gh <Plug>(vimfiler_switch_to_history_directory)
