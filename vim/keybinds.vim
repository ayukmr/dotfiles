" ====================
" === Vim Keybinds ===
" ====================

" comma as leader
let mapleader = ','

" quick pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" select edited
noremap gV `[v`]

" yank to end of line
map Y y$

" unhighlight search
nnoremap <silent> <C-n> :nohlsearch<CR>

" write file
nnoremap <Leader>w :write<CR>
nnoremap <Leader>W :noauto write<CR>

" motions without copying
nnoremap <Leader>d "_d
xnoremap <Leader>d "_d

nnoremap <Leader>D "_D
xnoremap <Leader>D "_D

nnoremap <Leader>c "_c
xnoremap <Leader>c "_c

nnoremap <Leader>C "_C
xnoremap <Leader>C "_C

nnoremap <Leader>x "_x
xnoremap <Leader>x "_x

nnoremap <Leader>X "_X
xnoremap <Leader>X "_X
