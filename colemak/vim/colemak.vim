" =======================
" === Colemak for Vim ===
" =======================

" colemak keymap
set keymap=colemak

" better escape shortcut
let g:better_escape_shortcut = 'wf'

" normal keymap in sneak
augroup sneak_keymap
  au!
  au User SneakEnter setlocal keymap=
  au User SneakLeave setlocal keymap=colemak
augroup END
