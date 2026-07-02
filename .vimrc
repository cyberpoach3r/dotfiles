set autoindent
set hidden
set hlsearch
set ignorecase
set incsearch
set nowrap
set number
set ruler
set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start

syntax enable

nnoremap Y y$
nnoremap j gj
nnoremap k gk

" display tab as >~~~
set list
set listchars=tab:>~

" setup undodir
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "p", 0700)
endif
set undodir=$HOME/.vim/undo-dir
set undofile
