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

" ===============
" === FZF Vim ===
" ===============

" find files in directory above current directory
nnoremap <silent> <Leader>. :call fzf#vim#files(expand('%:h:h'), fzf#vim#with_preview())<CR>

" find files in home directory
nnoremap <Leader><Leader> :Files ~<CR>

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

" hunk movement
nnoremap [g :GitGutterPrevHunk<CR>
nnoremap ]g :GitGutterNextHunk<CR>

" ========================
" === Highlighted Yank ===
" ========================

" highlight color
highlight! link HighlightedyankRegion Search

" mapping for vim
if !exists('##TextYankPost')
    noremap y <Plug>(highlightedyank)
endif

" ===================
" === Indent Line ===
" ===================

" indent line character
let g:indentLine_char = '▎'

" indent line color
let g:indentLine_color_gui = '#2c323c'

" disable for certain buffers
let g:indentLine_fileTypeExclude = ['help', 'startify', 'nerdtree', 'fzf', 'vim-plug', 'Trouble', 'lsp-installer']

" set conceal cursor
let g:indentLine_concealcursor = ''

" ================
" === NERDTree ===
" ================

" hide help ui
let NERDTreeMinimalUI = 1

" show hidden files by default
let NERDTreeShowHidden = 1

" disable folder arrows
let g:NERDTreeDirArrowExpandable  = ''
let g:NERDTreeDirArrowCollapsible = ''

" highlight slash the same as directories
highlight! link NERDTreeDirSlash NERDTreeDir

" icon highlights
highlight! link NERDTreeFlags Title

" toggle nerdtree
nnoremap <silent> <C-t> :call g:NERDTreeCreator.ToggleTabTree(expand('%:h'))<CR>

augroup nerdtree_utils
    auto!
    " close tab if nerdtree is the last buffer
    auto BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

augroup nerdtree_conceal
    auto!
    " set vars in nerdtree buffer
    auto Filetype nerdtree   call s:NERDTreeSetVars()
    auto BufEnter,WinEnter * call s:NERDTreeSetVars()
augroup END

func! s:NERDTreeSetVars() abort
    " get nerdtree winnr
    let nerdtree_winnr = index(
    \   map(
    \       range(1, winnr('$')),
    \       { _, v -> getbufvar(winbufnr(v), '&filetype') }
    \   ),
    \   'nerdtree'
    \) + 1

    " set concealcursor
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&concealcursor', 'nvic') })
endfunc

" ===================
" === Quick Scope ===
" ===================

" only highlight on motion
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" character highlights
highlight QuickScopePrimary   cterm=underline ctermfg=39  gui=underline guifg=#61afef
highlight QuickScopeSecondary cterm=underline ctermfg=170 gui=underline guifg=#c678dd

" =============
" === Sneak ===
" =============

" absolute sneak direction
let g:sneak#absolute_dir = 1

" sneak labels
let g:sneak#label = 1
let g:sneak#target_labels = 'asdgqwertyuiopzxcvbnmfASDGHKLQWERTYUIOPZXCVBNMFJ'

" sneak highlights
highlight! link Sneak          WildMenu
highlight! link SneakScope     Cursor
highlight! link SneakLabel     WildMenu
highlight! link SneakLabelMask Fg

" sneak movement
noremap [s <Plug>Sneak_,
noremap ]s <Plug>Sneak_;

" ================
" === Startify ===
" ================

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

" enable devicons for startify
func! StartifyEntryFormat()
    return "WebDevIconsGetFileTypeSymbol(absolute_path) . ' ' . entry_path"
endfunc

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
    " use '<,'> for visual selection
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

" ==================
" === Unimpaired ===
" ==================

" switch tabs
nnoremap [t gT
nnoremap ]t gt

" ================
" === Vim Plug ===
" ================

augroup plug_no_numbers
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
let g:VM_maps['Select Cursor Down'] = '<M-j>'
let g:VM_maps['Select Cursor Up']   = '<M-k>'

" cursor highlights
let g:VM_Mono_hl   = 'Cursor'
let g:VM_Cursor_hl = 'Cursor'
let g:VM_Insert_hl = 'Cursor'
let g:VM_Extend_hl = 'Visual'

" search highlight
let g:VM_highlight_matches = ''
