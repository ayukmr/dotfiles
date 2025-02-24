" ====================
" === Vim Commands ===
" ====================

" wrap text
func! Wrap() abort
  " enable wrapping
  set wrap linebreak

  " move visually
  noremap j gj
  noremap k gk
  noremap 0 g0
  noremap ^ g^
  noremap $ g$
endfunc

command Wrap :call Wrap()

" disable wrapping
func! NoWrap() abort
  " disable wrapping
  set nowrap nolinebreak

  " move normally
  nunmap j
  nunmap k
  nunmap 0
  nunmap ^
  nunmap $
endfunc

command NoWrap :call NoWrap()
