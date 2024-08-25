require('nvim-tree').setup{}

-- Keybinding to toggle file explorer
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})
