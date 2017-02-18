
let g:clang_format_prog = '/usr/local/share/clang/clang-format.py'

fu! s:clang_format_mappings()
  noremap <buffer> <C-g> :exe 'pyf '.g:clang_format_prog<cr>
  inoremap <buffer> <C-g> <Esc>:<C-u>exe 'pyf '.g:clang_format_prog<cr>a
endfu

fu! s:clang_format_all()
  let l:lines = 'all'
  exe 'pyf '.g:clang_format_prog
endfu

fu! s:yapf_format_mappings()
  nnoremap <C-g> :call yapf#YAPF()<cr>
  inoremap <C-g> <C-o>:call yapf#YAPF()<cr>
endfu

augroup autoformat
  autocmd!
  autocmd BufWritePre *.h,*.hpp,*.c,*.cpp call s:clang_format_all()
  autocmd FileType c,cpp,js,java call s:clang_format_mappings()
  autocmd FileType python call s:yapf_format_mappings()
augroup END
