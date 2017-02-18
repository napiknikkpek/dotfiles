
fu! s:gen_include_guard()
  if line('$') != 1 || col('$') != 1
    return
  endif
  let uuid = system('uuidgen')
  let uuid = '_'.substitute(toupper(uuid.expand('%:e')), '[\n-]', '_', 'g')
  exe "normal! i".printf("#ifndef %s\n#define %s\n\n#endif", uuid, uuid)."\<Esc>" 
  normal! 3G
endfu

augroup generate-include-guard
  autocmd!
  autocmd BufNewFile,BufRead *.h,*.hpp call s:gen_include_guard()
augroup END
