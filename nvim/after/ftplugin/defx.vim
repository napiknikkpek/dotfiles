nnoremap <silent><buffer><expr> <cr> defx#do_action('open')
nnoremap <silent><buffer><expr> c defx#do_action('copy')
nnoremap <silent><buffer><expr> m defx#do_action('move')
nnoremap <silent><buffer><expr> p defx#do_action('paste')
nnoremap <silent><buffer><expr> l defx#do_action('open')
nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
nnoremap <silent><buffer><expr> N defx#do_action('new_file')
nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
nnoremap <silent><buffer><expr> C 
  \ defx#do_action('toggle_columns', 'mark:filename:type:size:time')
nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
nnoremap <silent><buffer><expr> dd defx#do_action('remove')
nnoremap <silent><buffer><expr> r defx#do_action('rename')
nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
" nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
nnoremap <silent><buffer><expr> ~ defx#do_action('cd', )
nnoremap <silent><buffer><expr> % defx#do_action('cd', getcwd())
nnoremap <silent><buffer><expr> & defx#do_action('cd', expand('#:p:h'))
nnoremap <silent><buffer><expr> \ defx#do_action('cd', '/')
nnoremap <silent><buffer><expr> q defx#do_action('quit')
nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')

fu! s:chdir(candidate) abort
  let dir = a:candidate.is_directory 
    \ ? a:candidate.action__path
    \ : fnamemodify(a:candidate.action__path, ':p:h')
  exe 'cd '. dir
endfu
nnoremap <silent><buffer> cd :call <SID>chdir(defx#get_candidate())<cr>

fu! s:grep(file) abort
  exe 'Denite -post-action=open grep:'. a:file . '::' 
endfu
nnoremap <silent><buffer> gr 
  \ :call <SID>grep(defx#get_candidate().action__path)<cr> 

fu! s:find(candidate) abort
  let dir = a:candidate.is_directory 
    \ ? a:candidate.action__path
    \ : fnamemodify(a:candidate.action__path, ':p:h')
  exe 'Denite -mode=insert file/rec:'. dir
endfu
nnoremap <silent><buffer> gf :call <SID>find(defx#get_candidate())<cr> 
