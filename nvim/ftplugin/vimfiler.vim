
nnoremap <buffer> & :call vimfiler#mappings#cd(getcwd())<cr>
nnoremap <buffer> % :call vimfiler#mappings#cd(expand('#:p:h'))<cr>
