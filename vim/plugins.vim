" ===================
" === Vim Plugins ===
" ===================

" ==================
" === Buffer Bye ===
" ==================

" delete buffer
nnoremap <silent> <Leader>q :Bdelete<CR>

" ================
" === DevIcons ===
" ================

" fix gvim spacing
let g:DevIconsAppendArtifactFix = 0

" opened/closed folder icon
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol                    = 'ﱮ'
let g:NERDTreeDirArrowExpandable  = ''
let g:NERDTreeDirArrowCollapsible = ''

" padding in nerdtree
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding  = ' '

" extension icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['kt']      = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts']      = 'ﯤ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cr']      = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['erb']     = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['toml']    = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['lock']    = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tmux']    = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svelte']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['textile'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['asc']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['adoc'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yml']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cson']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jsonc'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['scpt']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['applescript'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ttf'] = 'ﯔ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['otf'] = 'ﯔ'

" exact icons
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['brewfile']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['[plugins]'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.git']           = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore']     = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitattributes'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['cargo.toml']   = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*webpack.*']  = 'ﰩ'
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['\d;#FZF']      = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['NERD_Tree_\d'] = ''

" =====================
" === Expand Region ===
" =====================

" expand region mappings
vnoremap v <Plug>(expand_region_expand)
vnoremap V <Plug>(expand_region_shrink)

" ==================
" === EasyMotion ===
" ==================

" cursor color
hi! link EasyMotionIncCursorDefault Search

" commands prefix
noremap ; <Plug>(easymotion-prefix)

" ===============
" === FZF Vim ===
" ===============

augroup fzf_statusline
    auto!
    " set statusline in fzf
    auto User FzfStatusLine setlocal statusline=%#LightlineLeft_normal_0#\ FZF\ %#LightlineLeft_normal_0_1#%#LightlineLeft_normal_1#\ Fuzzy\ Finder\ %#LightlineLeft_normal_1_2#%#LightlineLeft_normal_2#
augroup END

" find files in directory above current directory
nnoremap <silent> <Leader>. :call fzf#vim#files(expand('%:h:h'), fzf#vim#with_preview())<CR>
" find files in home directory
nnoremap <Leader><leader> :Files ~<CR>

" fzf layout
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" ==================
" === Git Gutter ===
" ==================

" gitgutter symbols
let g:gitgutter_sign_added                   = '++'
let g:gitgutter_sign_modified                = '~~'
let g:gitgutter_sign_removed                 = '--'
let g:gitgutter_sign_removed_first_line      = '^^'
let g:gitgutter_sign_removed_above_and_below = '^_'
let g:gitgutter_sign_modified_removed        = '~-'

" disable clobbering
let g:gitgutter_sign_allow_clobber = 0

" ========================
" === Highlighted Yank ===
" ========================

" highlight color
hi! link HighlightedyankRegion Search

" mappings for vim
if !exists('##TextYankPost')
    nnoremap y <Plug>(highlightedyank)
    xnoremap y <Plug>(highlightedyank)
    onoremap y <Plug>(highlightedyank)
endif

" ===================
" === Indent Line ===
" ===================

" indent line character
let g:indentLine_char = '▎'

" indent line color
let g:indentLine_color_gui = '#2c323c'

" disable for certain buffers
let g:indentLine_fileTypeExclude = ['help', 'startify', 'nerdtree', 'fzf', 'vim-plug', 'Trouble']

" set conceal cursor
let g:indentLine_concealcursor = ''

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
    if !has('nvim')
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:errors = l:counts.error + l:counts.style_error
    else
        lua vim.g.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

        let l:errors = g:errors
        unlet g:errors
    endif

    return l:errors
endfunc

" linter warnings for lightline
func! LightlineWarnings()
    if !has('nvim')
        let l:counts = ale#statusline#Count(bufnr(''))

        let l:errors   = l:counts.error + l:counts.style_error
        let l:warnings = l:counts.total - l:errors
    else
        lua vim.g.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

        let l:warnings = g:warnings
        unlet g:warnings
    endif

    return l:warnings
endfunc

" add file icon to filetype
func! LightlineFiletype()
    return winwidth(0) > 70
        \ ? WebDevIconsGetFileTypeSymbol() . ' ' . (
        \     strlen(&filetype)
        \         ? &filetype
        \         : 'no ft'
        \ )
        \ : ''
