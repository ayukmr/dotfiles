" =====================
" === Vifm Settings ===
" =====================

" vim command
set vicmd=anyvim

" use external commands
set syscalls

" use trash directory
set trash

" history and undos
set history=100
set undolevels=100

" automatically resolve symlinks
set nofollowlinks

" natural sort of version numbers in text
set sortnumbers

" use vim help file format
set vimhelp

" don't run executables on enter
set norunexec

" use terminal colors
colorscheme Default

" strftime format
set timefmt=%m/%d\ %H:%M

" command completion
set wildmenu
set wildstyle=popup

" use smart case
set ignorecase
set smartcase

" incrementally search
set incsearch

" scroll offset
set scrolloff=4

" prevent too many requests
set slowfs=curlftpfs

" vifm statusline
set statusline='  Vifm %= %t %A %E  '

" vifm info
set vifminfo=dhistory,savedirs,chistory,state,tui,shistory,
    \phistory,fhistory,dirstack,registers,bookmarks,bmarks
