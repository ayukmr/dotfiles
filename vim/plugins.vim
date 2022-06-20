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
nnoremap <Leader>t :CharTabularize<CR>
vnoremap <Leader>t :CharTabularize<CR>

" tabularize with character and \zs
nnoremap <Leader>T :CharTabularize!<CR>
vnoremap <Leader>T :CharTabularize!<CR>

" tabularize with character
command! -bang -range CharTabularize call CharTabularize(<bang>0, <range>)

func! CharTabularize(add_zs, range)
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

" configurations for files
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

" exit silently
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
