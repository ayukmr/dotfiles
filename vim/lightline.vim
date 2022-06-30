" =================
" === Lightline ===
" =================

" current mode
func! LightlineMode()
    if exists('b:VM_Selection') && !empty(b:VM_Selection)
        " visual multi
        return 'VMT'
    else
        " normal mode
        return lightline#mode()
    endif
endfunc

" linter errors for lightline
func! LightlineErrors()
    lua vim.g.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

    let l:errors = g:errors
    unlet g:errors

    return l:errors
endfunc

" linter warnings for lightline
func! LightlineWarnings()
    lua vim.g.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

    let l:warnings = g:warnings
    unlet g:warnings

    return l:warnings
endfunc

" add file icon to filetype
func! LightlineFiletype()
    return winwidth(0) > 70
        \ ? WebDevIconsGetFileTypeSymbol() . ' ' . (
        \     strlen(&filetype) ? &filetype : 'none'
        \ )
        \ : ''
endfunc

func! LightlineTabChars()
    let s = ''

    " return if single tab
    if len(range(tabpagenr('$'))) < 2
        return ''
    endif

    " add chars for tabs
    for i in range(tabpagenr('$'))
        let s .=
            \ i + 1 == tabpagenr() ? '*' : '='
    endfor

    return s
endfunc

