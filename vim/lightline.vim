" =================
" === Lightline ===
" =================

" linter errors count for lightline
func! LightlineErrors()
  return luaeval('#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })')
endfunc

" linter warnings count for lightline
func! LightlineWarnings()
  return luaeval('#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })')
endfunc

" linter info count for lightline
func! LightlineInfo()
  return luaeval('#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })')
endfunc

" add file icon to filetype
func! LightlineFiletype()
  return winwidth(0) > 70
    \ ? WebDevIconsGetFileTypeSymbol() . ' ' . (
    \   strlen(&filetype) ? &filetype : 'none'
    \ )
    \ : ''
endfunc

" amount of tabs
func! LightlineTabNum()
  return ' ' . tabpagenr()
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

" active statusline
let g:lightline.active = {
  \ 'left': [
  \   ['mode'],
  \   ['readonly', 'filename', 'modified'],
  \   has('nvim') ? ['errors', 'warnings', 'info'] : [],
  \ ],
  \ 'right': [
  \   ['lineinfo'],
  \   ['filetype'],
  \   ['fileformat', 'fileencoding'],
  \ ],
\}

" inactive statusline
let g:lightline.inactive = {
  \ 'left': [
  \   ['filename', 'modified']
  \ ],
  \ 'right': [
  \   ['filetype']
  \ ],
\}

" tabline
let g:lightline.tabline = {
  \ 'left': [
  \   ['logo', 'buffers'],
  \ ],
  \ 'right': [
  \   ['tabnum']
  \ ]
\}

" components
let g:lightline.component = {
  \ 'logo':     '',
  \ 'lineinfo': '%02l:%02c',
  \
  \ 'errors':   '%#DiagnosticError#%#LightlineLeft_active_2# %{LightlineErrors()}',
  \ 'warnings': '%#DiagnosticWarn#%#LightlineLeft_active_2# %{LightlineWarnings()}',
  \ 'info':     '%#DiagnosticInfo#%#LightlineLeft_active_2# %{LightlineInfo()}',
\}

" functions
let g:lightline.component_function = {
  \ 'filetype': 'LightlineFiletype',
  \ 'tabnum':   'LightlineTabNum',
\}

" bufferline component
let g:lightline.component_expand = {
  \ 'buffers': 'lightline#bufferline#buffers',
\}

" bufferline component type
let g:lightline.component_type = {
  \ 'buffers': 'tabsel',
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

let s:term_red         = s:colors.red.cterm
let s:term_green       = s:colors.green.cterm
let s:term_yellow      = s:colors.yellow.cterm
let s:term_blue        = s:colors.blue.cterm
let s:term_purple      = s:colors.purple.cterm
let s:term_white       = s:colors.white.cterm
let s:term_cursor_grey = s:colors.cursor_grey.cterm
let s:term_visual_grey = s:colors.visual_grey.cterm

let s:red         = [s:colors.red.gui,         s:term_red]
let s:green       = [s:colors.green.gui,       s:term_green]
let s:yellow      = [s:colors.yellow.gui,      s:term_yellow]
let s:blue        = [s:colors.blue.gui,        s:term_blue]
let s:purple      = [s:colors.purple.gui,      s:term_purple]
let s:white       = [s:colors.white.gui,       s:term_white]
let s:cursor_grey = [s:colors.cursor_grey.gui, s:term_cursor_grey]
let s:visual_grey = [s:colors.visual_grey.gui, s:term_visual_grey]

let s:palette = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

let s:palette.normal.left  = [[s:cursor_grey, s:green, 'bold'], [s:white, s:visual_grey]]
let s:palette.normal.right = [[s:cursor_grey, s:green, 'bold'], [s:white, s:visual_grey]]

let s:palette.inactive.left  = [[s:cursor_grey, s:white], [s:cursor_grey, s:white]]
let s:palette.inactive.right = [[s:cursor_grey, s:white], [s:cursor_grey, s:white]]

let s:palette.insert.left  = [[s:cursor_grey, s:blue, 'bold'], [s:white, s:visual_grey]]
let s:palette.insert.right = [[s:cursor_grey, s:blue, 'bold'], [s:white, s:visual_grey]]

let s:palette.replace.left  = [[s:cursor_grey, s:red, 'bold'], [s:white, s:visual_grey]]
let s:palette.replace.right = [[s:cursor_grey, s:red, 'bold'], [s:white, s:visual_grey]]

let s:palette.visual.left  = [[s:cursor_grey, s:yellow, 'bold'], [s:white, s:visual_grey]]
let s:palette.visual.right = [[s:cursor_grey, s:yellow, 'bold'], [s:white, s:visual_grey]]

let s:palette.normal.middle   = [[s:white, s:cursor_grey]]
let s:palette.inactive.middle = [[s:white, s:cursor_grey]]

let s:palette.tabline.left   = [[s:white,       s:visual_grey]]
let s:palette.tabline.tabsel = [[s:cursor_grey, s:purple, 'bold']]
let s:palette.tabline.middle = [[s:white,       s:cursor_grey]]
let s:palette.tabline.right  = [[s:purple,      s:visual_grey, 'bold']]

let s:palette.normal.warning = [[s:cursor_grey, s:yellow]]
let s:palette.normal.error   = [[s:cursor_grey, s:red]]

let g:lightline#colorscheme#onedark#palette = lightline#colorscheme#flatten(s:palette)
