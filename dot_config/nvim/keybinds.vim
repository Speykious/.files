" The Holy Leader Key
let mapleader=' '

" The Sauce and the Sauce Tree
nnoremap <leader>i :source ~/.config/nvim/init.vim<CR>
map <leader>$ :set termguicolors!<CR>

" Barbar Buffer things
nnoremap ² :call v:lua.tree_toggle()<CR>
vnoremap ² :call v:lua.tree_toggle()<CR>
nnoremap <leader>q :BufferClose<CR>
vnoremap <leader>q :BufferClose<CR>

" Cool editor maps
nnoremap <M-Up> :m .-2<CR>
nnoremap <M-Down> :m .+1<CR>
nmap <leader>y "+y
nmap <leader>d "+d
nmap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>d "+d
vnoremap <leader>p "+p

" Insert mode boosting
inoremap <M-BS> <C-w>
inoremap <C-DEL> <C-o>dw
inoremap <M-DEL> <C-o>dw
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <C-Space> <Plug>(completion_trigger)

" Split screen remaps
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>H <C-W><S-H>
nnoremap <leader>J <C-W><S-J>
nnoremap <leader>K <C-W><S-K>
nnoremap <leader>L <C-W><S-L>
nnoremap <leader>< <C-W><
nnoremap <leader>> <C-W>>

nnoremap <silent> <A-h> <C-w>H<CR>
nnoremap <silent> <A-j> <C-w>J<CR>
nnoremap <silent> <A-k> <C-w>K<CR>
nnoremap <silent> <A-l> <C-w>L<CR>
nnoremap <C-h> :BufferPrevious<CR>
nnoremap <C-l> :BufferNext<CR>

" Searching
" nnoremap / /\v
" vnoremap / /\v
nnoremap <leader>, :nohl<CR>
vnoremap <leader>, :nohl<CR>

" Signify and Fugitive maps
nnoremap <leader>gj <plug>(signify-next-hunk)
nnoremap <leader>gk <plug>(signify-prev-hunk)
nnoremap ;gd :Gvdiffsplit<CR>
