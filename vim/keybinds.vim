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
nnoremap <silent> <C-n> :nohlsearch <Bar> diffupdate<CR>

" write file
nnoremap <Leader>w :write<CR>
nnoremap <Leader>W :noauto write<CR>

" ==========================
" === Execute Last Macro ===
" ==========================

if !has('nvim')
  " record macro
  func! s:record_macro() abort
    let l:register = nr2char(getchar())

    " validate register
    if l:register =~ '[0-9a-zA-Z"]'
      let s:last_macro = l:register
      execute 'normal! q' . s:last_macro
    endif
  endfunc

  " execute last macro
  func! s:last_macro() abort
    if exists('s:last_macro')
      execute 'normal! @' . s:last_macro
    endif
  endfunc

  " record macro
  noremap <silent> <expr> q
    \ empty(reg_recording()) ? ':call <SID>record_macro()<CR>' : 'q'

  " execute last macro
  nnoremap <silent> Q :call <SID>last_macro()<CR>
endif

" ==========================
" === Black Hole Motions ===
" ==========================

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