endfunc

func! LightlineTabChars()
    let s = ''

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
    \     ['errors', 'warnings'],
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

let s:red         = [ s:colors.red.gui, s:term_red                 ]
let s:green       = [ s:colors.green.gui, s:term_green             ]
let s:yellow      = [ s:colors.yellow.gui, s:term_yellow           ]
let s:blue        = [ s:colors.blue.gui, s:term_blue               ]
let s:purple      = [ s:colors.purple.gui, s:term_purple           ]
let s:white       = [ s:colors.white.gui, s:term_white             ]
let s:cursor_grey = [ s:colors.cursor_grey.gui, s:term_cursor_grey ]
let s:visual_grey = [ s:colors.visual_grey.gui, s:term_visual_grey ]

let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

let s:p.normal.left     = [[ s:cursor_grey, s:green ], [ s:white, s:visual_grey ]]
let s:p.normal.right    = [[ s:cursor_grey, s:green ], [ s:white, s:visual_grey ]]

let s:p.inactive.left   = [[ s:cursor_grey, s:white ], [ s:cursor_grey, s:white ]]
let s:p.inactive.right  = [[ s:cursor_grey, s:white ], [ s:cursor_grey, s:white ]]

let s:p.insert.left     = [[ s:cursor_grey, s:blue ], [ s:white, s:visual_grey ]]
let s:p.insert.right    = [[ s:cursor_grey, s:blue ], [ s:white, s:visual_grey ]]

let s:p.replace.left    = [[ s:cursor_grey, s:red ], [ s:white, s:visual_grey ]]
let s:p.replace.right   = [[ s:cursor_grey, s:red ], [ s:white, s:visual_grey ]]

let s:p.visual.left     = [[ s:cursor_grey, s:yellow ], [ s:white, s:visual_grey ]]
let s:p.visual.right    = [[ s:cursor_grey, s:yellow ], [ s:white, s:visual_grey ]]

let s:p.normal.middle   = [[ s:white, s:cursor_grey ]]
let s:p.inactive.middle = [[ s:white, s:cursor_grey ]]

let s:p.tabline.left    = [[ s:white, s:visual_grey  ]]
let s:p.tabline.tabsel  = [[ s:cursor_grey, s:purple ]]
let s:p.tabline.middle  = [[ s:white, s:cursor_grey  ]]
let s:p.tabline.right   = [[ s:purple, s:visual_grey ]]

let s:p.normal.warning  = [[ s:cursor_grey, s:yellow ]]
let s:p.normal.error    = [[ s:cursor_grey, s:red    ]]

let g:lightline#colorscheme#onedark#palette = lightline#colorscheme#flatten(s:p)

" ================
" === Startify ===
" ================

" enable devicons for startify
func! StartifyEntryFormat()
    return "WebDevIconsGetFileTypeSymbol(absolute_path) . ' ' . entry_path"
endfunc

" startify header
let g:startify_custom_header = startify#pad([
    \ '                  ##        .    ',
    \ '            ## ## ##       ==    ',
    \ '         ## ## ## ##      =====/ ',
    \ '     /""""""""""""""""___/  /    ',
    \ '~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ ~~ ~~~',
    \ '     \_____  o          __/      ',
    \ '      \    \         __/         ',
    \ '        \____\______/            ',
\])

" starting commands
let g:startify_commands = [
    \ { 'ff': 'Files'       },
    \ { 'fh': 'History'     },
    \ { 'pi': 'PlugInstall' },
    \ { 'pc': 'PlugClean!'  },
\]

" bookmarked files
let g:startify_bookmarks = [
    \ { 'vs': '~/.cfg/vim/setup.vim'    },
    \ { 'vp': '~/.cfg/vim/plugins.vim'  },
\]

