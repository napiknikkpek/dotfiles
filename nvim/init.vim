if !has('nvim')
  unlet! skip_defaults_vim
  source $VIMRUNTIME/defaults.vim
endif

set runtimepath+=/opt/puppetlabs/puppet/share/vim/puppet-vimfiles

"dein Scripts-----------------------------

" Required:
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('napiknikkpek/twilight256.vim')

call dein#add('ap/vim-css-color')

call dein#add('thinca/vim-themis')
call dein#add('thinca/vim-localrc')

call dein#add('vim-jp/vital.vim')

call dein#add('Shougo/vinarise.vim')

call dein#add('ludovicchabant/vim-gutentags')

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('tsukkee/unite-tag')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
" call dein#add('sakhnik/nvim-gdb', {'build': './installer.sh'})

call dein#add('Shougo/defx.nvim')

call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-jedi')
" call dein#add('Shougo/deoplete-lsp')

call dein#add('Shougo/denite.nvim')

call dein#add('Shougo/neco-vim')

" call dein#add('w0rp/ale')

" call dein#add('neovim/nvim-lsp')

call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-entire')
call dein#add('kana/vim-textobj-fold')
call dein#add('lucapette/vim-textobj-underscore')

call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-commentary')

call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')

" call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-eunuch')
call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('ConradIrwin/vim-bracketed-paste')

call dein#add('cohama/lexima.vim')

call dein#add('Shougo/echodoc.vim')

call dein#add('neovimhaskell/haskell-vim')

call dein#add('cespare/vim-toml')

call dein#local('~/src/vim')
call dein#local('~/party/yapf/plugins', {}, ['vim'])

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

set runtimepath+=~/.config/nvim

call denite#custom#option('_', {
    \ 'prompt': '',
    \ 'mode': 'normal',
    \ 'direction': 'topleft',
    \ 'auto_resize': v:true,
    \ 'winminheight': 10,
    \ 'vertical_preview': v:true
    \ })

call denite#custom#source('_', 'matchers', ['matcher/substring'])
call denite#custom#source('_', 'sorters', ['sorter/rank'])

call denite#custom#map('insert', '<Esc>', '<denite:quit>', 'noremap')
call denite#custom#map('normal', '<Esc>', '<denite:quit>', 'noremap')

let mapleader=","

nnoremap <leader>ss :source $MYVIMRC<cr>

" set termguicolors
set background=dark
colorscheme twilight256

syntax enable

set number
set relativenumber
set ruler
set showcmd
set cmdheight=4
set matchpairs=(:),{:},[:],<:>
set incsearch
set nohlsearch
" nnoremap <C-l> :<C-u>nohlsearch<cr><C-l>

set tabstop=2
set shiftwidth=2
set expandtab

set laststatus=2
set shortmess=aTIcF
set completeopt=menuone,noinsert

set diffopt=filler,internal,algorithm:histogram,indent-heuristic

let g:gutentags_ctags_extra_args = ['--kinds-C++=+p']

let g:lexima_map_escape=''
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()

let g:deoplete#enable_at_startup = 1

let g:echodoc_enable_at_startup = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"

source ~/.config/nvim/autoformat.vim
source ~/.config/nvim/cpp.vim
source ~/.config/nvim/tabline.vim
source ~/.config/nvim/debug.vim
source ~/.config/nvim/qflist.vim

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <leader>gg :Denite -post-action=open grep<cr>
nnoremap <leader>r :Denite -no-quit -resume<cr>

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

nnoremap ; :
vnoremap ; :
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

nnoremap <leader>f :Denite unite:file file_rec<cr>
nnoremap <leader>b :Denite buffer<cr>

fu! s:open_defx()
  let @#=expand('%:p')
  if empty(filter(map(tabpagebuflist(), 
    \ 'getbufvar(v:val, "&filetype")'), 'v:val == "defx"'))
    :Defx `expand('%:p:h')` -search=`expand('%:p')`
  else
    :Defx -new `expand('%:p:h')` -search=`expand('%:p')`
  endif
endfu

nnoremap <leader>v :call <SID>open_defx()<cr>
nnoremap <leader>m :Denite file_mru<cr>
nnoremap <leader>o :Denite unite:outline<cr>

" lua require'nvim_lsp'.clangd.setup{cmd = { "clangd" }}

" fu! s:lsp_mapping()
"   nnoremap gd    <cmd>lua vim.lsp.buf.declaration()<cr>
"   " nnoremap <c-]> <cmd>lua vim.lsp.buf.definition()<cr>
"   nnoremap K     <cmd>lua vim.lsp.buf.hover()<cr>
"   " nnoremap <c-k> <cmd>lua vim.lsp.buf.signature_help()<cr>
"   nnoremap gr    <cmd>lua vim.lsp.buf.references()<cr>
" endfu()

" augroup lsp
"   autocmd!
"   autocmd FileType cpp,c call s:lsp_mapping()
" augroup END

nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k

nnoremap <C-W>h <C-W>H
nnoremap <C-W>l <C-W>L
nnoremap <C-W>j <C-W>J
nnoremap <C-W>k <C-W>K

if has('nvim')
  nnoremap <leader>t :terminal<cr>
  tnoremap <Esc> <C-\><C-N>
  tnoremap <C-o> <Esc>

  tnoremap <C-h> <C-\><C-N><C-W>h
  tnoremap <C-l> <C-\><C-N><C-W>l
  tnoremap <C-j> <C-\><C-N><C-W>j
  tnoremap <C-k> <C-\><C-N><C-W>k

  tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif

cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

vnoremap < <gv
vnoremap > >gv

" in screen quick select
nnoremap <leader>es /<C-R>='\%>' . (line("w0")-1) . 'l\%<' . (line("w$")+1) . 'l'<cr>

nnoremap <leader>ev :edit $MYVIMRC<cr>

set fileencodings=utf-8,cp1251,default,latin1

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
