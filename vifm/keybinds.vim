" =====================
" === Vifm Keybinds ===
" =====================

" set <Leader> to comma
let mapleader = ','

" open shell
nnoremap s :shell<CR>

" sort files
nnoremap S :sort<CR>

" view files
nnoremap w :view<CR>
vnoremap w :view<CR>gv

" open current file
nnoremap gb :!open -g %f<CR>

" copy current file
nnoremap yd :!printf %d   | pbcopy<CR>
nnoremap yf :!printf %c:p | pbcopy<CR>

" quicklook tool
nnoremap <Space> :!qlmanage -p %f &> /dev/null<CR>

" change words
nnoremap I  cw<C-a>
nnoremap cc cw<C-u>
nnoremap A  cw

" toggle wrapping
nnoremap <Leader>w :set wrap!<CR>

" quick pane navigation
nnoremap <C-h> <C-w>h
nnoremap <BS>  <C-w>h
nnoremap <C-l> <C-w>l
