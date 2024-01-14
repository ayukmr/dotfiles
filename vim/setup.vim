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
  \ 'background':     { 'gui': '#1f1f1f', 'cterm': '235', 'cterm16': 'NONE' },
  \ 'white':          { 'gui': '#a9a9a9', 'cterm': '145', 'cterm16': '15' },
  \ 'black':          { 'gui': '#1f1f1f', 'cterm': '235', 'cterm16': '0'  },
  \ 'foreground':     { 'gui': '#a9a9a9', 'cterm': '145', 'cterm16': '15' },
  \ 'vertsplit':      { 'gui': '#303030', 'cterm': '237', 'cterm16': '7'  },
  \ 'menu_grey':      { 'gui': '#303030', 'cterm': '237', 'cterm16': '8'  },
  \ 'comment_grey':   { 'gui': '#474747', 'cterm': '59',  'cterm16': '7'  },
  \ 'gutter_fg_grey': { 'gui': '#474747', 'cterm': '59',  'cterm16': '8'  },
  \ 'cursor_grey':    { 'gui': '#252525', 'cterm': '236', 'cterm16': '8'  },
  \ 'visual_grey':    { 'gui': '#303030', 'cterm': '237', 'cterm16': '8'  },
  \ 'special_grey':   { 'gui': '#303030', 'cterm': '238', 'cterm16': '8'  },
  \
  \ 'red':            { 'gui': '#d05c65', 'cterm': '204', 'cterm16': '1'  },
  \ 'dark_red':       { 'gui': '#d05c65', 'cterm': '196', 'cterm16': '9'  },
  \ 'green':          { 'gui': '#88b369', 'cterm': '114', 'cterm16': '2'  },
  \ 'yellow':         { 'gui': '#d5b06b', 'cterm': '180', 'cterm16': '3'  },
  \ 'dark_yellow':    { 'gui': '#d5b06b', 'cterm': '173', 'cterm16': '11' },
  \ 'blue':           { 'gui': '#519fdf', 'cterm': '39',  'cterm16': '4'  },
  \ 'purple':         { 'gui': '#b668cd', 'cterm': '170', 'cterm16': '5'  },
  \ 'cyan':           { 'gui': '#46a6b2', 'cterm': '38',  'cterm16': '6'  },
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
highlight Cursor ctermfg=235 ctermbg=145 guifg=#1f1f1f guibg=#a9a9a9

" change cursor depending on mode
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[1 q"

" set update time
set updatetime=100
