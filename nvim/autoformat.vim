
fu! s:clang_format_mappings()
  noremap <buffer> <C-f> :pyf ~/party/llvm/tools/clang/tools/clang-format/clang-format.py<cr>
  inoremap <buffer> <C-f> <C-o>:pyf ~/party/llvm/tools/clang/tools/clang-format/clang-format.py<cr>
endfu

fu! s:clang_format_all()
  let l:formatdiff = 1
  pyf ~/party/llvm/tools/clang/tools/clang-format/clang-format.py
endfu

fu! s:yapf_format_mappings()
  nnoremap <C-f> :call yapf#YAPF()<cr>
  inoremap <C-f> <C-o>:call yapf#YAPF()<cr>
endfu

augroup autoformat
  autocmd!
  autocmd BufWritePre *.h,*.hpp,*.c,*.cc,*.cpp call s:clang_format_all()
  autocmd FileType c,cpp,js,java call s:clang_format_mappings()
  autocmd FileType python call s:yapf_format_mappings()
augroup END