" list headers
let g:startify_lists = [
    \ { 'type': 'dir',       'header': startify#pad(['ﱮ Files'    ])},
    \ { 'type': 'sessions',  'header': startify#pad([' Sessions' ])},
    \ { 'type': 'bookmarks', 'header': startify#pad([' Bookmarks'])},
    \ { 'type': 'commands',  'header': startify#pad([' Commands' ])},
\]

" don't change to file directory
let g:startify_change_to_dir = 0

" colors
hi! link StartifyBracket StartifyNumber
hi! link StartifySlash   StartifyPath

" ===============
" === Tabular ===
" ===============

" tabularize with character
nnoremap <Leader>t :TabularizeChar<CR>
vnoremap <Leader>t :TabularizeChar<CR>

" tabularize with character and \zs
nnoremap <Leader>T :TabularizeChar!<CR>
vnoremap <Leader>T :TabularizeChar!<CR>

" tabularize with character
command! -bang -range TabularizeChar call TabularizeChar(<bang>0, <range>)

func! TabularizeChar(add_zs, range)
    let s:command = a:range
        \ ? "'<,'>Tabularize /"
        \ : 'Tabularize /'

    let s:command .= nr2char(getchar())

    if a:add_zs
        " add \zs to command
        let s:command .= '\zs'
    endif

    exec s:command
endfunc

" ==================
" === Vimspector ===
" ==================

" vimspector keybinds
nnoremap <Leader>VR :VimspectorReset<CR>
nnoremap <Leader>Vr <Plug>VimspectorRestart
nnoremap <Leader>Vc <Plug>VimspectorContinue
nnoremap <Leader>Vs <Plug>VimspectorStop
nnoremap <Leader>Vp <Plug>VimspectorPause
nnoremap <Leader>Vb <Plug>VimspectorToggleBreakpoint
nnoremap <Leader>Vf <Plug>VimspectorAddFunctionBreakpoint
nnoremap <Leader>Vo <Plug>VimspectorStepOver
nnoremap <Leader>Vi <Plug>VimspectorStepInto

" vimspector signs
sign define vimspectorBP            text=>> texthl=DiagnosticSignInfo
sign define vimspectorBPCond        text=?? texthl=DiagnosticSignInfo
sign define vimspectorBPLog         text=-- texthl=DiagnosticSignWarn
sign define vimspectorBPDisabled    text=!! texthl=NonText
sign define vimspectorPC            text=## texthl=DiagnosticSignInfo linehl=CursorLine
sign define vimspectorPCBP          text=#> texthl=Question           linehl=CursorLine
sign define vimspectorCurrentThread text=>> texthl=DiagnosticSignInfo linehl=CursorLine
sign define vimspectorCurrentFrame  text=>> texthl=DiagnosticSignInfo linehl=CursorLine

let g:vimspector_configurations = {
    \ 'node': {
    \     'adapter':   'vscode-node',
    \     'filetypes': ['javascript', 'typescript'],
    \     'configuration': {
    \         'request':     'launch',
    \         'protocol':    'auto',
    \         'console':     'integratedTerminal',
    \         'program':     '${file}',
    \         'stopOnEntry': v:true,
    \     }
    \ },
    \ 'debugpy': {
    \     'adapter':   'debugpy',
    \     'filetypes': ['python'],
    \     'configuration': {
    \         'request':     'launch',
    \         'program':     '${file}',
    \         'stopOnEntry': v:true,
    \     }
    \ },
\}

" =============
" === Vimux ===
" =============

" vimux keybinds
nnoremap <Leader>vk :VimuxRunCommand 'clear'<CR>
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>
nnoremap <Leader>vx :VimuxInterruptRunner<CR>
nnoremap <Leader>vz :VimuxZoomRunner<CR>

" command prompt
let g:VimuxPromptString = '$ '

" ================
" === Vim Plug ===
" ================

augroup plug_nonumber
    auto!
    " disable line numbers in vim plug buffer
    auto FileType vim-plug setlocal nonumber
augroup END

" ====================
" === Visual Multi ===
" ====================

" don't show infoline
let g:VM_set_statusline = 0
let g:VM_silent_exit = 1

" add cursors up and down
let g:VM_maps = {}
let g:VM_maps['Select Cursor Down'] = '<M-J>'
let g:VM_maps['Select Cursor Up']   = '<M-K>'

" multi cursor highlight
let g:VM_Mono_hl   = 'TermCursor'
let g:VM_Extend_hl = 'Visual'
let g:VM_Cursor_hl = 'TermCursor'
let g:VM_Insert_hl = 'TermCursor'
