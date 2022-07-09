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
highlight! link EasyMotionIncCursorDefault Search

" commands prefix
noremap ; <Plug>(easymotion-prefix)

" ===============
" === FZF Vim ===
" ===============

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
highlight! link HighlightedyankRegion Search

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
highlight! link StartifyBracket StartifyNumber
highlight! link StartifySlash   StartifyPath

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
command! -bang -range CharTabularize call s:CharTabularize(<bang>0, <range>)

func! s:CharTabularize(add_zs, range)
    let s:command = a:range
        \ ? "'<,'>Tabularize /"
        \ : 'Tabularize /'

    let s:command .= nr2char(getchar())

    if a:add_zs
        " add \zs to command
        let s:command .= '\zs /l0'
    endif

    exec s:command
endfunc

" =================
" === UltiSnips ===
" =================

" disable expand trigger
let g:UltiSnipsExpandTrigger = '<Plug>(ultisnips-expand)'

" =============
" === Vimux ===
" =============

" vimux keybinds
nnoremap <Leader>Vk :VimuxRunCommand 'clear'<CR>
nnoremap <Leader>Vp :VimuxPromptCommand<CR>
nnoremap <Leader>Vl :VimuxRunLastCommand<CR>
nnoremap <Leader>Vq :VimuxCloseRunner<CR>
nnoremap <Leader>Vx :VimuxInterruptRunner<CR>
nnoremap <Leader>Vz :VimuxZoomRunner<CR>

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

" disable statusline
let g:VM_set_statusline = 0

" exit silently
let g:VM_silent_exit = 1

" set visual multi leader
let g:VM_leader = '<Leader>v'

" visual multi keybinds
let g:VM_maps = {}
let g:VM_maps['Select Cursor Down'] = '<M-J>'
let g:VM_maps['Select Cursor Up']   = '<M-K>'

" cursor highlights
let g:VM_Mono_hl   = 'TermCursor'
let g:VM_Extend_hl = 'Visual'
let g:VM_Cursor_hl = 'TermCursor'
let g:VM_Insert_hl = 'TermCursor'
