" ====================
" === Vim Settings ===
" ====================

" set title
set title

" titlestring format
if has('nvim')
  set titlestring=%t\ –\ nvim\ ◂\ %{strlen(&filetype)?&filetype:'none'}
else
  set titlestring=%t\ –\ vim\ ◂\ %{strlen(&filetype)?&filetype:'none'}
endif

" viminfo location
if !has('nvim')
  set viminfofile=~/.vim/viminfo
endif

" fold ellipsis
func! s:fold_text() abort
  return getline(v:foldstart) . ' …'
endfunc

" fold styling
set foldtext=<SID>fold_text()
set fillchars+=fold:\ "
set foldmethod=syntax
set foldlevelstart=99

" centralize files
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undos

" skip making backups in temp dirs
set backupskip=
set backupskip+=/tmp/*
set backupskip+=/private/tmp/*

" two spaces instead of tabs
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" search settings
set hlsearch
set ignorecase
set smartcase
set incsearch
set gdefault

" always show lines
set laststatus=2
set showtabline=2

" line numbers
set number
set numberwidth=4

" merge with signcolumn
set signcolumn=number

" show invisibles
set list
set listchars=tab:│\ ,trail:·

" scroll offset
set scrolloff=3
set sidescrolloff=3

" split pane to bottom right
set splitbelow
set splitright

" allowed backspacing
set backspace=indent,eol,start

" keep hidden buffers
set hidden

" retain cursor column
set nostartofline

" disable mouse
set mouse=

" text formatting
set formatoptions=tcqj

" split line
set fillchars+=vert:│

" scroll by single chars
set sidescroll=1

" update time
set updatetime=100

" keyword dashes
set iskeyword+=-

" shortmess options
set shortmess=atIF

" disable error bells
set belloff=all

" system clipboard
set clipboard=unnamed

" show window title
set title

" command completion
set wildmenu

" smart indenting
set smartindent

" highlight current line
set cursorline

" hide mode
set noshowmode

" disable wrapping
set nowrap

" disable conceal
set conceallevel=0
