
" TODO when neovim will merge 'filewinid' option
" find loclist_id by winid
fu! s:loclist_id(tabnr) abort
  for info in getwininfo()
    if info.loclist && info.tabnr == a:tabnr
      return info.winid
    endif
  endfor
  return 0
endfu

fu! s:toggle_loclist() abort
  if s:loclist_id(tabpagenr())
    lclose
  else
    if empty(getloclist(0))
      call setloclist(0, [], 'r')
    endif
    lopen
  endif
endfu

fu! s:qflist_id(tabnr) abort
  for info in getwininfo()
    if info.quickfix && info.tabnr == a:tabnr
      return info.winid 
    endif
  endfor
  return 0
endfu

fu! s:toggle_qflist() abort
  if s:qflist_id(tabpagenr())
    cclose
  else
    copen
  endif
endfu

nnoremap <leader>c :<C-u>call <SID>toggle_qflist()<cr>
nnoremap <leader>l :<C-u>call <SID>toggle_loclist()<cr>

nnoremap <expr> <C-c> <SID>qflist_id(tabpagenr()) ? ":cc<cr>" : ":ll<cr>"
nnoremap <expr> <C-n> <SID>qflist_id(tabpagenr()) ? ":cn<cr>" : ":lnext<cr>"
nnoremap <expr> <C-p> <SID>qflist_id(tabpagenr()) ? ":cp<cr>" : ":lp<cr>"

