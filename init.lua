require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'pearofducks/ansible-vim'
    use 'tpope/vim-bundler'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-projectionist'
    use 'tpope/vim-rake'
    use 'tpope/vim-sensible'

    use {
        'neovim/nvim-lspconfig',
        config = function() vim.opt.signcolumn = 'yes' end
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

-- LSP Configs and Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

require'lspconfig'.sorbet.setup({
    on_attach = on_attach,
    flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
    },
    cmd = {'bundle', 'exec', 'srb', 'tc', '--lsp', '--disable-watchman'}
})

