" =======================
" === Vim Keybindings ===
" =======================

" set <Leader> to comma
let mapleader = ','

" quick pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" quick buffer and tab navigation
nnoremap <silent> <Leader>[ :bprev<CR>
nnoremap <silent> <Leader>] :bnext<CR>
nnoremap <silent> <Leader>{ :tabprev<CR>
nnoremap <silent> <Leader>} :tabnext<CR>

" disable highlighting temporarily
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" move lines
nnoremap <silent> <M-j> :move . +1<CR>
nnoremap <silent> <M-k> :move . -2<CR>

" paste with proper indentation
noremap <silent> P :set paste<CR> :put *<CR> :set nopaste<CR>

" sane deleting
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
nnoremap c "_c
vnoremap d "_d

" cut text
nnoremap <Leader>d "*d
nnoremap <Leader>D "*D
nnoremap <Leader>c "*c
vnoremap <Leader>d "*d

" write file
nnoremap <Leader>w :write<CR>
nnoremap <Leader>W :noauto write<CR>

" delete buffer
nnoremap <silent> <Leader>Q :bdelete<CR>

" select changed text
noremap gV `[v`]

" file movement
noremap <CR> G
noremap <BS> gg

" escape from insert mode
inoremap jk <Esc>

" get current syntax group
nnoremap <Leader>z :call <SID>SynStack()<CR>

func! <SID>SynStack()
    if !exists('*synstack')
        return
    endif

    echo join(map(synstack(
        \ line('.'), col('.')),
        \ "synIDattr(v:val, 'name')"),
    \ ', ')
endfunc
