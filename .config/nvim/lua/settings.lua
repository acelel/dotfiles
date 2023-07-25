vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.guifont = "ComicMono Nerd Font:h13"
vim.opt.lsp = 2
-- vim.opt.guioptions -= m
-- vim.opt.guioptions -= T
-- vim.opt.guioptions -= r
-- vim.opt.guioptions -= L
vim.opt.conceallevel = 0
-- vim.opt.statusline ^= %{coc#status()}
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.vim_json_syntax_conceal = 0
vim.g.indentLine_showFirstIndentLevel = 1
vim.g.indentLine_setColors = 0
vim.g.html_indent_script1 = "auto" 
vim.g.html_indent_style1 = "auto"
vim.g.rooter_patterns = {'.git', 'Makefile', '*.sln', 'build/env.sh', 'src'}

vim.opt.timeoutlen=300
vim.opt.ttyfast = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showmatch = true
-- vim.opt.comments="sl:/*,mb:\ *,elx:\ */"
vim.opt.backup = false
vim.opt.swapfile = false 
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.signcolumn="number"
vim.opt.updatetime=300
vim.opt.showcmd = true
vim.opt.cmdheight=1
vim.opt.mouse=a
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true
local indent = 2
vim.opt.tabstop=indent
vim.opt.shiftwidth=indent
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.foldmethod="indent"
vim.opt.foldenable = false

vim.cmd[[
filetype on
filetype plugin on
filetype indent on
]]
