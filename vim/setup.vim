" =================
" === Vim Setup ===
" =================

" better vim
set nocompatible

" background color
set background=dark

" syntax highlighting
syntax on

" disable line numbers in quickfix buffer
augroup quickfix_no_numbers
  auto!
  auto FileType qf setlocal nonumber norelativenumber foldcolumn=1
augroup END

" change cursor depending on mode
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[1 q"

" update time
set updatetime=100
