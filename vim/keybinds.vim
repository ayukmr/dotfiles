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

" unhighlight search
nnoremap <silent> <M-l> :nohlsearch<CR>

" move lines
nnoremap <silent> <M-j> :move . +1<CR>
nnoremap <silent> <M-k> :move . -2<CR>

" motions without copying
nnoremap <Leader>d "_d
nnoremap <Leader>D "_D

nnoremap <Leader>c "_c
nnoremap <Leader>s "_s
nnoremap <Leader>x "_x

vnoremap <Leader>d "_d
sunmap   <Leader>d

" write file
nnoremap <Leader>w :write<CR>
nnoremap <Leader>W :noauto write<CR>

" delete buffer
nnoremap <silent> <Leader>Q :bdelete<CR>

" substitutions for ; and ,
nnoremap <silent> \     :normal! ;<CR>
nnoremap <silent> <Bar> :normal! ,<CR>

" file movement
noremap <CR> G
noremap <BS> gg

" escape from insert mode
inoremap jk <Esc>

" get current syntax group
nnoremap <silent> <Leader>z :call <SID>SynStack()<CR>

func! s:SynStack()
    if !exists('*synstack')
        return
    endif

    echo join(map(synstack(
        \ line('.'), col('.')),
        \ "synIDattr(v:val, 'name')"),
    \ ', ')
endfunc
