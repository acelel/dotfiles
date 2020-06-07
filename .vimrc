call plug#begin('~/.vim/plugged')
Plug 'Mizux/vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
call plug#end()

" Colors
set background=dark
colorscheme silenthill

" Settings
set tabstop=8
set softtabstop=8
set expandtab
set backspace=indent,eol,start
syntax enable
set relativenumber
set hid
filetype indent on
filetype plugin on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set magic
set history=500
set autoread
au FocusGained,BufEnter * checktime
set so=7
set ruler
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""" Keybinds
nnoremap <Return> :noh<CR>
nnoremap <Left> :echo ""<CR>
nnoremap <Right> :echo ""<CR>
nnoremap <Up> :echo ""<CR>
nnoremap <Down> :echo ""<CR>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

"""""Plugins
" Nerdtree
nnoremap <Tab> :NERDTreeToggle<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
set laststatus=2

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
inoremap <silent><expr> <TAB>
    \ pumvisible() ?  "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
            let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~ '\s'
        endfunction "" }}}

" Javcomplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable

" Ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac']
      \ }

" Tagbar
map <C-b> :TagbarToggle<CR>
