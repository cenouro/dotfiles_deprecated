set nocompatible
filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
Plug 'tpope/vim-sensible'
call plug#end()

autocmd BufWritePre * :%s/\s\+$//e
set backspace=start,eol,indent
set cursorline
set diffopt+=algorithm:patience,indent-heuristic
set encoding=utf-8
set hidden
set list
set noswapfile nobackup
set number relativenumber
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent smartindent
set termguicolors

colorscheme one
set background=dark

