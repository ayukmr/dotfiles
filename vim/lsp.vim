" ===============
" === Vim LSP ===
" ===============

" ===================
" === ALE Linting ===
" ===================

" colors
hi! link ALEWarningSign WarningMsg
hi ALEInfo cterm=underline ctermfg=39 gui=underline guifg=#61afef
hi ALEInfoSign ctermfg=39 guifg=#61afef

" error and warning signs
let g:ale_sign_error   = '>>'
let g:ale_sign_warning = '--'

" message format
let g:ale_echo_msg_format = '[%linter%] %s'

" coc support
let g:ale_disable_lsp = 1

" ===============
" === CoC LSP ===
" ===============

" config file location
let g:coc_config_home = '~/.cfg/vim'

" show suggestions
inoremap <silent><expr> <M-CR> coc#refresh()

" accept suggestion
inoremap <silent><expr> <CR>
    \ pumvisible()
        \ ? coc#_select_confirm()
        \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" : "\<Tab>"

inoremap <silent><expr> <S-Tab>
    \ pumvisible() ? "\<C-p>" : "\<C-h>"

" coc extensions
let g:coc_global_extensions = [
    \ 'coc-pyright',
    \ 'coc-rust-analyzer',
    \ 'coc-snippets',
    \ 'coc-solargraph',
    \ 'coc-tsserver',
\]
