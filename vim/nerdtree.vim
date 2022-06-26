" ================
" === NERDTree ===
" ================

" highlight arrows
hi! link NERDTreeOpenable Red
hi! link NERDTreeClosable Red

" highlight slash the same as directories
hi! link NERDTreeDirSlash NERDTreeDir

" hide help ui
let NERDTreeMinimalUI = 1

" show hidden files by default
let NERDTreeShowHidden = 1

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

" =======================
" === NERDTree Colors ===
" =======================

" limited syntax
let g:NERDTreeLimitedSyntax = 1

" color folders
let g:WebDevIconsDefaultFolderSymbolColor     = '6bc1e5'
let g:WebDevIconsDefaultFolderSymbolColor     = '6bc1e5'
let g:WebDevIconsDefaultOpenFolderSymbolColor = '6bc1e5'

" file extension colors
let g:NERDTreeExtensionHighlightColor = {}

let g:NERDTreeExtensionHighlightColor['kt']     = 'b778db'
let g:NERDTreeExtensionHighlightColor['py']     = '99d76f'
let g:NERDTreeExtensionHighlightColor['go']     = '7fd7ff'
let g:NERDTreeExtensionHighlightColor['ts']     = '5fb7ff'
let g:NERDTreeExtensionHighlightColor['rs']     = 'dc6f4d'
let g:NERDTreeExtensionHighlightColor['jl']     = 'd195f4'
let g:NERDTreeExtensionHighlightColor['hs']     = 'b6a4ea'
let g:NERDTreeExtensionHighlightColor['clj']    = '63ce62'
let g:NERDTreeExtensionHighlightColor['cpp']    = '73bafa'
let g:NERDTreeExtensionHighlightColor['lua']    = '62acfc'
let g:NERDTreeExtensionHighlightColor['jsx']    = '82d7f7'
let g:NERDTreeExtensionHighlightColor['clj']    = 'a2ed8e'
let g:NERDTreeExtensionHighlightColor['less']   = '93b5fe'
let g:NERDTreeExtensionHighlightColor['toml']   = 'c788eb'
let g:NERDTreeExtensionHighlightColor['java']   = 'e58660'
let g:NERDTreeExtensionHighlightColor['diff']   = 'fe9764'
let g:NERDTreeExtensionHighlightColor['svelte'] = 'e87852'

let g:NERDTreeExtensionHighlightColor['sass'] = 'fe86b2'
let g:NERDTreeExtensionHighlightColor['scss'] = 'fe86b2'

let g:NERDTreeExtensionHighlightColor['json']  = 'ed884e'
let g:NERDTreeExtensionHighlightColor['jsonc'] = 'ed884e'

let g:NERDTreeExtensionHighlightColor['cson']   = 'de8987'
let g:NERDTreeExtensionHighlightColor['coffee'] = 'de8987'

let g:NERDTreeExtensionHighlightColor['rb']  = 'df5465'
let g:NERDTreeExtensionHighlightColor['erb'] = 'df5465'

let g:NERDTreeExtensionHighlightColor['db']  = 'e086ce'
let g:NERDTreeExtensionHighlightColor['sql'] = 'e086ce'

let g:NERDTreeExtensionHighlightColor['sh']   = '99d76f'
let g:NERDTreeExtensionHighlightColor['zsh']  = '99d76f'
let g:NERDTreeExtensionHighlightColor['vim']  = '99d76f'
let g:NERDTreeExtensionHighlightColor['bash'] = '99d76f'
let g:NERDTreeExtensionHighlightColor['tmux'] = '99d76f'

let g:NERDTreeExtensionHighlightColor['png']  = '74e3ed'
let g:NERDTreeExtensionHighlightColor['gif']  = '74e3ed'
let g:NERDTreeExtensionHighlightColor['jpg']  = '74e3ed'
let g:NERDTreeExtensionHighlightColor['jpeg'] = '74e3ed'
let g:NERDTreeExtensionHighlightColor['webp'] = '74e3ed'

" exact file colors
let g:NERDTreeExactMatchHighlightColor = {}

let g:NERDTreeExactMatchHighlightColor['brewfile'] = 'bc8b6f'

let g:NERDTreeExactMatchHighlightColor['gemfile']  = 'df5465'
let g:NERDTreeExactMatchHighlightColor['rakefile'] = 'df5465'

let g:NERDTreeExactMatchHighlightColor['node_modules'] = '8fca74'
let g:NERDTreeExactMatchHighlightColor['dropbox']      = '89bed6'
hi nerdtreeExactMatchFolder_node_modules ctermfg=114 guifg=#8fca74
hi nerdtreeExactMatchFolder_dropbox      ctermfg=110 guifg=#89bed6

let g:NERDTreeExactMatchHighlightColor['cargo.toml']   = 'c788eb'
let g:NERDTreeExactMatchHighlightColor['package.json'] = 'ed884e'

let g:NERDTreeExactMatchHighlightColor['.gitattributes'] = 'fe9764'
let g:NERDTreeExactMatchHighlightColor['.gitignore']     = 'fe9764'

let g:NERDTreeExactMatchHighlightColor['.git'] = 'fe9764'
silent! hi nerdtreeExactMatchFolder_.git ctermfg=209 guifg=#fe9764

let g:NERDTreePatternMatchHighlightColor = {}

let g:NERDTreePatternMatchHighlightColor['.*vimrc.*']  = '99d76f'
let g:NERDTreePatternMatchHighlightColor['.*gvimrc.*'] = '99d76f'

let g:NERDTreePatternMatchHighlightColor['.*webpack.*'] = '89befa'
