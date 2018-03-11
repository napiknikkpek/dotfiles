
fu! s:clang_format_mappings()
  noremap <buffer> <C-f> :pyf /usr/share/clang/clang-format.py<cr>
  inoremap <buffer> <C-f> <C-o>:pyf /usr/share/clang/clang-format.py<cr>
endfu

fu! s:clang_format_all()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format.py
endfu

fu! s:yapf_format_mappings()
  noremap <buffer> <C-f> :call yapf#YAPF()<cr>
  inoremap <buffer> <C-f> <C-o>:call yapf#YAPF()<cr>
endfu

fu! s:yapf_format_all()
  let save = getpos('.') 
  :%call yapf#YAPF()
  call setpos('.', save)
endfu

augroup autoformat
  autocmd!
  " autocmd BufWritePre *.h,*.hpp,*.c,*.cc,*.cpp call s:clang_format_all()
  autocmd FileType c,cpp,js,java call s:clang_format_mappings()
  autocmd BufWritePre *.py call s:yapf_format_all()
  autocmd FileType python call s:yapf_format_mappings()
augroup END
