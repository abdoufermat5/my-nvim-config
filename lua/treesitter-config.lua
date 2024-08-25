require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "python", "javascript", "c", "cpp" }, 
  highlight = {
    enable = true,
  },
}
