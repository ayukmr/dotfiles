" =====================
" === Vim Functions ===
" =====================

augroup write_utils
  " create parent directories when writing file
  auto BufWritePre * call s:MakeDirectories()
augroup END

" create parent directories for file
func! s:MakeDirectories()
  let dir = expand('%:p:h')

  " make sure dir isn't url-like
  if dir =~? '://'
    return
  endif

  if !isdirectory(dir)
    " create directory and parents
    call mkdir(dir, 'p')
  endif
endfunc

augroup xmlify
  auto!
  " run xmlify on binary-encoded plists
  auto BufEnter,WinEnter *.plist if system(['file', '-b', expand('%:p')]) =~# 'Apple binary property' | call s:XMLify() | endif
augroup END

func! s:XMLify()
  " get filename
  let s:image_file = @%

  bwipe
  enew

  " write xml to buffer
  put = system(['plutil', '-convert', 'xml1', '-o', '-', s:image_file])

  " remove empty lines
  1 delete 2

  set filetype=xml
endfunc
