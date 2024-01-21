" ====================
" === Vim Settings ===
" ====================

" set title
set title

" set titlestring
if has('nvim')
  set titlestring=%t\ –\ nvim\ ◂\ %{strlen(&filetype)?&filetype:'none'}
else
  set titlestring=%t\ –\ vim\ ◂\ %{strlen(&filetype)?&filetype:'none'}
endif

" set viminfo location
if !has('nvim')
  set viminfofile=~/.vim/viminfo
endif

" disable inserting comments
augroup disable_comments
  auto!
  auto BufEnter * set formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" fold ellipsis
func! s:fold_text()
  return getline(v:foldstart) . ' …'
endfunc

" fold styling
set foldtext=<SID>fold_text()
set fillchars=fold:\ 
set foldmethod=syntax
set foldlevelstart=2

" centralize directories
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

" always show statusline and tabline
set laststatus=2
set showtabline=2

" line numbers
set number
set relativenumber
set numberwidth=4

" merge with signcolumn
set signcolumn=number

" show invisibles
set listchars=tab:»\ ,trail:·
set list

" split pane to bottom right
set splitbelow
set splitright

" keep hidden buffers
set hidden

" disable mouse
set mouse=

" shortmess options
set shortmess=atI

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

" don't show mode
set noshowmode

" don't wrap lines
set nowrap

" conceal level
set conceallevel=2

" scroll offset
set scrolloff=3
