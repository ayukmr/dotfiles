" =================
" === Vim Setup ===
" =================

" better vim
set nocompatible

" background color
set background=dark

" syntax highlighting
syntax on

" equalize windows sizes
augroup equalize_windows
  au!
  au VimResized * wincmd =
augroup END

" disable line numbers in quickfix buffer
augroup quickfix_no_numbers
  au!
  au FileType qf setlocal nonumber
augroup END

" change cursor depending on mode
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[1 q"

" custom intro message
func! s:custom_intro() abort
  " return if file specified
  if argc() || line2byte('$') != -1
    return
  endif

  " buffer setup
  enew
  setlocal nonumber signcolumn=number
  setlocal bufhidden=wipe buftype=nofile
  setlocal nocursorcolumn nocursorline
  setlocal nolist noswapfile

  " highlight title
  highlight IntroTitle cterm=bold ctermfg=39 gui=bold guifg=#519fdf
  call matchadd('IntroTitle', '\v\zs. N?VIM v\d+\.\d+(\.\d+)?\ze')

  " map keys
  nnoremap <buffer> <silent> q :quitall!<CR>
  nnoremap <buffer> <silent> e :enew<CR>
  nnoremap <buffer> <silent> i :enew<CR>i

  " format version
  if has('nvim')
    let l:version = matchstr(execute('version'), '\vNVIM v\zs[^\n]+')
  else
    let l:version = v:version / 100 . '.' . v:version % 100
  endif

  " generate message
  let l:message = [
    \ (has('nvim') ? ' NVIM' : ' VIM') . ' v' . l:version, '',
  \] + systemlist('fortune -s computers')

  " centering height
  let l:height = float2nr(((winheight(0) / 1.25) - len(l:message)) / 2)

  " center text
  for _ in range(l:height)
    call append('$', '')
  endfor

  " append message lines
  for l:line in l:message
    call append('$', repeat(' ', (winwidth(0) - strchars(l:line)) / 2) . l:line)
  endfor

  " fill window height
  for _ in range(winheight(0) - l:height - len(l:message) - 1)
    call append('$', '')
  endfor

  " disable modifications
  setlocal nomodifiable nomodified
endfunc

" show custom intro
augroup custom_intro
  au!
  au VimEnter * call s:custom_intro()
augroup END
