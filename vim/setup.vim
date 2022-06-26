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

augroup highlight_adjustments
    auto!
    " change highlight colors
    auto ColorScheme * call s:HighlightAdjustments()
augroup END

func! s:HighlightAdjustments()
    " search highlighting
    hi! link Search DiffAdd
    hi! link IncSearch Search

    " jsx tag highlighting
    hi! link jsxOpenPunct   Fg
    hi! link jsxClosePunct  Fg
    hi! link jsxCloseString Fg
endfunc

" theme
let g:onedark_terminal_italics = 2
colorscheme onedark

" enable syntax highlighting
syntax on

" change cursor depending on mode
let &t_SI = "\033[6 q"
let &t_EI = "\033[1 q"

" set update time
set updatetime=100
