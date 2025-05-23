" ========================
" === Vim Color Scheme ===
" ========================

" only run in vim
if has('nvim')
  finish
endif

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

" set highlights
func! s:set_highlights() abort
  " search highlight
  highlight Search    ctermfg=235 ctermbg=180 guifg=#1f1f1f guibg=#d5b06b
  highlight CurSearch cterm=bold ctermfg=235 ctermbg=180 gui=bold guifg=#1f1f1f guibg=#d5b06b
  highlight! link IncSearch CurSearch

  " menu selections
  highlight PmenuSel cterm=bold ctermfg=236 ctermbg=39 gui=bold guifg=#252525 guibg=#519fdf
  highlight! link WildMenu PmenuSel

  " remove background
  highlight clear Normal

  " cursor color
  highlight Cursor ctermfg=235 ctermbg=145 guifg=#1f1f1f guibg=#a9a9a9

  " lightline linter symbols
  highlight LightlineError ctermfg=204 ctermbg=236 guifg=#d05c65 guibg=#252525
  highlight LightlineWarn  ctermfg=180 ctermbg=236 guifg=#d5b06b guibg=#252525
  highlight LightlineInfo  ctermfg=39  ctermbg=236 guifg=#519fdf guibg=#252525

  " sneak colors
  highlight Sneak        ctermfg=236 ctermbg=39 guifg=#252525 guibg=#519fdf
  highlight SneakCurrent cterm=bold ctermfg=236 ctermbg=39 gui=bold guifg=#252525 guibg=#519fdf
  highlight SneakLabel   ctermfg=236 ctermbg=39 guifg=#252525 guibg=#519fdf
  highlight! link SneakScope CursorLine

  " yank color
  highlight! link HighlightedyankRegion Search

  " cursor line number
  highlight! link CursorLineNr CursorLine

  " jsx tag highlights
  highlight! link jsxOpenPunct   Fg
  highlight! link jsxClosePunct  Fg
  highlight! link jsxCloseString Fg

  " crystal strings
  highlight! link crystalStringDelimiter String
endfunc

" set highlights on theme change
augroup set_highlights
  au!
  au ColorScheme onedark call s:set_highlights()
augroup END

" initialize highlights
call s:set_highlights()
