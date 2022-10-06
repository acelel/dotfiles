" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

call plug#begin()
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

"" Lua script extender
Plug 'nvim-lua/plenary.nvim'

"" Language and Syntax
" Language server / Linter
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Linter
"" Plug 'dense-analysis/ale'



"" Utilities
" File tree
Plug 'kyazdani42/nvim-tree.lua'
" Command hints
Plug 'folke/which-key.nvim' 
" Git
Plug 'tpope/vim-fugitive'
" Org mode
Plug 'jceb/vim-orgmode'
" Auto identify root directory of project
Plug 'airblade/vim-rooter'
" Floating terminal (F4)
Plug 'voldikss/vim-floaterm'
" Auto close brackets
"Plug 'vim-scripts/AutoClose'
" Auto close html tags
Plug 'alvan/vim-closetag'
" Fuzzy finder
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" Toggle comments
Plug 'terrortylor/nvim-comment'
" Highlight characters to jump to
Plug 'unblevable/quick-scope'
" Hop
Plug 'phaazon/hop.nvim'


"" Visual
" Top bar
Plug 'romgrk/barbar.nvim'
" status line
Plug 'nvim-lualine/lualine.nvim'


"" Theming
Plug 'kyazdani42/nvim-web-devicons'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'catppuccin/nvim', {'as': 'catppuccin'}


call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "
runtime macros/matchit.vim


"" Lua
lua << EOF
require('nvimtreeconfig')
require('nvim_comment').setup()
require('hop').setup()
require('treesitterconfig')
require('cappuccin')
require('lualineconfig')
require('keybinds')
EOF
"
""Visual settings "
set termguicolors
set guifont=Iosevka\ Term:h16
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set conceallevel=0
let g:vim_json_syntax_conceal = 0
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
set statusline^=%{coc#status()}
let g:html_indent_script1 = "auto" 
let g:html_indent_style1 = "auto"

" Vim settings "
set timeoutlen=300
set ttyfast
set nocompatible
set autoindent
set smartindent
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
set nobackup
set noswapfile
set autowrite
"set lazyredraw
set autoread
set signcolumn=number
set updatetime=300
set showcmd
set cmdheight=1
filetype on
filetype plugin on
filetype indent on
set mouse=a
set cursorline
set cursorcolumn
set number relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set ignorecase
set smartcase
set hlsearch
set foldmethod=indent
set nofoldenable

" Autocomplete stuff
let g:coc_global_extensions = [
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-html-css-support',
      \ 'coc-rust-analyzer',
      \ 'coc-prettier'
      \ ]

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <F2> <Plug>(coc-rename)
nmap <c-space> <Plug>(coc-codeaction)
nmap <F1> <Plug>(coc-diagnostic-next) 
nmap <c-F1> <Plug>(coc-diagnostic-prev) 

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" " <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <c-LeftMouse> <Plug>(coc-definition)

function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction


" General keybinds "
nmap <c-x> :NvimTreeToggle<cr>
nnoremap <c-s> :w<cr>
nnoremap gb <C-o>
vnoremap <c-c> "+y
nmap <F4> :FloatermToggle<cr>
nmap ct :CommentToggle<cr>
vmap ct :CommentToggle<cr>gv

" neovide settings "
function Neovide_fullscreen()
  if g:neovide_fullscreen == v:true
    let g:neovide_fullscreen=v:false
  else
    let g:neovide_fullscreen=v:true
  endif
endfunction
map <F11> :call Neovide_fullscreen()<cr>
let g:neovide_cursor_antialiasing = v:true
let g:neovide_cursor_animation_length = 0.05
let g:neovide_cursor_trail = 0.1
let g:neovide_transparency = 1.0
let g:neovide_refresh_rate = 60
nnoremap <c-b>s :! sass '%:p' \| xclip -sel clip<cr>
"
""Splits
set splitbelow
set splitright
nnoremap <C-down> <C-W><C-J>
nnoremap <C-up> <C-W><C-K>
nnoremap <C-right> <C-W><C-L>
nnoremap <C-left> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Auto identify root directory
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh', 'src']

