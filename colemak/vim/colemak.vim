" =======================
" === Colemak for Vim ===
" =======================

" use colemak keymap
set keymap=colemak

" escape from insert mode
iunmap jk
inoremap we <Esc>

" sneak labels
let g:sneak#target_labels = 'tsraneiopfwqluy;TSRANEIOPFWQLUY:'
