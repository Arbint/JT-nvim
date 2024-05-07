return
{ -- tree sitter
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    local config = require('nvim-treesitter.configs') 
    config.setup({
      -- for cpp to work, need to install mingw at https://sourceforge.net/projects/mingw-w64/files/    and you find x86_64-posix-sjIj 
      ensure_installed = {'lua','python','cpp'},
      highlight = {enabled = true},
      indent = {enable = true},
    })
  end,
}
