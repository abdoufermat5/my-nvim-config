require('plugins')
require('lsp-config')
require('completion')
require('treesitter-config')
require('telescope-config')
require('statusline-config')
require('nvim-tree-config')

-- Basic Neovim settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- Set colorscheme (install one first, e.g., 'gruvbox')
vim.o.background = "dark" -- or "light" for light version
vim.cmd([[colorscheme gruvbox]])

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})

-- Load the custom dashboard
local dashboard = require('custom_dashboard')

-- Set up the custom dashboard
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.line2byte('$') == -1 then
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(dashboard.get_dashboard(), '\n'))
      vim.cmd('setlocal nomodifiable nomodified')
    end
  end
})
