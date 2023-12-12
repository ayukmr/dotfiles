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

" allow italics
let g:onedark_terminal_italics = 2

" color overrides
let g:onedark_color_overrides = {
  \ 'background':     { 'gui': '#272729', 'cterm': '235', 'cterm16': 'NONE' },
  \ 'white':          { 'gui': '#b1b3b3', 'cterm': '145', 'cterm16': '15'   },
  \ 'black':          { 'gui': '#272729', 'cterm': '235', 'cterm16': '0'    },
  \ 'foreground':     { 'gui': '#b1b3b3', 'cterm': '145', 'cterm16': '15'   },
  \ 'vertsplit':      { 'gui': '#373739', 'cterm': '237', 'cterm16': '7'    },
  \ 'menu_grey':      { 'gui': '#373739', 'cterm': '237', 'cterm16': '8'    },
  \ 'comment_grey':   { 'gui': '#575759', 'cterm': '59',  'cterm16': '7'    },
  \ 'gutter_fg_grey': { 'gui': '#575759', 'cterm': '59',  'cterm16': '8'    },
  \ 'cursor_grey':    { 'gui': '#2d2d2f', 'cterm': '236', 'cterm16': '8'    },
  \ 'visual_grey':    { 'gui': '#373739', 'cterm': '237', 'cterm16': '8'    },
  \ 'special_grey':   { 'gui': '#373739', 'cterm': '238', 'cterm16': '8'    },
\}

" one dark theme
colorscheme onedark

" syntax highlighting
syntax on

" search highlight
highlight! link IncSearch Search

" jsx tag highlights
highlight! link jsxOpenPunct   Fg
highlight! link jsxClosePunct  Fg
highlight! link jsxCloseString Fg

" cursor color
highlight Cursor ctermfg=235 ctermbg=145 guifg=#272729 guibg=#b1b3b3

" change cursor depending on mode
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[1 q"

" set update time
set updatetime=100
