local lspconfig = require('lspconfig')

-- Example: Configure Python LSP
lspconfig.pyright.setup{}

-- Add more language servers as needed

-- Keybindings for LSP functions
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
