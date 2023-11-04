" =======================
" === Colemak for Vim ===
" =======================

" colemak keymap
set keymap=colemak

" escape from insert mode
iunmap jk
inoremap we <Esc>

" normal keymap in sneak
augroup sneak_keymap
  auto!
  auto User SneakEnter setlocal keymap=
  auto User SneakLeave setlocal keymap=colemak
augroup END
