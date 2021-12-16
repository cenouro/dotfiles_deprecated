set nocompatible
filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'pearofducks/ansible-vim'
Plug 'rakr/vim-one'
Plug 'tpope/vim-fugitive'
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

let g:lightline = { 'colorscheme': 'one' }
colorscheme one
set background=dark
call one#highlight('SpellBad', '', '', 'underline')
call one#highlight('SpellCap', '', '', 'underline')
call one#highlight('SpellLocal', '', '', 'underline')
call one#highlight('SpellRare', '', '', 'underline')
" Tweak colors used by 'set list' chars. See :h listchars
call one#highlight('SpecialKey', 'be5046', 'd19a66', '')

