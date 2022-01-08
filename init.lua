require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-fugitive'
    use {
        'rakr/vim-one',
        config = function() vim.cmd[[
            colorscheme one | set background=dark
            call one#highlight('SpecialKey', 'be5046', 'd19a66', '')
            call one#highlight('Whitespace', 'be5046', 'd19a66', '')
            ]]
        end
    }
end)

vim.cmd([[
augroup packer_auto_sync
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
augroup end
]])

vim.cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

local opt = vim.opt
opt.cursorline = true
opt.diffopt:append({'algorithm:patience', 'indent-heuristic'})
opt.fileencoding = 'utf-8'
opt.list = true
opt.number = true; opt.relativenumber = true
opt.smartindent = true
opt.swapfile = false; opt.backup = false
opt.tabstop = 4; opt.shiftwidth = 4; opt.softtabstop = 4; opt.expandtab = true
opt.termguicolors = true

vim.cmd([[
augroup ft_git
    autocmd!
    autocmd BufNewFile,BufRead gitconfig setlocal filetype=gitconfig
    autocmd FileType gitcommit setlocal spell spelllang=en_us
    autocmd FileType git,gitcommit,fugitive setlocal nolist
augroup END
]])