" current git branch
func! LightlineGitBranch()
    return ' ' . (strlen(gitbranch#name())
        \ ? gitbranch#name()
        \ : 'none'
    \)
endfunc

" tab icons
func! LightlineTabIcons(n)
    let l:filename = lightline#tab#filename(a:n)
    return WebDevIconsGetFileTypeSymbol(l:filename)
endfunc

" lightline config
let g:lightline = {}

" colorscheme
let g:lightline.colorscheme = 'onedark'

" separators
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.tabline_subseparator = { 'left': ')', 'right': '|' }

" mode abbreviations
let g:lightline.mode_map = {
    \ 'n':      'NML',
    \ 'i':      'INS',
    \ 'R':      'RPL',
    \ 'v':      'VIS',
    \ 'V':      'VLN',
    \ "\<C-v>": 'VBL',
    \ 'c':      'CMD',
    \ 's':      'SEL',
    \ 'S':      'SLN',
    \ "\<C-s>": 'SBL',
    \ 't':      'TMN',
\}

" statusline
let g:lightline.active = {
    \ 'left': [
    \     ['mode'],
    \     ['readonly', 'filename', 'modified'],
    \     has('nvim') ? ['errors', 'warnings'] : [],
    \ ],
    \ 'right': [
    \     ['lineinfo'],
    \     ['filetype'],
    \     ['fileformat', 'fileencoding'],
    \ ],
\}

let g:lightline.inactive = {
    \ 'left': [
    \     ['filename', 'modified']
    \ ],
    \ 'right': [
    \     ['filetype']
    \ ],
\}

" functions
let g:lightline.component_function = {
    \ 'mode':      'LightlineMode',
    \ 'filetype':  'LightlineFiletype',
    \ 'tabchars':  'LightlineTabChars',
    \ 'gitbranch': 'LightlineGitBranch',
\}

" color linter error and warning symbols
hi LightlineErrors   ctermfg=204 ctermbg=236 guifg=#e06c75 guibg=#2c323c
hi LightlineWarnings ctermfg=180 ctermbg=236 guifg=#e5c07b guibg=#2c323c

" bufferline component
let g:lightline.component_expand = {
    \ 'buffers': 'lightline#bufferline#buffers',
\}

" bufferline component type
let g:lightline.component_type = {
    \ 'buffers': 'tabsel',
\}

" components
let g:lightline.component = {
    \ 'logo':     '',
    \ 'errors':   '%#LightlineErrors#%#LightlineLeft_active_2# %{LightlineErrors()}',
    \ 'warnings': '%#LightlineWarnings#%#LightlineLeft_active_2# %{LightlineWarnings()}',
    \ 'lineinfo': '%2l:%-2c',
\}

" tabline
let g:lightline.tabline = {
    \ 'left': [
    \     ['logo', 'buffers'],
    \ ],
    \ 'right': [
    \     ['tabchars', 'gitbranch'],
    \ ],
\}

" icons in tab numbers
let g:lightline.tab_component_function = {
    \ 'tabnum': 'LightlineTabIcons',
\}

" refresh with timer
call timer_start(&updatetime, {-> lightline#update() }, { 'repeat': -1 })

" ============================
" === Lightline Bufferline ===
" ============================

" enable icons in bufferline tabs
let g:lightline#bufferline#enable_devicons = 1

" set title for unnamed buffers
let g:lightline#bufferline#unnamed = '[No Name]'

" ================
" === One Dark ===
" ================

let s:colors = onedark#GetColors()

if get(g:, 'onedark_termcolors', 256) == 16
    let s:term_red         = s:colors.red.cterm16
    let s:term_green       = s:colors.green.cterm16
    let s:term_yellow      = s:colors.yellow.cterm16
    let s:term_blue        = s:colors.blue.cterm16
    let s:term_purple      = s:colors.purple.cterm16
    let s:term_white       = s:colors.white.cterm16
    let s:term_cursor_grey = s:colors.cursor_grey.cterm16
    let s:term_visual_grey = s:colors.visual_grey.cterm16
else
    let s:term_red         = s:colors.red.cterm
    let s:term_green       = s:colors.green.cterm
    let s:term_yellow      = s:colors.yellow.cterm
    let s:term_blue        = s:colors.blue.cterm
    let s:term_purple      = s:colors.purple.cterm
    let s:term_white       = s:colors.white.cterm
    let s:term_cursor_grey = s:colors.cursor_grey.cterm
    let s:term_visual_grey = s:colors.visual_grey.cterm
endif

let s:red         = [ s:colors.red.gui,         s:term_red         ]
let s:green       = [ s:colors.green.gui,       s:term_green       ]
let s:yellow      = [ s:colors.yellow.gui,      s:term_yellow      ]
let s:blue        = [ s:colors.blue.gui,        s:term_blue        ]
let s:purple      = [ s:colors.purple.gui,      s:term_purple      ]
let s:white       = [ s:colors.white.gui,       s:term_white       ]
let s:cursor_grey = [ s:colors.cursor_grey.gui, s:term_cursor_grey ]
let s:visual_grey = [ s:colors.visual_grey.gui, s:term_visual_grey ]

let s:palette = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

let s:palette.normal.left     = [[ s:cursor_grey, s:green ], [ s:white, s:visual_grey ]]
let s:palette.normal.right    = [[ s:cursor_grey, s:green ], [ s:white, s:visual_grey ]]

let s:palette.inactive.left   = [[ s:cursor_grey, s:white ], [ s:cursor_grey, s:white ]]
let s:palette.inactive.right  = [[ s:cursor_grey, s:white ], [ s:cursor_grey, s:white ]]

let s:palette.insert.left     = [[ s:cursor_grey, s:blue ], [ s:white, s:visual_grey ]]
let s:palette.insert.right    = [[ s:cursor_grey, s:blue ], [ s:white, s:visual_grey ]]

let s:palette.replace.left    = [[ s:cursor_grey, s:red ], [ s:white, s:visual_grey ]]
let s:palette.replace.right   = [[ s:cursor_grey, s:red ], [ s:white, s:visual_grey ]]

let s:palette.visual.left     = [[ s:cursor_grey, s:yellow ], [ s:white, s:visual_grey ]]
let s:palette.visual.right    = [[ s:cursor_grey, s:yellow ], [ s:white, s:visual_grey ]]

let s:palette.normal.middle   = [[ s:white, s:cursor_grey ]]
let s:palette.inactive.middle = [[ s:white, s:cursor_grey ]]

let s:palette.tabline.left    = [[ s:white, s:visual_grey  ]]
let s:palette.tabline.tabsel  = [[ s:cursor_grey, s:purple ]]
let s:palette.tabline.middle  = [[ s:white, s:cursor_grey  ]]
let s:palette.tabline.right   = [[ s:purple, s:visual_grey ]]

let s:palette.normal.warning  = [[ s:cursor_grey, s:yellow ]]
let s:palette.normal.error    = [[ s:cursor_grey, s:red    ]]

let g:lightline#colorscheme#onedark#palette = lightline#colorscheme#flatten(s:palette)
