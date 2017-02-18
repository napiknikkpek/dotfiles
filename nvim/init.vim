if !has('nvim')
  unlet! skip_defaults_vim
  source $VIMRUNTIME/defaults.vim
endif
    
"dein Scripts-----------------------------

" Required:
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim


" Required:
call dein#begin(expand('~/.config/nvim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('vim-scripts/twilight256.vim')

call dein#add('thinca/vim-themis')

call dein#add('vim-jp/vital.vim')

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite-help')
call dein#add('Shougo/vimproc.vim')
call dein#add('Shougo/deoplete.nvim')

call dein#add('Shougo/neco-vim')

call dein#add('Shougo/unite-outline')
call dein#add('tsukkee/unite-tag')

call dein#add('zchee/deoplete-clang')

call dein#add('arakashic/chromatica.nvim')

call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-commentary')

call dein#add('Shougo/vimfiler.vim')

call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')

" call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-eunuch')
call dein#add('AndrewRadev/splitjoin.vim')

call dein#add('cohama/lexima.vim')

call dein#add('Shougo/echodoc.vim')

call dein#add('zchee/deoplete-jedi')

call dein#local('~/src/vim')

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

let g:vimfiler_as_default_explorer = 1

let set_compile_commands = {}
fu! set_compile_commands.func(candidate)
  call project#set(a:candidate.action__path)
endfu
call unite#custom#action('file', 'set_compile_commands', set_compile_commands)
unlet set_compile_commands

augroup map-source-custom
  autocmd!
  autocmd FileType vim nnoremap <buffer> <leader>ss :w<cr>:source %<cr>
  autocmd FileType c,cpp 
        \nnoremap <buffer> <leader>ss :w<cr>:call project#update()<cr>
augroup END

set background=dark
colorscheme twilight256

syntax enable

set number
set relativenumber
set ruler
set showcmd
set cmdheight=5
set matchpairs=(:),{:},[:],<:>
set incsearch
set nohlsearch

set tabstop=2
set shiftwidth=2
set expandtab

set shortmess=aTIcF
set completeopt=menuone,noinsert

let mapleader=","
let maplocalleader="-"

let g:lexima_map_escape=''
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/local/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/local/lib/clang'

let g:chromatica#libclang_path='/usr/local/lib/libclang.so'
let g:chromatica#enable_at_startup = 1

let g:echodoc_enable_at_startup = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

source './autoformat.vim'
source './cpp.vim'

nnoremap <leader>f :Unite file file_rec<cr>
nnoremap <leader>b :Unite buffer<cr>
nnoremap <leader>l :Unite -start-insert line<cr>
nnoremap <leader>v :VimFiler<cr>
nnoremap <leader>ex :exe 'VimFiler -toggle -explorer '.getcwd()<cr>
nnoremap <leader>m :Unite neomru/file<cr>
nnoremap <leader>o :Unite outline<cr>

nnoremap <C-N> :cn<cr>
nnoremap <C-P> :cp<cr>

nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k

if has('nvim')
  nnoremap <leader>t :terminal<cr>
  tnoremap <Esc> <C-\><C-N>
  tnoremap <C-h> <C-\><C-N><C-W>h
  tnoremap <C-l> <C-\><C-N><C-W>l
  tnoremap <C-j> <C-\><C-N><C-W>j
  tnoremap <C-k> <C-\><C-N><C-W>k
endif

" in screen quick select
nnoremap ; /<C-R>='\%>' . (line("w0")-1) . 'l\%<' . (line("w$")+1) . 'l'<cr>

nnoremap <leader>ev :edit $MYVIMRC<cr>
