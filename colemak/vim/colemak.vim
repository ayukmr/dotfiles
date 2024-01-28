" =======================
" === Colemak for Vim ===
" =======================

" colemak keymap
set keymap=colemak

" better escape shortcut
let g:better_escape_shortcut = 'wf'

" normal keymap in sneak
augroup sneak_keymap
  auto!
  auto User SneakEnter setlocal keymap=
  auto User SneakLeave setlocal keymap=colemak
augroup END
