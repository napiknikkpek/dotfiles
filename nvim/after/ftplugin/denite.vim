nnoremap <silent><buffer><expr> <cr> denite#do_map('do_action')
nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
nnoremap <silent><buffer><expr> q denite#do_map('quit')
nnoremap <silent><buffer><expr> <space> denite#do_map('toggle_select').'j'
nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
nnoremap <silent><buffer><expr> a denite#do_map('choose_action')
