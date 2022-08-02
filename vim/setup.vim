" =================
" === Vim Setup ===
" =================

" better vim
set nocompatible

" background color
set background=dark

" enable gui colors
if has('termguicolors')
    set termguicolors
endif

" theme
let g:onedark_terminal_italics = 2
colorscheme onedark

" enable syntax highlighting
syntax on

" search highlight
highlight! link IncSearch Search

" jsx tag highlights
highlight! link jsxOpenPunct   Fg
highlight! link jsxClosePunct  Fg
highlight! link jsxCloseString Fg

" cursor color
highlight Cursor ctermfg=235 ctermbg=145 guifg=#282c34 guibg=#abb2bf

" change cursor depending on mode
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[1 q"

" set update time
set updatetime=100
