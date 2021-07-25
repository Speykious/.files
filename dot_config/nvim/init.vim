if &compatible
	set nocompatible
endif

set shell=bash
set modelines=0
set conceallevel=0
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set softtabstop=0
set scrolloff=5
set matchpairs+=<:>
set number relativenumber ruler hidden noshowmode visualbell
set wrap linebreak expandtab incsearch ignorecase smartcase showmatch
set completeopt=menuone,noinsert,noselect
set background=dark
" set termguicolors " The Revolution theme looks way better with my theme without termguicolors
set mouse=a
syntax on

luafile ~/.config/nvim/plugins.lua
source ~/.config/nvim/keybinds.vim
au BufNewFile,BufRead *.duml set ft=yaml

" Netrw NERDTree-like settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

" Signify config
set updatetime=100
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

colorscheme Revolution " Bonjour

" Nvim-LSP diagnostic colors
hi LspDiagnosticsDefaultHint        ctermfg=Magenta guifg=#cc32cc
hi LspDiagnosticsDefaultError       ctermfg=Red     guifg=#cc1624
hi LspDiagnosticsDefaultWarning     ctermfg=Yellow  guifg=#cc991b
hi LspDiagnosticsDefaultInformation ctermfg=Blue    guifg=#0c74ce

" NO! FUCKING! BACKGROUND! AMIRITE
hi Normal ctermbg=NONE guibg=NONE
