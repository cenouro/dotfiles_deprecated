require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'pearofducks/ansible-vim'
    use 'tpope/vim-bundler'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-projectionist'
    use 'tpope/vim-rake'
    use 'tpope/vim-sensible'

    use {
        'neovim/nvim-lspconfig',
        config = function() require('config/nvim-lspconfig') end
    }
    use {
        'itchyny/lightline.vim',
        config = function()
            vim.g.lightline = {colorscheme = 'one'}
            vim.opt.showmode = false
        end
    }
    use {
        'rakr/vim-one',
        config = function()
            vim.cmd[[colorscheme one | set background=dark]]
            vim.fn['one#highlight']('SpecialKey', 'be5046', 'd19a66', '')
            vim.fn['one#highlight']('Whitespace', 'be5046', 'd19a66', '')
        end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline'
        },
        config = function() require('config/nvim-cmp') end
    }
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
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

