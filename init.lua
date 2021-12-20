require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-fugitive'
end)

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

