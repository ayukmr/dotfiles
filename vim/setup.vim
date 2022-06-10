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

hi! link Search DiffAdd
hi! link IncSearch Search

" jsx tag highlighting
hi! link jsxOpenPunct   Fg
hi! link jsxClosePunct  Fg
hi! link jsxCloseString Fg

" enable syntax highlighting
syntax on

" change cursor depending on mode
let &t_SI = "\033[6 q"
let &t_EI = "\033[1 q"

" set update time
set updatetime=100

" refresh statusline with timer
call timer_start(&updatetime, {-> execute(':let &stl=&stl') }, { 'repeat': -1 })
